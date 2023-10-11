package spring.mysql.mycar;

import java.lang.ProcessBuilder.Redirect;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class CarController {

	@Autowired
	MyCarDao dao;
	
	@GetMapping("/kakao/list")
	public String list(Model m) {
		
		//dao�κ��� �� ���� ��������
		int totalCount = dao.getTotalCount();
		
		//��ϰ�������
		List<MyCarDto> list = dao.getAllCars();
		
		//request�� ����
		m.addAttribute("totalCount", totalCount);
		m.addAttribute("list", list);
		
		return "car/carList";
	}
	
	@GetMapping("/kakao/writeForm")
	public String writeForm() {
		return "car/writeForm";
	}
	
	//insert
	@PostMapping("/kakao/write")
	public String insert(@ModelAttribute MyCarDto dto) {
		
		dao.insertCar(dto);
		
		return "redirect:list";
	}
	
	//delete
	@GetMapping("/kakao/delete")
	public String delete(@RequestParam String num) {
		
		dao.deleteMyCar(num);
		
		return "redirect:list";
	}
	
	//updateForm���� �̵�
	@GetMapping("/kakao/updateform")
	public ModelAndView updateForm(@RequestParam String num) {
		
		ModelAndView mv = new ModelAndView();
		//num�� �ش��ϴ� ������ ��������
		MyCarDto dto = dao.getData(num);		
		
		mv.addObject("dto", dto);
		
		mv.setViewName("car/updateForm");
		
		return mv;
	}
	
	//update
	@PostMapping("/kakao/update")
	public String update(@ModelAttribute MyCarDto dto) {
		
		dao.updateMyCar(dto);
		
		return "redirect:list";
	}
	
	
}
