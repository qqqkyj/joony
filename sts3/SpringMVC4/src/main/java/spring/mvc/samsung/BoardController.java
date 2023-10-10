package spring.mvc.samsung;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")//중간경로를 미리 mapping, 단점은 board파일만 넣을 수 있음
public class BoardController {
	
	//String의 자료형은 forward만 한다는 뜻
	@GetMapping("/board/form1")
	public String form1() {
		return "board/writeForm";
	}
	
	@PostMapping("/board/process")
	public ModelAndView process1(@RequestParam String name, 
			@RequestParam String date, 
			@RequestParam String gender,
			//defaultValue는 받아올 인자값이 없을 경우 default로 입력한 값을 출력
			//@RequestParam(defaultValue = "행복한 하루 보내세요!!")String msg)
			//required = true가 기본값, 항목이 없어도 에러가 안나게 하려면 false
			@RequestParam(required = false)String msg,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("name", name);
		mv.addObject("date", date);
		mv.addObject("gender", gender);
		mv.addObject("msg", msg);
		mv.addObject("currentPage", currentPage);
		
		mv.setViewName("board/result");
		
		return mv;
	}
	
	@GetMapping("/result2")
	public String result2(Model model) {
		
		model.addAttribute("myimg1", "../image/cat.gif");
		model.addAttribute("title", "좋아하는 이미지");
		
		return "board/result2";
	}

}
