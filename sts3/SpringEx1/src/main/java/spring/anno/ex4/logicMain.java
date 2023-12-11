package spring.anno.ex4;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class logicMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		ApplicationContext anno1=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		logicController logic1=(logicController)anno1.getBean("logic");
		logic1.insert("어노테이션 연습");
		logic1.delete("1");
		
	}

}
