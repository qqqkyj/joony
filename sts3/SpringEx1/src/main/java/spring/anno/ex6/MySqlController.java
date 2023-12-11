package spring.anno.ex6;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("mysqldata")
public class MySqlController {

	@Autowired
	TestDao tdao;
	
	public void insert(String irum) {
	
		tdao.insert(irum);
	}
	public void delete(String num) {
		tdao.delete(num);
	}
	public void select(String irum) {
		
		tdao.select(irum);
	}
}
