package day0619;

import java.util.Scanner;

public class keyBoardIn_02 {

	public static void main(String[] args) {
		//스캐너 생성, Scanner sc = new Scanner(System.out);
		//int i = sc.nextInt(); String name = sc.nextLine();
		
		//Scanner는 문자열이나 숫자를 모두 키보드로 입력 받으려 할 때 생성
		Scanner sc = new Scanner(System.in);//참조변수 sc
		
		//변수
		String name;
		int age;
		String city;
		
		//출력(입력문)
		System.out.println("이름을 입력해 주세요:");
		name = sc.nextLine();
		
		System.out.println("나이를 입력해 주세요:");
		//age = sc.nextInt();//숫자읽고 버퍼생김, 숫자입력후 엔터를 누르면 엔터가 키보드 버퍼로 저장돼 다음문자열을 읽을때 먼저 읽어버림
		age = Integer.parseInt(sc.nextLine());//숫자입력과 동시에 라인도 띄어줌
		
		System.out.println("사는 지역을 입력해 주세요:");
		city = sc.nextLine();
		
		//최종출력
		System.out.println("내 이름은 "+name+"입니다.");
		System.out.println("내 나이는 "+age+"세 입니다.");
		System.out.println("내가 사는 지역은 "+city+"입니다.");
	}

}
