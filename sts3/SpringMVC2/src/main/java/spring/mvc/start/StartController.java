package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class StartController {
	
	//start.jsp�� �������� �޼���(forward)
	//@RequestMapping(value = "/")
	
	@GetMapping("/")//pom.xml���� 5.2.9�� version�����ϱ�, 5�������� ��밡��
	public String start(Model model) {
		//Model: request�� �����͸� �����ϱ� ���� �������̽�
		//�������� �ϴ� request.setAttribute�� ����
		model.addAttribute("name", "�迵ȯ");
		model.addAttribute("addr", "����� ������");
		return "start";//WEB-INF/day1005/start.jsp
	}
	
	
}
