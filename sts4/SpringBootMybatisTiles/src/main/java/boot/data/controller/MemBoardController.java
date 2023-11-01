package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.MemBoardDto;
import boot.data.service.MemBoardService;
import boot.data.service.MemberService;

@Controller
@RequestMapping("/memboard")
public class MemBoardController {
	
	@Autowired
	MemBoardService service;
	
	@Autowired
	MemberService mservice;
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam int currentPage) {
		
		ModelAndView model = new ModelAndView();
	
		//페이징처리
		int totalCount = service.getTotalCount(); //전체객수
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=3; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수
		//int currentPage; //현재페이지
		int no; //각페이지당 출력할 시작번호


		//현재페이지 읽기(단 null일경우는 1페이로 준다)계산을 해야하므로 int로 형변환해줌
		if(currentPage!=nu)
			currentPage=1;
		else
			currentPage=Integer.parseInt(request.getParameter("currentPage"));


		//총페이지수 구하기
		//총글의 갯수/한페이지당 보여질 개수로 나눔(7/5=1)
		//나머지가 1이라도 있으면 무조건 1페이지 추가(1+1=2페이지가 필요)
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1);

		//각블럭당 보여야할 시작페이지
		//perBlock=5일경우는 현재페이지 1~5 시작:1 끝:5
		//현재페이지 13  시작:11  끝:15
		startPage=(currentPage-1)/perBlock*perBlock+1;

		endPage=startPage+perBlock-1;

		// 총페이지가 23일경우 마지막블럭은 25가아니라 23이다   
		if(endPage>totalPage)
			endPage=totalPage;

		//각페이지에서 보여질 시작번호
		//1페이지: 0,2페이지:5 3페이지:10....
		startNum=(currentPage-1)*perPage;


		//각페이지당 출력할 시작번호 구하기 no
		//총글개수가 23이면 1페이지 23,2페이지는 18,3페이지 13.....
		//출력시 1씩 감소하며 출력
		no=totalCount-(currentPage-1)*perPage;


		//페이지에서 보여질 글만 가져오기
		List<MemBoardDto> list=service.getList(startNum, perPage);

		
		model.addObject("totalCount", totalCount);
		model.addObject("list", list);
		
		model.setViewName("/memboard/memlist");
		
		return model;
	}
	
	@GetMapping("/form")
	public String form() {
		return "/memboard/addform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MemBoardDto dto, HttpSession session) {
		
		String myid = (String)session.getAttribute("myid");
		String name = mservice.getName(myid);
		
		dto.setMyid(myid);
		dto.setName(name);
		
		
		String path = session.getServletContext().getRealPath("/savefile");
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		if(dto.getUpload().getOriginalFilename().equals("")) {
			dto.setUploadfile("no");
		}else {
			dto.setUploadfile(sdf.format(new Date())+dto.getUpload().getOriginalFilename());
			
			try {
				dto.getUpload().transferTo(new File(path+"\\"+dto.getUploadfile()));
			} catch (IllegalStateException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//insert
		service.insertBoard(dto);
		
		return "redirect:content?num="+service.getMaxNum();
	}
	
	@GetMapping("/content")
	public ModelAndView content(@RequestParam String num) {
		
		ModelAndView model = new ModelAndView();
		
		//조회수 증가
		service.updateReadCount(num);
		
		MemBoardDto dto = service.getData(num);		
		model.addObject("dto", dto);
		
		//업로드 파일의 확장자 얻기
		int dotLoc = dto.getUploadfile().lastIndexOf(".");//마지막 점의 위치
		String ext = dto.getUploadfile().substring(dotLoc+1);//다음글자부터 끝까지 추출
		System.out.println(dotLoc+","+ext);

		if(ext.equalsIgnoreCase("jpg")||ext.equalsIgnoreCase("gif")||ext.equalsIgnoreCase("png")
				||ext.equalsIgnoreCase("jpeg")) {
			
			model.addObject("bupload", true);
			
		}else {
			
			model.addObject("bupload", false);
			
		}
		
		model.setViewName("/memboard/content");
		
		return model;
	}
	
	
	

}
