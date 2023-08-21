package day0703;

import java.util.HashSet;
import java.util.Iterator;
import java.util.Set;

/*
 Set : 데이터의 중복허용 안됨, 순서를 유지하지 않는 집합 
 List: 데이터의 중복허용, 순서 유지 =>DB사용시 많이 사용(List, ArrayList, Vector등)
 List(interface)는 인터페이스라 생성이 안되며 추상메서드를 가져와 사용, ArrayList(class)는 클래스
 Map : key값을 알면 value값을 구할 수 있음
 */

public class ExHashSet_10 {
	
	public static void main(String[] args) {
		//컬렉션-자료구조(set, vector, arraylist)
		//컬렉션이 복수의 자료형을 저장_안정서이 떨어질 수 있으므로 나온것이 제네릭(generic<>)
		//(인터페이스 or 클래스)<데이터형> 참조변수명 = new 클래스명<데이터형>;
		
		Set<String> set1 = new HashSet<String>();//다형성, 부모이름으로 자식을 구현
		//Set에 String데이터를 담겠다 - Set은 인터페이스 이므로 객체생성 불가
		
		//추가 - 배열에 비해 가변적
		set1.add("사과");
		set1.add("포도");
		set1.add("키위");
		set1.add("사과");//중복되었으므로 개수가 포함되지 않음
		set1.add("배");
		set1.add("수박");
		
		System.out.println("데이터 개수: "+set1.size());
		
		System.out.println("출력#1");
		for(String s: set1)
			System.out.println(s);
		System.out.println();
		
		System.out.println("출력#2_Iterator");
		Iterator<String> iter = set1.iterator();
		while(iter.hasNext()) {
			System.out.println(iter.next());
		}
		System.out.println();
		
		System.out.println("출력#3_for");
		Object[] ob = set1.toArray();
		for(int i=0; i<ob.length; i++) {
			System.out.println(ob[i]);
		}
		System.out.println();
		
		//모든데이터 삭제
		set1.clear();
		
		if(set1.isEmpty()) {
			System.out.println("Set타입안에 데이터가 없다.");
		}
		else {
			System.out.println("Set타입안에 데이터가 있다.");
		}
		
		
		
	}

}
