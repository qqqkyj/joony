package board.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardUpdateController {
	
	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/updatepassform")
	public ModelAndView upassform(
			@RequestParam String num,
			@RequestParam String currentPage) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("num", num);
		mv.addObject("currentPage", currentPage);
		
		mv.setViewName("reboard/updatepassform");
		
		return mv;
	}
	
	@PostMapping("/board/updatepass")
	public String upasscheck(@RequestParam String num, @RequestParam String pass, @RequestParam String currentPage, Model m) {

		//비번 맞으면 수정폼 틀리면 passfail로 이동
		int check = dao.getCheckPass(num,pass);
		
		if(check==1) {
			
			BoardDto dto = dao.getBoard(String.valueOf(num));
			
			m.addAttribute("dto", dto);
			m.addAttribute("currentPage", currentPage);
			
			return "reboard/updateform";
		}else {
			return "reboard/passfail";
		}
		
	}
	
	@PostMapping("/board/update")
	public String update(@ModelAttribute BoardDto dto, @RequestParam String currentPage,
			@RequestParam ArrayList<MultipartFile> uimage,
			HttpSession session) {
		
		
		//실제경로
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
				
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
				
		String photo="";
				
		//입력된 사진이 없다면 no, 아니라면 파일의 이름을 디비에 저장
		if(uimage.get(0).getOriginalFilename().equals(""))
			photo="no";
		else { 
			
			//수정전 이전 사진 지우기
			String pre_photo = dao.getBoard(String.valueOf(dto.getNum())).getPhoto();
			
			String[] pre_fName=pre_photo.split(",");
			for(String f:pre_fName) {
				File file = new File(path+"/"+f);
				file.delete();
			}
			
			for(MultipartFile f:uimage) {
				
				String fName = sdf.format(new Date())+f.getOriginalFilename();
				photo+=fName+",";
						
				try {
					f.transferTo(new File(path+"/"+fName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
						
			}
			
			//photo에서 마지막 콤마(,)제거
			photo = photo.substring(0, photo.length()-1);
			System.out.println(photo);
			
		}		
				
		dto.setPhoto(photo);
		
		dao.updateBoard(dto);
		
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
	
}
