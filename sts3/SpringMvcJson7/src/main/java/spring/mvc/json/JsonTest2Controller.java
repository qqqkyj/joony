package spring.mvc.json;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class JsonTest2Controller {
	
	@GetMapping("/list2")
	@ResponseBody//json으로 처리한 후 browser로 출력
	public Map<String, String> list2(){
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("sang", "그릭요거트");
		map.put("su", "5");
		map.put("dan", "5000");
		
		return map;
	}
	
	@GetMapping("/list4")
	public Map<String, Object> list4(@RequestParam String name){
		
		List<PhotoDto> list = new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("카카오1", "b1.png"));
		list.add(new PhotoDto("카카오2", "b2.png"));
		list.add(new PhotoDto("카카오3", "b3.png"));
		list.add(new PhotoDto("카카오4", "b4.png"));
		list.add(new PhotoDto("카카오5", "b5.png"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "없는 사진");
		map.put("photo","noimg.png");
		
		//해당 이미지가 있다면 map이 다시 셋팅
		for(PhotoDto dto:list) {
			if(name.equals(dto.getName())) {
				map.put("name", dto.getName());
				map.put("photo", dto.getPhoto());
			}
		}
		
		
		return map;
	}
}
