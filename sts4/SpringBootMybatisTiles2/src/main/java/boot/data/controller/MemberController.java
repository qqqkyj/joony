package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public String info(Model model)
	{
		List<MemberDto> list=service.getAllMembers();
		
		model.addAttribute("list", list);
		return "/member/myinfo";
	}
	
	@GetMapping("/member/list")
	public ModelAndView list()
	{
		ModelAndView model=new ModelAndView();
		
		List<MemberDto> list=service.getAllMembers();
		
		model.addObject("list", list);
		model.addObject("totalCount", list.size());
		
		model.setViewName("/member/memberlist");
		return model;
	}
	
	@GetMapping("/member/form")
	public String form()
	{
		return "/member/addform";
	}
	
	
	//아이디 체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public Map<String, Integer> idCheck(@RequestParam String id)
	{
		Map<String, Integer> map=new HashMap<>();
		
		int n=service.getSerchId(id);
		
		map.put("count", n); //0  or 1
		
		return map;
	}
	
	
	//insert (일단은 list로 가는데 admin이 아니면 gaipsuccess로 이동할 예정)
	@PostMapping("/member/insert")
	public String insert(@ModelAttribute MemberDto dto,
			@RequestParam MultipartFile myphoto,
			HttpSession session)
	{
		
		String path=session.getServletContext().getRealPath("/membersave");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+myphoto.getOriginalFilename();
		System.out.println(path);
		
		//dto저장
		dto.setPhoto(fileName);
		
		//업로드
		try {
			myphoto.transferTo(new File(path+"\\"+fileName));
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		service.insertMember(dto);
		
		return "redirect:list";
	}
	
	//삭제는 ajax
	@GetMapping("/member/delete")
	@ResponseBody
	public void deleteMember(@RequestParam String num,HttpSession session)
	{
		String path=session.getServletContext().getRealPath("/membersave");
	    String photo=service.getDataByNum(num).getPhoto();
	    File file=new File(path+"\\"+photo);
	    file.delete();
		
		service.deleteMember(num);
	}
	
	//사진만 수정
	@PostMapping("/member/updatephoto")
	@ResponseBody
	public void photoupload(String num,MultipartFile photo,HttpSession session)
	{
		//업로드할 경로
		String path=session.getServletContext().getRealPath("/membersave");
		
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		String fileName=sdf.format(new Date())+photo.getOriginalFilename();
		
		//업로드
		try {
			photo.transferTo(new File(path+"/"+fileName));
			
			
			service.updatePhoto(num, fileName); //db사진수정
			//세션사진수정
			session.setAttribute("loginphoto", fileName);
		} catch (IllegalStateException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	//나의 정보에서 삭제
	@GetMapping("/member/deleteme")
	@ResponseBody
	public void deleteinfo(String num,HttpSession session)
	{
		
		
		String path=session.getServletContext().getRealPath("/membersave");
	    String photo=service.getDataByNum(num).getPhoto();
	    File file=new File(path+"\\"+photo);
	    file.delete();
	     
	     service.deleteMember(num);
		
		session.removeAttribute("loginok");
		session.removeAttribute("myid");
		session.removeAttribute("loginphoto");
		session.removeAttribute("saveok");
		
	}
	
	//수정폼에 출력할 dto반환
	@GetMapping("/member/updateform")
	@ResponseBody
	public MemberDto getData(String num)
	{
		return service.getDataByNum(num);
	}

	//수정
	@PostMapping("/member/update")
	@ResponseBody
	public void update(MemberDto dto)
	{
		service.updateMember(dto);
		
	}

}
