package day0623;

import java.util.Scanner;

public class SuMatch_03 {

	public static void main(String[] args) {
		//랜덤수를 발생시킨 후 그 숫자를 맞춰보자
		
		Scanner sc = new Scanner(System.in);
		
		int rnd, num;
		int cnt=0;//횟수
		
		//1~100사이의 랜덤수 발생
		rnd=(int)(Math.random()*100)+1;
		
		while(true) {
			
			cnt++;
			System.out.printf(cnt+":");
			num = sc.nextInt();
			
			if(num==rnd) {
				System.out.println("맞았습니다. 정답은 "+rnd+"입니다!");
				break;
			}
			else if(num<rnd) {
				System.out.println("입력한 숫자보다 큽니다.");
			}
			else {
				System.out.println("입력한 숫자보다 작습니다.");
			}
		}
		
		System.out.println("게임종료");
		
	}

}
