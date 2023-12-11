package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class quizController {
	
	@GetMapping("/happy")
	public String quiz1() {
		return "quiz1";
	}
	
	@GetMapping("/hello")
	public ModelAndView quiz2() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("msg", "이것은 메시지입니다.");
		
		mv.setViewName("quiz2");
		
		return mv;
	}
	
	@GetMapping("/nice/hi")
	public ModelAndView quiz3() {
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("name", "홍길동");
		mv.addObject("age", 42);
		mv.addObject("addr", "강남구 역삼동");
		
		mv.setViewName("quiz3");
		
		return mv;
	}
}
