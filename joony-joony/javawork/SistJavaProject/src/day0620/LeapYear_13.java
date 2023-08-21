package day0620;

import java.util.Scanner;

public class LeapYear_13 {

	public static void main(String[] args) {
		//윤년 계산하기
		//공식
		//년도를 4로 나눠서 나머지가 0이고
		//년도를 100으로 나눠서 나머지가 0이 아니거나
		//년도를 400으로 나눠서 나머지가 0이면 윤년
		
		Scanner sc = new Scanner(System.in);
		
		int year;
		
		System.out.println("연도를 입력해 주세요:");
		year = sc.nextInt();
		
		if(year%4==0&&year%100!=0||year%400==0) {
			System.out.println(year+"년도는 윤년입니다.");
		}else {
			System.out.println(year+"년도는 평년입니다.");
		}
		
	}

}
