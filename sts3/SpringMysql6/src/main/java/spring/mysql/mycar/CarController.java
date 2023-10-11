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
		
		//dao로부터 총 개수 가져오기
		int totalCount = dao.getTotalCount();
		
		//목록가져오기
		List<MyCarDto> list = dao.getAllCars();
		
		//request에 저장
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
	
	//updateForm으로 이동
	@GetMapping("/kakao/updateform")
	public ModelAndView updateForm(@RequestParam String num) {
		
		ModelAndView mv = new ModelAndView();
		//num에 해당하는 데이터 가져오기
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
