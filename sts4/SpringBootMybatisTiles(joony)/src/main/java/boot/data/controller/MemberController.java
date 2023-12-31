package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import org.apache.tiles.autotag.core.runtime.annotation.Parameter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemberDto;
import boot.data.service.MemberService;

@Controller
public class MemberController {
	
	@Autowired
	MemberService service;
	
	@GetMapping("/member/myinfo")
	public String myinfo(HttpSession session ,Model model) {
		
		List<MemberDto> list = service.getAllMembers();
		
		model.addAttribute("list", list);
		
		return "/member/myinfo";
	}
	
	@GetMapping("/member/list")
	public ModelAndView list() {
		
		ModelAndView model = new ModelAndView();
		
		List<MemberDto> list = service.getAllMembers();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("/member/memberlist");
		
		return model;
	}
	
	@GetMapping("/member/form")
	public String form() {
		return "/member/addform";
	}
	
	//아이디 체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idcheck(@RequestParam String id) {
		
		Map<String, Integer> map = new HashMap<>();
		
		int n = service.getSerchId(id);
		
		map.put("count", n);

		return map;
	}
	
	//insert(list로 가는데 admin이 아니면 gaipsuccess로 이동)
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto,
			MultipartFile myphoto,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/membersave");
		System.out.println(path);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String mfile = sdf.format(new Date())+myphoto.getOriginalFilename();
		try {
			dto.setPhoto(mfile);
			
			myphoto.transferTo(new File(path+"//"+mfile));
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		service.insertMember(dto);
		
		if(service.checkAdmin(dto.getId())) {
			return "redirect:list";
		}else {
			return "/member/myinfo";
		}
		
		
	}
	
	
	//updateform
	@GetMapping("/member/updateform")
	public String updateform(@Parameter String num, Model model) {
		
		MemberDto dto = service.getDataByNum(num);
		
		model.addAttribute("dto", dto);
		
		return "/member/updateform";
		
	}
	
	//update
	@PostMapping("/member/update")
	public String update(@ModelAttribute MemberDto dto,
			MultipartFile  myphoto,
			HttpSession session) {
		
		String path = session.getServletContext().getRealPath("/membersave");
		System.out.println(path);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(myphoto.getOriginalFilename().equals("")) {
			dto.setPhoto(null);
		}else {
			String mfile = sdf.format(new Date())+myphoto.getOriginalFilename();
			try {
				dto.setPhoto(mfile);
				
				myphoto.transferTo(new File(path+"//"+mfile));
				
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}				
		
		service.updateMember(dto);
		
		return "redirect:myinfo";
	}
	
	//삭제는 ajax
	@GetMapping("/member/delete")
	@ResponseBody
	public void deleteMember(@RequestParam String num, HttpSession session) {
		
		//기존에 저장했던 사진파일 삭제 후 db에서 멤버삭제
		String path = session.getServletContext().getRealPath("/membersave");
		String photo = service.getDataByNum(num).getPhoto();
		File file = new File(path+"\\"+photo);
		file.delete();
				
		service.deleteMember(num);
	}
	
	//사진만 수정
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void photoupload(@RequestParam String num,
			MultipartFile photo,
			HttpSession session) {
		//업로드할 경로
		String path= session.getServletContext().getRealPath("/membersave");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String fileName = sdf.format(new Date())+photo.getOriginalFilename();
		
		String photo1 = service.getDataByNum(num).getPhoto();
		File file = new File(path+"\\"+photo1);
		file.delete();
		
		//업로드
		try {
			photo.transferTo(new File(path+"/"+fileName));
			//db사진수정
			service.updatePhoto(num, fileName);
			session.setAttribute("loginphoto", service.getDataByNum(num).getPhoto());
			
		} catch (IllegalStateException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	
	}
	
	//나의 정보에서 삭제
	@GetMapping("/member/deleteme")
	@ResponseBody
	public void deleteinfo(String num,HttpSession session) {
		
		//기존에 저장했던 사진파일 삭제 후 db에서 멤버삭제
		String path = session.getServletContext().getRealPath("/membersave");
		String photo = service.getDataByNum(num).getPhoto();
		File file = new File(path+"\\"+photo);
		file.delete();
		
		service.deleteMember(num);
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.removeAttribute("loginphoto");
		session.removeAttribute("saveok");
	}


}
