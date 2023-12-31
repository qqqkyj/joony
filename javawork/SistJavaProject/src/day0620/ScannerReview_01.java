package day0620;

import java.util.Calendar;
import java.util.Scanner;

public class ScannerReview_01 {

	public static void main(String[] args) {
		/*
		 * 태어난연도: 1997
		 * 이름: 홍길동
		 * 핸드폰번호: 010-1234-5678
		 * 주소: 서울시 동작구
		 * ======================
		 * 	[개인정보]
		 * 이름:홍길동
		 * 나이:26세
		 * 연락처:010-1234-5678
		 * 주소: 서울시 동작구
		 */
		
		//생성
		Scanner sc = new Scanner(System.in);
		Calendar cal = Calendar.getInstance();
		
		//변수
		int myBirth, cur, age;
		String name, phone, address;
		
		//입력
		System.out.print("태어난 연도:");
		myBirth = Integer.parseInt(sc.nextLine());
		System.out.print("이름:");
		name = sc.nextLine();
		System.out.print("핸드폰번호:");
		phone = sc.nextLine();
		System.out.print("주소:");
		address = sc.nextLine();
		
		//계산
		cur = cal.get(cal.YEAR);
		age = cur-myBirth;
		
		//출력
		System.out.println("\t[개인정보]");
		System.out.println("이름:"+name);
		System.out.println("나이:"+age+"세");
		System.out.println("연락처:"+phone);
		System.out.println("주소:"+address);
		
		
	}

}
