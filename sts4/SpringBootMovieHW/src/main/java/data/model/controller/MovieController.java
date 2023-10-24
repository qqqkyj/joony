package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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

import data.model.dto.MovieDto;
import data.model.mapper.MovieMapperInter;
@Controller
public class MovieController{

	
	@Autowired
	MovieMapperInter mapper;
	
	@GetMapping("/")
	public String start() {
		return "redirect:/movie/movielist";
	}
	
	@GetMapping("/movie/list")
	public String list(Model model) {
		
		int total = mapper.getTotalCount();
		
		List<MovieDto> list = mapper.getAllDatas();
		
		model.addAttribute("total", total);
		model.addAttribute("list", list);
		
		return "movie/movielist";
	}
	
	@GetMapping("/movie/writeform")
	public String writeform() {
		return "movie/addform";
	}
	
	@PostMapping("/movie/insert")
	public String insert(@ModelAttribute MovieDto dto, 
			MultipartFile upload,
			HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/moviephoto");
		
		String photo = upload.getOriginalFilename();
		
		System.out.println(photo);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(photo.equals("")) {
			dto.setMv_poster("no");
		}else {
			
			String file = sdf.format(new Date())+photo;
			
			dto.setMv_poster(file);
			
			try {
				upload.transferTo(new File(path+"\\"+file));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		mapper.insertMovie(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/movie/detail")
	public String detail(@RequestParam String mv_num, Model model) {
		
		MovieDto dto = mapper.getData(mv_num);
		
		model.addAttribute("dto", dto);
		
		return "movie/detail";
	}

}
