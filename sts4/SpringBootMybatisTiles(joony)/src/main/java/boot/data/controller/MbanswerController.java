package boot.data.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MbanswerDto;
import boot.data.mapper.MbanswerMapperInter;
import boot.data.service.MemberService;

@RestController
@RequestMapping("/mbanswer")
public class MbanswerController {
	
	@Autowired
	MbanswerMapperInter mapper;
	
	@Autowired
	MemberService mservice;
	
	@GetMapping("/alist")
	public List<MbanswerDto> list(@RequestParam String num) {

		List<MbanswerDto> list =  mapper.getAllAnswers(num);
		
		return list;
	}
	
	
	@PostMapping("/ainsert")
	public void insert(@ModelAttribute MbanswerDto dto, HttpSession session) {
		
		String myid = (String)session.getAttribute("myid");
		String name = mservice.getName(myid);
		
		dto.setMyid(myid);
		dto.setName(name);
		
		mapper.insertMbanswer(dto);
	}
	
	@GetMapping("/adelete")
	public void delete(@RequestParam String idx) {
		
		mapper.deleteAnswer(idx);
	}

}
