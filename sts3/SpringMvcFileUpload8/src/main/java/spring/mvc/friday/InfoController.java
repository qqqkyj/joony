package spring.mvc.friday;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
public class InfoController {

	@Autowired
	InfoDao dao;
	
	@GetMapping("/info/list")
	public ModelAndView list(@RequestParam(defaultValue = "name") String title,
			@RequestParam(required = false) String search) {
		
		ModelAndView mv = new ModelAndView();
		
		//List<InfoDto> list = dao.getAllInfos();
		int total = dao.getTotalCount();
		
		System.out.println(title+","+search);
		
		Map<String, String> map = new HashMap<String, String>();
		map.put("search", search);
		map.put("title", title);
		
		List<InfoDto> list = dao.getAllInfos(map);
		
		mv.addObject("list", list);
		mv.addObject("total", total);
		mv.setViewName("info/infoList");
		
		return mv;
	}
	
	@GetMapping("/info/addform")
	public String addform() {
		return "info/addForm";
	}
	
	@PostMapping("/info/insert")
	public String insert(@ModelAttribute InfoDto dto, @RequestParam MultipartFile upload,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo="";
		
		//사진선택을 안했을 경우 no..
		if(upload.getOriginalFilename().equals("")) {
			photo="no";
		}else {
			String fName = sdf.format(new Date())+"_"+ upload.getOriginalFilename();
			photo=fName;
			
			//업로드
			try {
				upload.transferTo(new File(path+"/"+photo));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
				
		//dto에 photo넣기
		dto.setPhoto(photo);
		
		//insert
		dao.insertMyInfo(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/info/delete")
	public String delete(@RequestParam String num) {
		
		dao.deleteMyinfo(num);
		
		return "redirect:list";
	}
	
	@GetMapping("/info/uform")
	public String updateform(@RequestParam String num, Model model) {
		
		InfoDto dto = dao.getData(num);
		model.addAttribute("dto", dto);
		
		return "info/updateForm";
	}
	
	@PostMapping("/info/update")
	public String update(@ModelAttribute InfoDto dto,
			@RequestParam MultipartFile upload,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/resources/image/");
		System.out.println(path);
		
		//dto에 담을 변수
		String photoName;
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		//사진을 변경하지 않을 경우 
		if(upload.getOriginalFilename().equals("")) {
			photoName="no";
		}else {
			photoName=sdf.format(new Date())+"_"+upload.getOriginalFilename();
			
			try {
				upload.transferTo(new File(path+"/"+photoName));
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		//dto에 photo에 업로드한 photoname을 넣어주기
		dto.setPhoto(photoName);
		
		//update
		dao.updateMyInfo(dto);
		
		return "redirect:list";
	}
	
}
