package spring.di.ex2;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex2Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext context=new ClassPathXmlApplicationContext("appContext2.xml");
		
		
		//Myinfo 생성 후 확인
		Myinfo my=(Myinfo)context.getBean("my");
		
		System.out.println(my.toString());
		System.out.println(my); //toString이 오버라이딩 된 것은 id or name값만 불러줘도 된다.
		
		//Person
		
		Person p=(Person)context.getBean("person");
		p.writeData();
	}

}
