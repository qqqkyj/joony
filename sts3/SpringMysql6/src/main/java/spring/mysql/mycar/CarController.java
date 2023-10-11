package spring.mysql.mycar;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class CarController {

	@Autowired
	MyCarDao dao;
	
	@GetMapping("/kakao/list")
	public String list(Model m) {
		
		//dao로부터 총 개수 가져오기
		int totalCount = dao.getTotalCount();
		
		//request에 저장
		m.addAttribute("totalCount", totalCount);
		
		return "car/carList";
	}
	
	@GetMapping("/kakao/writeForm")
	public String writeForm() {
		return "car/writeForm";
	}
}
