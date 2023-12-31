package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;
import javax.websocket.server.PathParam;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.IpgoDto;
import boot.data.mapper.IpgoMapperInter;

@Controller
public class IpgoController {
	
	@Autowired
	IpgoMapperInter mapper;
	
	@GetMapping("/")
	public String start() {
		return "/layout/main";
	}
	
	@GetMapping("/ipgo/list")
	public ModelAndView list() {
		ModelAndView model = new ModelAndView();
		
		int totalCount = mapper.getTotalCount();		
		List<IpgoDto> list = mapper.getAllIpgos();
		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		//model.setViewName("ipgolist");//jsp
		model.setViewName("/ipgo/ipgolist");//tiles
		
		return model;
	}
	
	@GetMapping("/ipgo/ipgoform")
	public String ipgoform() {
		return "/ipgo/ipgoform";
	}
	
	@PostMapping("/ipgo/insert")
	public String insert(@ModelAttribute IpgoDto dto,
			@RequestParam ArrayList<MultipartFile> upload,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/upload");
		System.out.println(path);
		
		String uploadName="";
		
		if(upload.get(0).getOriginalFilename().equals("")) {
			uploadName="no";
		}else {
			
			SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
			
			for(MultipartFile f:upload) {
				
				String fName = sdf.format(new Date())+f.getOriginalFilename();
				
				uploadName+=fName+",";
				
				//업로드
				try {
					f.transferTo(new File(path+"\\"+fName));
				} catch (IllegalStateException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} catch (IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			
			//마지막 콤마 제거
			uploadName=uploadName.substring(0, uploadName.length()-1);
		}
		
		dto.setPhotoname(uploadName);
		
		mapper.insertIpgo(dto);
		
		
		return "redirect:list";
	}

}
