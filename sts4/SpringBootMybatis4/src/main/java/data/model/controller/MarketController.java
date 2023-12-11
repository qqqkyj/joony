package data.model.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import data.model.dto.MarketDto;
import data.model.service.MarketServiceInter;
import data.model.service.MarketService;

@Controller
public class MarketController {
	
	@Autowired
	MarketService service;
	
	@GetMapping("/")
	public String start() {
		return "redirect:market/list";
	}
	
	@GetMapping("/market/list")
	public ModelAndView list() {
		
		ModelAndView model = new ModelAndView();
		
		//db로부터 총개수 얻기
		int totalCount= service.getTotalCount();
		
		//모든 상품 얻기
		List<MarketDto> list = service.getAllSangpums();
		
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
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			
			for(MultipartFile f:upload) {
				
				//경로
				String path = session.getServletContext().getRealPath("/save");
				System.out.println(path);
				
				String file =sdf.format(new Date())+f.getOriginalFilename();
				
				photo+=file+",";
				
				try {
					//파일업로드
					f.transferTo(new File(path+"\\"+file));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			photo=photo.substring(0, photo.length()-1);//마지막 콤마를 제거
			
		}		
		
		//실제이름
		dto.setPhotoname(photo);
		
		service.insertMarket(dto);
		
		model.addAttribute("dto", dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/market/updateform")
	public String updateform(@RequestParam String num, Model model) {
		
		MarketDto dto = service.getData(num);
		
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
			
			SimpleDateFormat sdf = new SimpleDateFormat();
			
			for(MultipartFile f:upload) {
				
				//경로
				String path = session.getServletContext().getRealPath("/save");
				System.out.println(path);
				
				String file =sdf.format(new Date())+f.getOriginalFilename();
				
				photo+=file+",";
				
				try {
					//파일업로드
					f.transferTo(new File(path+"\\"+file));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			photo=photo.substring(0, photo.length()-1);//마지막 콤마를 제거
			
		}		
		
		//실제이름
		dto.setPhotoname(photo);
		
		service.updateMarket(dto);
		
		model.addAttribute("dto", dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/market/delete")
	public String delete(@RequestParam String num, HttpSession session) {
		
		String path=session.getServletContext().getRealPath("/save");
		
		String photo = service.getData(num).getPhotoname();
		StringTokenizer st = new StringTokenizer(photo,",");
		int count = st.countTokens();
		
		for(int i=0; i<count; i++) {
			File file = new File(path+"\\"+st.nextToken());
			file.delete();
		}
		
		
		service.deleteMarket(num);
		
		return "redirect:list";
	}

}
