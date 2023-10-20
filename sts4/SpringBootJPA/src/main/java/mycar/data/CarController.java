package mycar.data;

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
	
	@GetMapping("/car/carlist")
	public ModelAndView list() {
		
		ModelAndView mv = new ModelAndView();
		
		List<MyCarDto> list = dao.getAllDatas();
		
		mv.addObject("list", list);
		mv.addObject("totalCount", list.size());
		
		mv.setViewName("carList");
		
		return mv;
	}
	
	@GetMapping("/car/carform")
	public String form() {
		return "addForm";
	}
	
	@PostMapping("/car/insert")
	public String insert(@ModelAttribute MyCarDto dto) {
		dao.insertMyCar(dto);
		return "redirect:carlist";
	}
	
	@GetMapping("/car/updateForm")
	public String updateForm(@RequestParam Long num, Model model) {
		
		MyCarDto dto = dao.getData(num);
		
		model.addAttribute("dto", dto);
		return "uform";
	}
	
	@PostMapping("/car/update")
	public String update(@ModelAttribute MyCarDto dto) {
		dao.updateMyCar(dto);
		return "redirect:carlist";
	}
	
	@GetMapping("/car/delete")
	public String delete(@RequestParam Long num) {
		
		dao.deleteMyCar(num);
		
		return "redirect:carlist";
	}

}
