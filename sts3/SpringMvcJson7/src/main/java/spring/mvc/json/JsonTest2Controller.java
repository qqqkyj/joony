package spring.mvc.json;

import java.util.HashMap;
import java.util.Map;

import org.springframework.web.bind.annotation.GetMapping;
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
}
