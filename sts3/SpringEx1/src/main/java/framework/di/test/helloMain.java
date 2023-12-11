package framework.di.test;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class helloMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		System.out.println("자바 방식으로 hello메서드 호출하기");
		
		hello hello1=new hello();
		System.out.println(hello1.getMessage());
		
		hello hello2=new hello();
		System.out.println(hello2.getMessage());
		
		System.out.println(hello1==hello2); //자바에서는 new로 생성할 떄마다 다른 주소에 생성된 다른값이다.
		
		System.out.println("스프링 방식으로 hello 메서드 호출하기");
		//xml파일 가져오기..웹으로 실행시 web.xml에 설정이 되어있으므로 필요없다.
		
		ApplicationContext app1=new ClassPathXmlApplicationContext("helloContext.xml");
		//hello객체 생성
		hello h1=(hello)app1.getBean("hello"); //방법1//helloContext.xml에 쓴 name을 써준다.
		System.out.println(h1.getMessage());
		
		hello h2=app1.getBean("hello", hello.class); //방법2
		System.out.println(h2.getMessage());
		
		System.out.println(h1==h2); //생성주소가 같다..스프링에서는 기본이 싱글톤
		
	}

}
