package spring.mvc.start;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ResultController {
	//@GetMapping("/apple/list.do")//�� .do�� ã�ƿ� �� ����
	@GetMapping("/apple/list")//list�ڿ� .do�� �ٸ� Ȯ���ڸ� ������ �� ȣ���
	public String result1(Model model) {
		model.addAttribute("myname", "ȫ�浿");
		model.addAttribute("myhp", "010-1234-1231");
		return "result1";
	}
	
	@GetMapping("/banana/insert")
	public ModelAndView banana() {
		//ModelAndView�� request�� �����ϱ� ���� Model��
		//������ �ϱ����� View�� ���ĳ��� Ŭ�����Դϴ�.
		ModelAndView mview = new ModelAndView();
		
		//request�� ����
		mview.addObject("java",88);
		mview.addObject("spring", 99);
		
		//forward�� jsp��������
		mview.setViewName("result2");
		
		
		return mview;
	}
	
	@GetMapping("orange/delete")
	public ModelAndView orange() {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addObject("sangpum", "��Ŭ����");
		mv.addObject("color", "pink");
		mv.addObject("price", 3000);
		
		mv.setViewName("result3");
		
		return mv;
	}
	
	@GetMapping("/shop/detail")
	public String resImage() {
		return "result4";
	}
	
	@GetMapping("board/insert/data")
	public String resImage2() {
		return "result5";
	}
}
