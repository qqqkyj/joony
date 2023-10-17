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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardWriteController {
	
	@Autowired
	BoardDao dao;
	
	@GetMapping("/board/writeform")
	public ModelAndView form(
			@RequestParam Map<String, String> map) {
		
		ModelAndView mv = new ModelAndView();
		
		//아래 5개는 댓글일 경우에만 넘어오고 새글인 경우 넘어오지 않는다.
		String currentPage=map.get("currentPage");
		String num=map.get("num");
		String regroup=map.get("regroup");
		String restep=map.get("restep");
		String relevel=map.get("relevel");
		
		System.out.println(currentPage+","+num+","+regroup+","+restep+","+relevel);
		
		//입력폼에 hidden으로 넣어줘야됨..댓글일 경우
		mv.addObject("currentPage", currentPage==null?"1":currentPage);
		mv.addObject("num", num==null?"0":num);
		mv.addObject("regroup", regroup==null?"0":regroup);
		mv.addObject("restep", restep==null?"0":restep);
		mv.addObject("relevel", relevel==null?"0":relevel);
		
		System.out.println(currentPage+","+num+","+regroup+","+restep+","+relevel);
		
		//0으로 넣어야 dao에서 새글로 인식
		//폼이 댓글,새글 공용이므로
		
		mv.setViewName("reboard/writeform");
		
		return mv;
	}
	

	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam String currentPage,
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
		}
		
		System.out.println(photo);
		
		
		dto.setPhoto(photo);
		
		//insert
		dao.insertReboard(dto);
		
		int num=dao.getMaxNum();
		
		return "redirect:content?num="+num+"&currentPage="+currentPage;//content가 없어서 목록으로 이동
	}
	
	
}
