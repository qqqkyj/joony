package spring.anno.last;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ShopMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		//xml���� �ҷ��Ë��� ���
		ApplicationContext context = new ClassPathXmlApplicationContext("annoContext4.xml");
		
		JumunController controller = context.getBean("jumunController", JumunController.class);
		controller.insertJumun("�׸����Ʈ", 5000, "white");
		controller.deleteJumun("1");
		controller.selectJumun("���÷�", 2000, "red");
	}

}
