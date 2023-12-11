package answer.data;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class AnswerController {
	
	@Autowired
	AnswerDao dao;
	
	@PostMapping("/board/ainsert")
	public String ainsert(@ModelAttribute AnswerDto dto, @RequestParam String currentPage) {
		
		dao.insertAnswer(dto);
		
		return "redirect:content?num="+dto.getNum()+"&currentPage="+currentPage;
	}
	
	@GetMapping("/board/adelete")
	@ResponseBody
	public int adelete(@RequestParam String idx) {
		
		dao.deleteAnswer(Integer.parseInt(idx));
		
		return 1;
	}
}
