package day0703;

import java.util.ArrayList;
import java.util.List;

public class ArrayList_13 {

	public static void write(String title, List<String> list) {
		System.out.println("***"+title+"***");
		
		for(int i=0; i<list.size(); i++) {
			System.out.println(i+"값:"+list.get(i));
		}
		System.out.println();
	}
	
	public static void main(String[] args) {
		//List의 메서드 확인, 연습
		
		String[] data = {"영주","순영","연주","진평"};
		
		//배열의 데이터를 list에 넣기
		List<String> list = new ArrayList<>();
		
		for(String d: data) {
			list.add(d);
		}
		write("초기에 배열데이터 add후 출력",list);
		
		///////////////////////////////////
		System.out.println("1번 index 삭제하기");
		list.remove(1);
		write("1번 삭제 후 결과 출력", list);
		
		System.out.println("현규 추가하기");
		list.add("형규");
		write("형규 추가 후 결과 출력", list);
		
		System.out.println("값변경");
		list.set(0, "영환");
		write("0번 값 변경 후 출력 ", list);
		
		System.out.println("2번 앞에 추가");
		list.add(2, "순영");
		write("2번 앞에 추가 후 출력 ", list);
		
		System.out.println("전체삭제");
		list.clear();
		System.out.println("사이즈: "+list.size());
	}

}
