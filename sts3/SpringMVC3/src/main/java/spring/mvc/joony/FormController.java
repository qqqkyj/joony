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
	
	//myforms�� ������ ������ �� ��!!
	@GetMapping("/data/myform")
	public String myform() {
		return "myforms";
	}
	
	//read1_get����� ����
	@GetMapping("/data/read1")//int myage�� �ٷ� ����ȯ�� ����
	public ModelAndView read1(String myname, String myage, @RequestParam(value = "msg", defaultValue = "HappyDay!!!")String msg) {//@RequestParam(myname) String name
		
		ModelAndView mv = new ModelAndView();
		
		//request�� ����
		mv.addObject("name", myname);
		mv.addObject("age", myage);
		mv.addObject("msg", msg);
		
		//forward
		mv.setViewName("process1");
		
		return mv;
	}
	
	//read2_post����� ����
	@PostMapping("/data/read2")
	public ModelAndView read2(@ModelAttribute FormDto dto) {
		ModelAndView mv = new ModelAndView();
		
		//request�� ����
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
		String data = sang+"�� ������"+price+"�Դϴ�.";
		
		mv.addObject("data", data);
		
		mv.setViewName("process3");
		
		return mv;
	}
}
