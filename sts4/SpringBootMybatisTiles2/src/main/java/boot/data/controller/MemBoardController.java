package boot.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
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
	public ModelAndView list(@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		int totalCount=service.getTotalCount();
		
				//페이징 처리에 필요한 변수선언
				int perPage=5;//한페이지에 보여질 글의 갯수
				int totalPage;//총 페이지수
				int start;//각페이지에서 불러올 db 의 시작번호
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
				start=(currentPage-1)*perPage;
				//각페이지에서 필요한 게시글 가져오기
				List<MemBoardDto> list=service.getList(start, perPage); 
				
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
		model.setViewName("/memboard/memlist");
		return model;
	}
	
	@GetMapping("/form")
	public String from()
	{
		return "/memboard/addform";
	}
	
	@PostMapping("/insert")
	public String insert(@ModelAttribute MemBoardDto dto,HttpSession session)
	{
		
		String path=session.getServletContext().getRealPath("/savefile");
		SimpleDateFormat sdf=new SimpleDateFormat("yyyyMMddHHmmss");
		
		//업로드안한경우 no
		if(dto.getUpload().getOriginalFilename().equals(""))
			dto.setUploadfile("no");
		else { //업로드한 경우
			
			String uploadFile=sdf.format(new Date())+dto.getUpload().getOriginalFilename();
			dto.setUploadfile(uploadFile);
			
			//실제업로드
			try {
				dto.getUpload().transferTo(new File(path+"\\"+uploadFile));
			} catch (IllegalStateException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
		//세션에서 아이디얻어서 dto에 저장
		String myid=(String)session.getAttribute("myid");
		dto.setMyid(myid);
		
		//이름
		String name=mservice.getName(myid); //servive에 저장한값 얻기
		//String name=(String)session.getAttribute("loginname");  새션에 저장한값 얻기
		dto.setName(name);
		
			
		
		//insert
		service.insertBoard(dto);
		
		return "redirect:content?num="+service.getMaxNum();
	}
	
	@GetMapping("/content")
	public ModelAndView content(@RequestParam String num,
			@RequestParam(defaultValue = "1") int currentPage)
	{
		ModelAndView model=new ModelAndView();
		
		//조회수 증가
		service.updatereadcount(num);
		
		MemBoardDto dto=service.getData(num);
		model.addObject("dto", dto);
		
		//업로드 파일의 확장자 얻기
				int dotLoc=dto.getUploadfile().lastIndexOf('.');  //마지막 점의 위치
				String ext=dto.getUploadfile().substring(dotLoc+1); //다음글자부터 끝까지 추출
				
				System.out.println(dotLoc+","+ext);
				
				if(ext.equalsIgnoreCase("jpg")||ext.equalsIgnoreCase("gif")||
						ext.equalsIgnoreCase("png")||ext.equalsIgnoreCase("jpeg"))
					
					model.addObject("bupload", true);
				else
					model.addObject("bupload", false);
		
		
		model.addObject("currentPage", currentPage);
		model.setViewName("/memboard/content");
		return model;
	}
	
	@GetMapping("/updateform")
	public ModelAndView uform()
	{
		ModelAndView model=new ModelAndView();
		
		model.setViewName("/memboard/updateform");
		return model;
	}
	
	//수정
	
	
	@GetMapping("/delete")
	public String delete()
	{
		return "redirect:list";
	}
}
