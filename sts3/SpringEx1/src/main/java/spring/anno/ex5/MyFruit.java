package spring.anno.ex5;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component
public class MyFruit {
	
	//@Autowired
	//single match라서 하나만 받을 때 Autowired사용.
	//정확하게 bean의 이름으로 주입하려면?
	@Resource(name="kfruit")
	Fruit fruit;
	
	public void writeFruit() {
		System.out.println("내가 좋아하는 과일은 **");
		fruit.writeFruiteName();
	}
	
}
