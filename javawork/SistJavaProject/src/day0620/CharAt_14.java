package day0620;

import java.util.Scanner;

public class CharAt_14 {

	public static void main(String[] args) {
		//index순서 01234567....
		//System.out.println(seventh);
		//남자입니다 or 여자입니다 or 2000년 이후 남자입니다 or 2000년 이후 여자입니다
		
		Scanner sc = new Scanner(System.in);
		
		String juminNum;
		char seventh;
		
		System.out.println("주민번호를 입력해주세요:");
		juminNum = sc.nextLine();
		seventh=juminNum.charAt(7);
		
		System.out.println(seventh);
		
		switch(seventh) {
		case '1':
			System.out.println("남자입니다");
			break;	
		case '2':
			System.out.println("여자입니다");
			break;
		case '3':
			System.out.println("2000년 이후 남자입니다");
			break;
		case '4':
			System.out.println("2000년 이후 여자입니다");
			break;
		default:
			System.out.println("주민번호를 잘못입력하였습니다.");
		
		}
		
	}

}
