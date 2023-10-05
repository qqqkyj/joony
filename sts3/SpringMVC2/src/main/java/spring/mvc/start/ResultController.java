package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {
	//@GetMapping("/apple/list.do")//는 .do만 찾아올 수 있음
	@GetMapping("/apple/list")//list뒤에 .do나 다른 확장자를 붙히던 다 호출됨
	public String result1(Model model) {
		model.addAttribute("myname", "홍길동");
		model.addAttribute("myhp", "010-1234-1231");
		return "result1";
	}
	
	@GetMapping("/banana/insert")
	public ModelAndView banana() {
		//ModelAndView는 request에 저장하기 위한 Model과
		//포워드 하기위한 View를 합쳐놓은 클래스입니다.
		ModelAndView mview = new ModelAndView();
		
		//request에 저장
		mview.addObject("java",88);
		mview.addObject("spring", 99);
		
		//forward할 jsp파일지정
		mview.setViewName("result2");
		
		
		return mview;
	}
	
	@GetMapping("orange/delete")
	public ModelAndView orange() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("sangpum", "이클립스");
		mv.addObject("color", "pink");
		mv.addObject("price", 3000);
		
		mv.setViewName("result3");
		
		return mv;
	}
	
	@GetMapping("/shop/detail")
	public String resImage() {
		return "result4";
	}
	
	@GetMapping("board/insert/data")
	public String resImage2() {
		return "result5";
	}
}
