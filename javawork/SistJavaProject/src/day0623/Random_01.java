package day0623;

import java.util.Scanner;

public class Random_01 {

	public static void main(String[] args) {
		/*=>(int)(Math.random()*x)+y=>0.xxxxxxxxx<=X<=0.9xxxxxxxxxx
		 자바에서 난수를 구하는 방법 2가지
		 1.Math.random() 메서드를 이용하는 방법
		 2.Random이라는 클래스를 생성해서 구하는 방법
		 */
		
		/*System.out.println("기본 난수 5개 발생");
		
		double a;
		
		for(int i=1; i<=5; i++) {
			a=Math.random();//0.xxxxxxxxx~0.9xxxxxxxxxx
			System.out.println(a);
		}
		
		System.out.println("0~9사이 난수 5개 발생");
				
		for(int i=1; i<=5; i++) {
			int b=(int)(Math.random()*10);//0~9
			System.out.println(b);
		}
		
		System.out.println("1~10사이 난수 5개 발생");
		
		for(int i=1; i<=5; i++) {
			int b=(int)(Math.random()*10)+1;//1~10, (int)(Math.random()*x)+y=>y~x까지
			System.out.println(b);
		}*/
		
		System.out.println("1~100사이 난수 5개 발생");
		
		for(int i=1; i<=5; i++) {
			int b=(int)(Math.random()*100)+1;//1~100
			System.out.println(b);
		}
		
		System.out.println("0~99사이 난수 5개 발생");
		
		for(int i=1; i<=5; i++) {
			int b=(int)(Math.random()*100);//0~99
			System.out.println(b);
		}
	}

}
