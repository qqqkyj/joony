package mycar.data;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
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
	public String insert(@ModelAttribute MyCarDto dto,
			MultipartFile carupload,
			HttpSession session) {
		
		//업로드할 save위치 구하기
		String path = session.getServletContext().getRealPath("/save");
		
		//업로드한 파일 dto
		dto.setCarphoto(carupload.getOriginalFilename());
		
		//실제업로드
		try {
			carupload.transferTo(new File(path+"\\"+carupload.getOriginalFilename()));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
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
	
	@GetMapping("/car/detail")
	public String detailForm(@RequestParam Long num, Model model) {
		
		MyCarDto dto =  dao.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "detail";
	}

}
