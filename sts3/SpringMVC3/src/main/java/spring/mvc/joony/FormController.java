package spring.mvc.joony;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.FormDto;

@Controller
public class FormController {
	
	//myforms가 나오게 포워드 할 것!!
	@GetMapping("/data/myform")
	public String myform() {
		return "myforms";
	}
	
	//read1_get방식폼 전송
	@GetMapping("/data/read1")//int myage로 바로 형변환도 가능
	public ModelAndView read1(String myname, String myage, @RequestParam(value = "msg", defaultValue = "HappyDay!!!")String msg) {//@RequestParam(myname) String name
		
		ModelAndView mv = new ModelAndView();
		
		//request에 저장
		mv.addObject("name", myname);
		mv.addObject("age", myage);
		mv.addObject("msg", msg);
		
		//forward
		mv.setViewName("process1");
		
		return mv;
	}
	
	//read2_post방식폼 전송
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute FormDto dto) {
		ModelAndView mv = new ModelAndView();
		
		//request에 저장
		mv.addObject("dto",dto);
		
		//forward
		mv.setViewName("process2");
		
		return mv;
	}
	
	@PostMapping("/data/read3")
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		
		ModelAndView mv = new ModelAndView();
		
		String sang = map.get("sang");
		String price = map.get("price");
		String data = sang+"의 가격은"+price+"입니다.";
		
		mv.addObject("data", data);
		
		mv.setViewName("process3");
		
		return mv;
	}
}
