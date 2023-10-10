package spring.mvc.quiz;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.dto.SangDto;

@Controller
public class QuizController {
	
	@GetMapping("/ilike/movie")
	public String form1() {
		return "form";
	}
	
	@GetMapping("school/myinfo")
	public String form2() {
		return "form";
	}
	
	@GetMapping("shop/ipgo")
	public String form3() {
		return "form";
	}
	
	@GetMapping("myshinsang")
	public String form4() {
		return "form";
	}
	
	@GetMapping("/ilike/result1")
	public ModelAndView result1(String msg) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", msg);
		
		mv.setViewName("result1");
		
		return mv;
	}
	
	@GetMapping("/school/result2")
	public ModelAndView result2(String name, String school, String grade, String addr) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("name", name);
		mv.addObject("school", school);
		mv.addObject("grade", grade);
		mv.addObject("addr", addr);
		
		mv.setViewName("result2");
		
		return mv;
	}
	
	@PostMapping("/shop/result3")
	public String result3(@ModelAttribute SangDto dto) {
		
		return "result3";
	}
	
	@PostMapping("/result4")
	public ModelAndView result4(@RequestParam Map<String, String> map) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addAllObjects(map);
		
		mv.setViewName("result4");
		
		return mv;
	}
}
