package day0619;

import java.util.Calendar;
import java.util.Scanner;

public class ScannerMyAge_05 {

	public static void main(String[] args) {
		//생성->변수->입력(Scanner)->계산->출력
		/*당신의 이름은? 김민희
		 *당신의 출생년도는? 1997년
		 *=========================
		 *이름: 김민희
		 *현재년도: 2023년
		 *나이:26세*/
		
		//생성
		Scanner sc = new Scanner(System.in);
		Calendar cal = Calendar.getInstance();
		
		//변수
		String name;
		int age;
		int born;
		int cur = cal.get(cal.YEAR);
		
		//입력
		System.out.println("당신의 이름은?");
		name = sc.nextLine();
		System.out.println("당신의 출생년도는?");
		born = sc.nextInt();
		//born =Integer.parseInt(sc.nextLine());
		
		//계산
		age = cur-born;
		
		//출력
		System.out.println("===================");
		System.out.println("이름:"+name);
		System.out.println("현재년도:"+cur+"년");
		System.out.println("나이:"+age+"세");
		
		
		
		
	}

}
