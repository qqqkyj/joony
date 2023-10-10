package spring.mvc.quiz;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.SangDto;

@Controller
public class QuizController {
	
	@GetMapping("/ilike/movie")
	public String form() {
		return "/form";
	}
	
	@GetMapping("/quiz/result1")
	public ModelAndView result1(String msg) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", msg);
		
		mv.setViewName("result1");
		
		return mv;
	}
	
	@GetMapping("/quiz/result2")
	public ModelAndView result2(String name, String school, String grade, String addr) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("name", name);
		mv.addObject("school", school);
		mv.addObject("grade", grade);
		mv.addObject("addr", addr);
		
		mv.setViewName("result2");
		
		return mv;
	}
	
	@PostMapping("/quiz/result3")
	public ModelAndView result3(@RequestParam SangDto dto) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("dto",dto);
		
		mv.setViewName("result3");
		
		return mv;
	}
	
	@PostMapping("/quiz/result4")
	public ModelAndView result4(@RequestParam Map<String, String> map) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("map", map);
		
		mv.setViewName("result4");
		
		return mv;
	}
}
