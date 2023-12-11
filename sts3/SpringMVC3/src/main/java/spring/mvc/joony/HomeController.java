package spring.mvc.joony;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {
	
	@GetMapping("/")
	public String start() {
		return "start";//return "form" //return "redirect:login/form"
	}
	
	@GetMapping("/login/form")
	public String form() {
		return "form";
	}
	
	@GetMapping("/login/read")
	//@RequestParam String myid, @RequestParam(value = "myid") String id, String myid => 3가지 모두 form에서 myid를 받아옴
	public String process(Model model, String myid , @RequestParam(value = "mypass") String pass) {
		
		model.addAttribute("id", myid);
		String msg ="";
		
		if(pass.equals("1234")) {
			msg="로그인 성공!!";
		}else {
			msg="로그인 실패!!";
		}
		
		model.addAttribute("msg", msg);
		
		return "result";
	}

}
