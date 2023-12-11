package spring.mysql.mycar;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {
	
	@Autowired
	private SqlSession session;
	
	String namespace = "spring.mysql.mycar.MyCarDao";
	
	//mycarMapper���� ���� �������� id�� ���ؼ� ������ 
	public int getTotalCount() {
		return session.selectOne(namespace+".getTotalCount");
	}
	
	//insert
	public void insertCar(MyCarDto dto) {
		session.insert(namespace+".insertOfMyCar", dto);
	}
	
	//select_��ü������
	public List<MyCarDto> getAllCars(){
		return session.selectList("getAllListOfMyCar");
	}
	
	//delete
	public void deleteMyCar(String num) {
		session.delete("deleteOfMyCar", num);
	}
	
	//getData_update
	public MyCarDto getData(String num) {
		MyCarDto dto = new MyCarDto();
		dto = session.selectOne("getDataOfMyCar", num);
		return dto;
	}
	
	//update
	public void updateMyCar(MyCarDto dto) {
		session.update("updateOfMyCar", dto);
	}
	
}
