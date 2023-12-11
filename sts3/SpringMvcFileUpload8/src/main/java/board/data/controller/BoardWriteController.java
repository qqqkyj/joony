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
		
		//�Ʒ� 5���� ����� ��쿡�� �Ѿ���� ������ ��� �Ѿ���� �ʴ´�.
		String currentPage=map.get("currentPage");
		String num=map.get("num");
		String regroup=map.get("regroup");
		String restep=map.get("restep");
		String relevel=map.get("relevel");
		
		System.out.println(currentPage+","+num+","+regroup+","+restep+","+relevel);
		
		//�Է����� hidden���� �־���ߵ�..����� ���
		mv.addObject("currentPage", currentPage==null?"1":currentPage);
		mv.addObject("num", num==null?"0":num);
		mv.addObject("regroup", regroup==null?"0":regroup);
		mv.addObject("restep", restep==null?"0":restep);
		mv.addObject("relevel", relevel==null?"0":relevel);
		
		System.out.println(currentPage+","+num+","+regroup+","+restep+","+relevel);
		
		//0���� �־�� dao���� ���۷� �ν�
		//���� ���,���� �����̹Ƿ�
		
		mv.setViewName("reboard/writeform");
		
		return mv;
	}
	

	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam String currentPage,
			@RequestParam ArrayList<MultipartFile> uimage,
			HttpSession session) {
		
		//�������
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo="";
		
		//�Էµ� ������ ���ٸ� no, �ƴ϶�� ������ �̸��� ��� ����
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
		
		//photo���� ������ �޸�(,)����
		photo = photo.substring(0, photo.length()-1);
		}
		
		System.out.println(photo);
		
		
		dto.setPhoto(photo);
		
		//insert
		dao.insertReboard(dto);
		
		int num=dao.getMaxNum();
		
		return "redirect:content?num="+num+"&currentPage="+currentPage;//content�� ��� ������� �̵�
	}
	
	
}