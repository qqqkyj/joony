package day0619;

import java.util.Scanner;

public class QuizOper_08 {

	public static void main(String[] args) {
		//월 급여를 입력해서 만원, 천원, 십원, 일원 개수를 출력해보자
		/*예: 금액을 입력하시오
		 * 2526251
		 * ========
		 * 만원:252
		 * 천원:6
		 * 백원:2
		 * 십원:5
		 * 일원:1*/
		
		//생성
		Scanner sc = new Scanner(System.in);
		
		//변수
		int money;
		int man,chun,back,shib,il;
		
		//입력
		System.out.println("금액을 입력하세요:");
		money = sc.nextInt();
		
		//계산
		man = money/10000;
		chun = (money%10000)/1000;
		back = (money%1000)/100;
		shib = (money%100)/10;
		il = money%10;
		
		//출력
		System.out.println("===============");
		System.out.println("만원:"+man);
		System.out.println("천원:"+chun);
		System.out.println("백원:"+back);
		System.out.println("십원:"+shib);
		System.out.println("일원:"+il);
		
		
	}

}
