package spring.anno.ex6;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class Ex6Main {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		ApplicationContext app=new ClassPathXmlApplicationContext("annoContext4.xml");
		
		MySqlController sql1=(MySqlController)app.getBean("mysqldata");
		sql1.insert("全己版");
		sql1.delete("3");
		sql1.select("价林康");
	}

}
