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
	@ResponseBody//json���� ó���� �� browser�� ���
	public Map<String, String> list2(){
		Map<String, String> map = new HashMap<String, String>();
		
		map.put("sang", "�׸����Ʈ");
		map.put("su", "5");
		map.put("dan", "5000");
		
		return map;
	}
	
	@GetMapping("/list4")
	public Map<String, Object> list4(@RequestParam String name){
		
		List<PhotoDto> list = new ArrayList<PhotoDto>();
		
		list.add(new PhotoDto("īī��1", "b1.png"));
		list.add(new PhotoDto("īī��2", "b2.png"));
		list.add(new PhotoDto("īī��3", "b3.png"));
		list.add(new PhotoDto("īī��4", "b4.png"));
		list.add(new PhotoDto("īī��5", "b5.png"));
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("name", "���� ����");
		map.put("photo","noimg.png");
		
		//�ش� �̹����� �ִٸ� map�� �ٽ� ����
		for(PhotoDto dto:list) {
			if(name.equals(dto.getName())) {
				map.put("name", dto.getName());
				map.put("photo", dto.getPhoto());
			}
		}
		
		
		return map;
	}
}
