package boot.data.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class DaouController {
	
	@GetMapping("/daou/service")
	public String service() {
		return "/sub1/daou/service";
	}
	
	@GetMapping("/daou/intro")
	public String intro() {
		return "/sub1/daou/Intro";
	}
	
	@GetMapping("/daou/res")
	public String res() {
		return "/sub1/daou/res";
	}
	
	@GetMapping("/daou/ir")
	public String ir() {
		return "/sub1/daou/ir";
	}
	
	@GetMapping("/daou/recruit")
	public String recruit() {
		return "/sub1/daou/recruit";
	}

}
