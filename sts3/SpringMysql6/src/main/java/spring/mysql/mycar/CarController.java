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
		
		//dao�κ��� �� ���� ��������
		int totalCount = dao.getTotalCount();
		
		//request�� ����
		m.addAttribute("totalCount", totalCount);
		
		return "car/carList";
	}
	
	@GetMapping("/kakao/writeForm")
	public String writeForm() {
		return "car/writeForm";
	}
}
