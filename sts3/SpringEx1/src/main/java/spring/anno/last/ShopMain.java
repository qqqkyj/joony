package spring.anno.last;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//xml값을 불러올떄만 사용
		ApplicationContext context = new ClassPathXmlApplicationContext("annoContext4.xml");
		
		JumunController controller = context.getBean("jumunController", JumunController.class);
		controller.insertJumun("그릭요거트", 5000, "white");
		controller.deleteJumun("1");
		controller.selectJumun("요플레", 2000, "red");
	}

}
