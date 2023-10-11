package spring.mysql.mycar;

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
	
}
