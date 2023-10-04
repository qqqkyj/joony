package spring.anno.ex6;

import org.springframework.stereotype.Component;

@Component
public class TestDao {

	public void insert(String irum) {
		System.out.println(irum+"님 db에 추가됨");
	}
	
	public void delete(String num) {
		System.out.println(num+"번 데이터 삭제");
	}
	
	public void select(String irum) {
		System.out.println(irum+"님은 수원에 사는 20대 여자 입니다.");
	}
	
}
