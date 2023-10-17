package board.data.controller;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardContentController {
	
	@Autowired
	BoardDao dao;
	
	
	@GetMapping("/board/content")
	public String content(@RequestParam Map<String, String> map, Model model) {		
		
		//조회수 증가
		dao.updateReadCount(map.get("num"));
		
		BoardDto dto = dao.getBoard(map.get("num"));
		
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", map.get("currentPage"));
		
		return "reboard/content";
	}
}
