package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import boot.data.dto.ReboardDto;
import boot.data.service.ReboardService;

@Controller
@RequestMapping("/reboard")
public class ReBoardController {

	@Autowired
	ReboardService service;
	
	
	@GetMapping("/list")
	public ModelAndView list(@RequestParam(defaultValue = "1") int currentPage,
			@RequestParam(value = "searchcolumn",required = false) String sc,
			@RequestParam(value = "searchword",required = false) String sw)
	{
		ModelAndView model=new ModelAndView();
		
		
		
		//페이징 처리에 필요한 변수선언
		int totalCount=service.getTotalCount(sc, sw);
		int perPage=5;//한페이지에 보여질 글의 갯수
		int totalPage;//총 페이지수
		int startnum;//각페이지에서 불러올 db 의 시작번호
		int perBlock=5;//몇개의 페이지번호씩 표현할것인가
		int startPage; //각 블럭에 표시할 시작페이지
		int endPage; //각 블럭에 표시할 마지막페이지		

		//총 페이지 갯수 구하기
		totalPage=totalCount/perPage+(totalCount%perPage==0?0:1); 
		//각 블럭의 시작페이지
		startPage=(currentPage-1)/perBlock*perBlock+1;
		endPage=startPage+perBlock-1;
		if(endPage>totalPage)
			endPage=totalPage;
		//각 페이지에서 불러올 시작번호
		startnum=(currentPage-1)*perPage;
		//각페이지에서 필요한 게시글 가져오기
		List<ReboardDto> list=service.getPagingList(sc, sw, startnum, perPage);
		
		//각페이지에 출력할 시작번호
		int no=totalCount-(currentPage-1)*perPage;

		//출력에 필요한 변수들을 request 에 저장
		model.addObject("list",list);
		model.addObject("startPage",startPage);
		model.addObject("endPage",endPage);
		model.addObject("totalPage",totalPage);
		model.addObject("no",no);
		model.addObject("currentPage",currentPage);
		model.addObject("totalCount", totalCount);
		
		System.out.println("totalCount="+totalCount);
		
		model.setViewName("/reboard/boardlist");
		return model;
	}
	
	@GetMapping("/form")
	public String reform(@RequestParam(defaultValue = "0") int num,
			@RequestParam(defaultValue = "0") int regroup,
			@RequestParam(defaultValue = "0") int restep,
			@RequestParam(defaultValue = "0") int relevel,
			@RequestParam(defaultValue = "1") int currentPage,
			Model model)
	{
		//답글일경우에만 넘어오는 값들이다
		
		//새글일경우는 모두 null이므로 defaultValue만 값으로 전달
		model.addAttribute("num", num);
		model.addAttribute("regroup", regroup);
		model.addAttribute("restep", restep);
		model.addAttribute("relevel", relevel);
		model.addAttribute("currentPage", currentPage);
		
		//새글일경우는 "",답글일경우에는 원글 제목 가져오기
		String subject="";
		if(num>0) {
			subject=service.getData(num).getSubject();
		}
		
		model.addAttribute("subject", subject);
			
		
		return "/reboard/addform";
	}
	
	
	@PostMapping("/insert")
	public String insert(ReboardDto dto,int currentPage,List<MultipartFile> upload,
			HttpServletRequest request)
	{
		//업로드 경로
		String path=request.getSession().getServletContext().getRealPath("/rephoto");
		System.out.println(path);
		
		//업로드를 안햇을경우 0번지의 파일명이 "" 이된다
		//업로드안해도 upload size 가 1 이된다
		System.out.println(upload.size());
		
		if(upload.get(0).getOriginalFilename().equals("")) {
			dto.setPhoto("no");
		}else {
			String photo="";
			
			SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
			for(MultipartFile multi:upload) {
				//파일명을 현재 날짜로 변경후 , 로 연결
				String newName=sdf.format(new Date())+multi.getOriginalFilename();
				photo+=newName+",";
				
				//업로드
				try {
					multi.transferTo(new File(path+"/"+newName));
				} catch (IllegalStateException | IOException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}				
			}
			//마지막 컴마 제거
			photo=photo.substring(0,photo.length()-1);
			//dto에 저장
			dto.setPhoto(photo);
		}
		
		//db에 insert
		service.insertReboard(dto);
		
		return "redirect:list?currentPage="+currentPage;
	}
	
	@GetMapping("/content")
	public String detail(@RequestParam int num, int currentPage,Model model) {
		
		//조회수 증가
		service.updateReadCount(num);
		
		//dto
		ReboardDto dto =service.getData(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);
		
		return "/reboard/content";
	}
	
	//추천수 증가(ajax로)
	@GetMapping("/likes")
	@ResponseBody
	public int likes(@RequestParam int num) {
		
		service.updateLikes(num);
		
		int likes = service.getData(num).getLikes();
		
		return likes;
		
	}
	
	//추천수 감소(ajax로)
	@GetMapping("/hate")
	@ResponseBody
	public int hate(@RequestParam int num) {
		
		service.updateHate(num);
		
		int likes = service.getData(num).getLikes();
		
		return likes;
		
	}
	


	
}
