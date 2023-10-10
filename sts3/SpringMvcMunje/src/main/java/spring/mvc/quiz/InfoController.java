package spring.mvc.quiz;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import spring.data.dto.InfoDto;

@Controller
public class InfoController {
	
	@GetMapping("/info/form")
	public String form() {
		return "info/infoForm";
	}
	
	@PostMapping("/info/result")
	public String result(@ModelAttribute("dto") InfoDto dto) {
		return "info/infoWrite";
	}
	

}
