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
		
		//���� ��������
		int count = inter.getTotalCount();
		
		//��� ����Ʈ ��������
		List<CarMemberDto> list = inter.getAllMembers();
		
		//request�� ����
		model.addAttribute("count", count);
		model.addAttribute("list", list);		
		
		return "carmember/memberList";
	}
	
	//��� �߰� ������ ������
	@GetMapping("/member/addForm")
	public String addForm() {
		return "carmember/addForm";
	}
	
	@PostMapping("/member/addFormAction")
	public String addMember(@ModelAttribute CarMemberDto dto) {
		
		inter.insertMember(dto);
		
		return "redirect:list";
	}
	
	//��� ������Ʈ ������ ������
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
