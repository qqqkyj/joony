package spring.mvc.samsung;

import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import spring.data.dto.ShopDto;

@Controller
public class ShopController {
	
	@GetMapping("/shop/list")
	public String result3() {
		return "shop/list";
	}
	
	@GetMapping("/shop/form2")
	public String form2() {
		return "shop/shopForm";
	}
	
	@PostMapping("/shop/process2")
	//default이름은 shopDto but //(@ModelAttribute("dto") ShopDto dto)일 경우 dto로 사용가능
	public String process2(@ModelAttribute ShopDto dto) {
		
		return "shop/shopResult";
	}
	
	@GetMapping("/shop/form3")
	public String form3() {
		return "shop/mapForm";
	}
	
	@PostMapping("/shop/process3")
	public ModelAndView process3(@RequestParam Map<String, String> map) {
		
		ModelAndView mv = new ModelAndView();
		
		/*
		 * mv.addObject("name", map.get("name")); mv.addObject("java", map.get("java"));
		 * mv.addObject("spring", map.get("spring")); mv.addObject("jquery",
		 * map.get("jquery"));
		 */
		
		mv.addAllObjects(map);

		mv.setViewName("shop/mapResult");
		
		return mv;
	}
}
