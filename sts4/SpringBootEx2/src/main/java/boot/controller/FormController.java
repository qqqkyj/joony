package boot.controller;

import java.util.Map;

import javax.annotation.PostConstruct;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.bind.annotation.RequestParam;

import boot.dto.PersonDto;

@Controller
public class FormController {

	@GetMapping("/sist/form1")
	public String form1() {
		return "form/form1";
	}
	
	@GetMapping("/sist/form2")
	public String form2() {
		return "form/form2";
	}
	
	@GetMapping("/sist/form3")
	public String form3() {
		return "form/form3";
	}
	
	@PostMapping("/sist/read1")
	public String result1(@RequestParam String irum, @RequestParam int java, @RequestParam int spring, Model m) {
		
		int total = java+spring;
		
		double avg = total/2;
		
		m.addAttribute("irum", irum);
		m.addAttribute("java", java);
		m.addAttribute("spring", spring);
		
		return "result/result1";
	}
	
	@PostMapping("/sist/write2")
	public String result2(@ModelAttribute("dto") PersonDto dto) {

		return "result/result2";
	}
	
	@PostMapping("/sist/myread")
	public String result3(@RequestParam Map<String, String> map, Model model) {
		
		model.addAllAttributes(map);
		
		return "result/result3";
	}
}
