package board.data.controller;

import java.io.File;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;

@Controller
public class BoardDeleteController {
	
	@Autowired
	BoardDao dao;

	@GetMapping("/board/deletepassform")
	public ModelAndView delpassform(
			@RequestParam String num,
			@RequestParam String currentPage) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("num", num);
		mv.addObject("currentPage", currentPage);
		
		mv.setViewName("reboard/delpassform");
		
		return mv;
	}
	
	@PostMapping("/board/deletepass")
	public String delete(@RequestParam String num, @RequestParam String currentPage, @RequestParam String pass,
			HttpSession session, Model model) {
		
		if(dao.getCheckPass(num, pass)==1) {
			
			//실제경로
			String path = session.getServletContext().getRealPath("/WEB-INF/photo");
			
			//삭제전 이전 사진 지우기
			String pre_photo = dao.getBoard(num).getPhoto();
			
			String[] pre_fName=pre_photo.split(",");
			for(String f:pre_fName) {
				File file = new File(path+"/"+f);
				file.delete();
			}
			
			dao.deleteBoard(num);
			
			model.addAttribute("currentPage", currentPage);
			
			return "redirect:list";
			
		}else {
			return "reboard/passfail";
		}
	
	}
	
}
