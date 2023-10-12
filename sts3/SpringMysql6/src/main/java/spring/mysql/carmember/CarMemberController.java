package spring.mysql.carmember;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CarMemberController {
	
	@Autowired
	/* CarMemberDao dao; */
	CarMemberInter inter;
	
	@GetMapping("/member/list")
	public String list(Model model) {
		
		//갯수 가져오기
		int count = inter.getTotalCount();
		
		//멤버 리스트 가져오기
		List<CarMemberDto> list = inter.getAllMembers();
		
		//request에 저장
		model.addAttribute("count", count);
		model.addAttribute("list", list);		
		
		return "carmember/memberList";
	}
	
	//멤버 추가 폼으로 포워드
	@GetMapping("/member/addForm")
	public String addForm() {
		return "carmember/addForm";
	}
	
	@PostMapping("/member/addFormAction")
	public String addMember(@ModelAttribute CarMemberDto dto) {
		
		inter.insertMember(dto);
		
		return "redirect:list";
	}
	
	//멤버 업데이트 폼으로 포워드
	@GetMapping("/member/updateForm")
	public String updateForm(@RequestParam String num,Model model){
		
		CarMemberDto dto = inter.getMember(num);
		
		model.addAttribute("dto", dto);
		
		return "carmember/updateForm";
	}
	
	@PostMapping("/member/updateFormAction")
	public String updateMember(@ModelAttribute CarMemberDto dto) {
		
		inter.updateMember(dto);
		
		return "redirect:list";
	}
	
	@GetMapping("/member/delete")
	public String deleteMember(@RequestParam String num) {
		
		inter.deleteMember(num);
		
		return "redirect:list";
	}

}
