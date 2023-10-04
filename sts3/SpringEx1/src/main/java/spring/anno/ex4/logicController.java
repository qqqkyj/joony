package spring.anno.ex4;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

@Component("logic") //클래스명이 길 경우 ()안에 원하는 id명으로 적는다. id가 logic이 된다.
public class logicController {
	
	
	@Autowired //bean에 자동 주입
	//정확한 bean의 아이디로 주입_모호성이 있는 경우에는 @Resource(name="정확한 클래스명") ex)@Resource(name="myDao")
	
	DaoInter daointer; //daointer를 가져오든 mydao를 자료형으로 가져오든 똑같다.
	
	public logicController(MyDao dao) {
		this.daointer=dao;
	}
	
	//insert
	public void insert(String str) {
		
		daointer.insertData(str);
	}
	
	//delete
	public void delete(String num) {
		
		daointer.deleteData(num);
	}
	
}
