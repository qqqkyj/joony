package spring.mvc.tea;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import model.data.dto.ShopDto;

@Controller
@RequestMapping("/naver")
public class NaverController {
	
	@GetMapping("/form1")
	public String form1() {
		return "day1010/form1";
	}
	
	@PostMapping("/read1")
	public ModelAndView read1(@RequestParam String name,
			@RequestParam String gender,
			@RequestParam String addr) {
		
		ModelAndView mv = new ModelAndView();
		
		//�𵨿� �־��ְ�
		mv.addObject("name", name);
		mv.addObject("gender", gender);
		mv.addObject("addr", addr);
		//������
		mv.setViewName("day1010/result1");
		
		return mv;
	}
	
	@GetMapping("/form2")
	public String form2() {
		return "day1010/form2";
	}
	
	//@ModelAttribute: ���� �����͸� �о dto�� �ְ� model�� ����
	//�� model���� ShopDtoŸ���� ��� shopDto��� �̸����� ����
	//���� �ٸ� �̸����� ������ ��� @ModelAttribute("�̸�")
	
	@PostMapping("/read2")
	public String read2(@ModelAttribute ShopDto dto) {
		return "day1010/result2";
	}
	
	@GetMapping("/form3")
	public String form3() {
		return "day1010/form3";
	}
	
	@PostMapping("/read3")
	//���±��� name�� key������, �Է°��� value������
	public ModelAndView read3(@RequestParam Map<String, String> map) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.addAllObjects(map);
		
		mv.setViewName("day1010/result3");
		
		return mv;
	}
	
	@GetMapping("/form4")
	public String uploadForm1() {
		return "upload/uploadForm1";
	}
	
	@PostMapping("/upload1")
	public ModelAndView upload1(
			@RequestParam String  title,
			@RequestParam MultipartFile photo,
			HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		//���ε��� ������α��ϱ�
		String path = session.getServletContext().getRealPath("/WEB-INF/image");
		String fileName = photo.getOriginalFilename();//���ε�� ���ϸ�
		
		//���糯¥�� �ð��̿��ؼ� ���ϸ� ����, �ʱ��� �ؾ� ��ġ�� ����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHss");
		
		if(!fileName.equals("")) {
			
			fileName=sdf.format(new Date())+"_"+fileName;
			
			//path�� ���ε�
			try {
				photo.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else {
			fileName="no";//���ε� �� �� ���
			
		}
				
		
		mv.addObject("fileName", fileName);
		mv.addObject("title", title);
		mv.addObject("path", path);
		
		mv.setViewName("upload/uploadResult1");
		
		return mv;
	}
	
	@GetMapping("/uploadform5")
	public String uploadForm2() {
		return "upload/uploadForm2";
	}
	
	@PostMapping("/upload2")
	public ModelAndView upload2(
			@RequestParam String title,
			@RequestParam ArrayList<MultipartFile> photo,
			HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		//���ε��� ������α��ϱ�
		String path = session.getServletContext().getRealPath("/WEB-INF/image");
		
		//���糯¥�� �ð��̿��ؼ� ���ϸ� ����, �ʱ��� �ؾ� ��ġ�� ����
		SimpleDateFormat sdf = new SimpleDateFormat("yyyymmddHHss");
		
		ArrayList<String> files = new ArrayList<String>();
		
		//���ϸ� ���
		for(MultipartFile f:photo) {
			String fileName = sdf.format(new Date())+"_"+f.getOriginalFilename();
			files.add(fileName);
			
			//���ε�
			try {
				f.transferTo(new File(path+"\\"+fileName));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
				
		
		mv.addObject("files", files);
		mv.addObject("title", title);
		mv.addObject("path", path);
		
		mv.setViewName("upload/uploadResult2");
		
		return mv;
	}
}
