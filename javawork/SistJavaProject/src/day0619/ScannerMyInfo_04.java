package day0619;

import java.util.Scanner;

public class ScannerMyInfo_04 {

	public static void main(String[] args) {
		/*scanner이용할 것
		 * 이름을 입력하세요: 홍길동
		 * 핸드폰번호: 010-1234-5678
		 * 주소: 서울시 강남구
		 * =======================
		 * [개인정보]
		 * 이름: 홍길동
		 * 연락처: 010-1234-5678
		 * 주소: 서울시 강남구*/
		
		Scanner sc = new Scanner(System.in);
		
		//변수
		String name;
		String phone;
		String address;
		
		//입력
		System.out.println("이름을 입력하세요:");
		name = sc.nextLine();
		System.out.println("핸드폰번호:");
		phone = sc.nextLine();
		System.out.println("주소:");
		address = sc.nextLine();
		
		//출력
		System.out.println("=======================");
		System.out.println("\t[개인정보]");
		System.out.println("\t이름:"+name);
		System.out.println("\t연락처:"+phone);
		System.out.println("\t주소:"+address);
		
		
	}

}
