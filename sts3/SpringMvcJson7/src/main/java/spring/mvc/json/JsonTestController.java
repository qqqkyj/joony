package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class JsonTestController {
	
	@GetMapping("/list1")
	@ResponseBody//json으로 처리한 후 browser로 출력
	public Map<String, String> list1(){
		
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("name", "장순영");
		map.put("hp", "010-222-3333");
		map.put("addr", "수원시 영통구");
		
		return map;
	}
	
	@GetMapping("/list3")
	public @ResponseBody List<PhotoDto> list3(){
		
		List<PhotoDto> list = new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("카카오1", "b1.png"));
		list.add(new PhotoDto("카카오2", "b2.png"));
		list.add(new PhotoDto("카카오3", "b3.png"));
		list.add(new PhotoDto("카카오4", "b4.png"));
		list.add(new PhotoDto("카카오5", "b5.png"));
		
		return list;
	}
}
