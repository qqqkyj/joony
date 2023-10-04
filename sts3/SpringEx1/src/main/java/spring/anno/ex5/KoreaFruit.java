package spring.anno.ex5;

import org.springframework.stereotype.Component;

@Component("kfruit")
public class KoreaFruit implements Fruit {

	@Override
	public void writeFruiteName() {
		// TODO Auto-generated method stub
		
		System.out.println("한국 과일은 맛있다");
		
	}

}
