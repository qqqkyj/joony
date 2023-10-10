package spring.mvc.samsung;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/board")//�߰���θ� �̸� mapping, ������ board���ϸ� ���� �� ����
public class BoardController {
	
	//String�� �ڷ����� forward�� �Ѵٴ� ��
	@GetMapping("/board/form1")
	public String form1() {
		return "board/writeForm";
	}
	
	@PostMapping("/board/process")
	public ModelAndView process1(@RequestParam String name, 
			@RequestParam String date, 
			@RequestParam String gender,
			//defaultValue�� �޾ƿ� ���ڰ��� ���� ��� default�� �Է��� ���� ���
			//@RequestParam(defaultValue = "�ູ�� �Ϸ� ��������!!")String msg)
			//required = true�� �⺻��, �׸��� ��� ������ �ȳ��� �Ϸ��� false
			@RequestParam(required = false)String msg,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("name", name);
		mv.addObject("date", date);
		mv.addObject("gender", gender);
		mv.addObject("msg", msg);
		mv.addObject("currentPage", currentPage);
		
		mv.setViewName("board/result");
		
		return mv;
	}
	
	@GetMapping("/result2")
	public String result2(Model model) {
		
		model.addAttribute("myimg1", "../image/cat.gif");
		model.addAttribute("title", "�����ϴ� �̹���");
		
		return "board/result2";
	}

}
