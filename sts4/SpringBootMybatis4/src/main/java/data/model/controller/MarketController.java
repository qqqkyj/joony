package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.annotation.MultipartConfig;
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

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;

@Controller
public class MarketController {
	
	@Autowired
	MarketMapperInter mapper;
	
	@GetMapping("/market/list")
	public ModelAndView list() {
		
		ModelAndView model = new ModelAndView();
		
		//db로부터 총개수 얻기
		int totalCount= mapper.getTotalCount();
		
		//모든 상품 얻기
		List<MarketDto> list = mapper.getAllSangpums();
		
		//저장
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		//포워드
		model.setViewName("market/marketlist");
		
		return model;
	}
	
	@GetMapping("/market/writeform")
	public String writeform() {
		return "market/addform";
	}
	
	@PostMapping("/market/add")
	public String insert(@ModelAttribute MarketDto dto,
			ArrayList<MultipartFile> upload,
			HttpSession session,
			Model model) {
		
		String photo="";
		
		if(upload.get(0).getOriginalFilename().equals("")) {
			photo="no";
		}else {
			
			for(MultipartFile f:upload) {
				
				//경로
				String path = session.getServletContext().getRealPath("/save");
				System.out.println(path);
				
				photo+=f.getOriginalFilename()+",";
				
				try {
					//파일업로드
					f.transferTo(new File(path+"\\"+f.getOriginalFilename()));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			photo.substring(0, photo.length()-1);//마지막 콤마를 제거
			
		}		
		
		//실제이름
		dto.setPhotoname(photo);
		
		mapper.insertMarket(dto);
		
		model.addAttribute("dto", dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/market/updateform")
	public String updateform(@RequestParam String num, Model model) {
		
		MarketDto dto = mapper.getData(num);
		
		model.addAttribute("dto", dto);
		
		return "market/updateform";
	}
	
	@PostMapping("/market/update")
	public String update(@ModelAttribute MarketDto dto,
			ArrayList<MultipartFile> upload,
			HttpSession session,
			Model model) {
		
		String photo="";
		
		if(upload.get(0).getOriginalFilename().equals("")) {
			photo="no";
		}else {
			
			for(MultipartFile f:upload) {
				
				//경로
				String path = session.getServletContext().getRealPath("/save");
				System.out.println(path);
				
				photo+=f.getOriginalFilename()+",";
				
				try {
					//파일업로드
					f.transferTo(new File(path+"\\"+f.getOriginalFilename()));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			photo.substring(0, photo.length()-1);//마지막 콤마를 제거
			
		}		
		
		//실제이름
		dto.setPhotoname(photo);
		
		mapper.updateMarket(dto);
		
		model.addAttribute("dto", dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num) {
		
		mapper.deleteMarket(num);
		
		return "redirect:list";
	}

}
