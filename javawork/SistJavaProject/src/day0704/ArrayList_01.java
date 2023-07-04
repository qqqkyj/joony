package day0704;

import java.util.ArrayList;

public class ArrayList_01 {
	
	public static void main(String[] args) {
		
		String[] flowers = {"장미","프리지아","다알리아","수국","해바라기","수국"};
		
		//객체 삽입, 삭제할 수 있는 컨테이너 클래스 생성, list(interface), ArrayList(class)
		//지금은 String타입의 list를 담았지만 실사용시 class타입을 가장 많이 사용
		ArrayList<String> list = new ArrayList<>();
		
		//데이터 담기
		for(String  f:flowers) {
			list.add(f);//flowers를 list에 삽입
		}
		
		System.out.println("size:"+list.size());
		
		System.out.println("#출력1_for");
		for(int i=0; i<list.size(); i++) {
			System.out.println(list.get(i));
		}
		System.out.println();
		
		System.out.println("#출력2_for~each");
		for(String s: list) {
			System.out.println(s);
		}
		System.out.println();
		
		
		
	}

}
