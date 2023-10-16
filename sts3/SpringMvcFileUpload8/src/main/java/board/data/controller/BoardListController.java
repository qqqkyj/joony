package board.data.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import spring.mvc.reboard.BoardDao;
import spring.mvc.reboard.BoardDto;

@Controller
public class BoardListController {
	
	@Autowired
	BoardDao dao;

	@GetMapping("/board/list")
	public ModelAndView list(
			@RequestParam(value = "currentPage", defaultValue = "1") int currentPage) {
		
		ModelAndView mv = new ModelAndView();
		
		//페이징처리에 필요한 변수선언
		int totalCount=dao.getTotalCount(); //전체댓글수
		int totalPage; //총 페이지수
		int startPage; //각블럭에서 보여질 시작페이지
		int endPage; //각블럭에서 보여질 끝페이지
		int startNum; //db에서 가져올 글의 시작번호(mysql은 첫글이 0,오라클은 1)
		int perPage=3; //한페이지당 보여질 글의 갯수
		int perBlock=5; //한블럭당 보여질 페이지 개수
		     
		     
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
			
			//각 페이지에서 필요한 게시글 가져오기
			List<BoardDto> list = dao.getPagingList(startNum, perPage);
			
			//각 페이지에 출력할 시작번호
			int no = totalCount-(currentPage-1)*perPage;
		  
		
		mv.addObject("totalCount", totalCount);
		mv.addObject("list", list);
		mv.addObject("startPage", startPage);
		mv.addObject("endPage", endPage);
		mv.addObject("totalPage", totalPage);
		mv.addObject("no", no);
		mv.addObject("currentPage", currentPage);
		
		mv.setViewName("reboard/boardlist");
		
		return mv;
	}
	
	@GetMapping("/board/writeform")
	public ModelAndView form(
			@RequestParam Map<String, String> map) {
		
		ModelAndView mv = new ModelAndView();
		
		//아래 5개는 댓글일 경우에만 넘어오고 새글인 경우 넘어오지 않는다.
		String currentPage=map.get("currentPage");
		String num=map.get("num");
		String regroup=map.get("regroup");
		String restep=map.get("restep");
		String relevel=map.get("relevel");
		
		System.out.println(currentPage+","+num+","+regroup+","+restep+","+relevel);
		
		//입력폼에 hidden으로 넣어줘야됨..댓글일 경우
		mv.addObject("currentPage", currentPage==null?"1":currentPage);
		mv.addObject("num", num==null?"0":num);
		mv.addObject("regroup", regroup==null?"0":regroup);
		mv.addObject("restep", restep==null?"0":restep);
		mv.addObject("relevel", relevel==null?"0":relevel);
		
		System.out.println(currentPage+","+num+","+regroup+","+restep+","+relevel);
		
		//0으로 넣어야 dao에서 새글로 인식
		//폼이 댓글,새글 공용이므로
		
		mv.setViewName("reboard/writeform");
		
		return mv;
	}
	
	@PostMapping("/board/insert")
	public String insert(@ModelAttribute BoardDto dto,
			@RequestParam ArrayList<MultipartFile> uimage,
			HttpSession session) {
		
		//실제경로
		String path = session.getServletContext().getRealPath("/WEB-INF/photo");
		System.out.println(path);
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddHHmmss");
		
		String photo="";
		
		//입력된 사진이 없다면 no, 아니라면 파일의 이름을 디비에 저장
		if(uimage.get(0).getOriginalFilename().equals(""))
			photo="no";
		else
			for(MultipartFile f:uimage) {
				String fName = sdf.format(new Date())+f.getOriginalFilename();
				photo+=fName+",";
				
				try {
					f.transferTo(new File(path+"/"+fName));
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		
		//photo에서 마지막 콤마(,)제거
		photo = photo.substring(0, photo.length()-1);
		System.out.println(photo);
		
		dto.setPhoto(photo);
		
		//insert
		dao.insertReboard(dto);
		
		return "redirect:list";//content가 없어서 목록으로 이동
	}
	
	@GetMapping("/board/content")
	public String content(@RequestParam Map<String, String> map, Model model) {		
		
		String num = map.get("num");
		String currentPage = map.get("currentPage");		
		System.out.println("num:"+num+",currentPage:"+currentPage);
		
		BoardDto dto = dao.detailBoard(num);
		
		model.addAttribute("dto", dto);
		model.addAttribute("currentPage", currentPage);
		
		return "reboard/content";
	}
}
