package hello.boot;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class helloController {
	
	@GetMapping("/sist/hello")
	public Map<String, String> hello(){
		
		HashMap<String, String> data = new HashMap<>();
		
		data.put("msg", "오늘은 스프링부트 배우는 날");
		
		return data;
	}
}
