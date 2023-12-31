package day0622;

import java.util.Scanner;

public class QuizForWhile_02 {

	public static void quiz1() {
		//점수를 입력하면 합계를 구하시오
		//예외: 1~100이 아니면 제외 _continue_
		//0을 입력하면 종료
		
		Scanner sc = new Scanner(System.in);
		
		int score, cnt=0;//입력할 점수
		int sum=0;
		
		while(true) {
			System.out.println("점수 입력:");
			score = sc.nextInt();
			cnt++;
			
			if(score==0) {//break문
				System.out.println("종료");
				cnt--;
				break;
			}
			else if(score<0||score>100) {//점수를 잘못입력하면 다시 반복할 수 있음
				cnt--;
				continue;//종료가 아닌 skip
			}
			else {
				sum+=score;
			}
			
		}
		System.out.println("총점:"+sum);
		System.out.println("갯수:"+cnt);
		
		
	}
	
	public static void quiz2() {
		//점수를 반복해서 입력하면 합계, 평균을 구하시오
		//끝이라고 입력시 프로그램 종료
		
		Scanner sc = new Scanner(System.in);
		
		int sum=0, cnt=0;
		String score;
		double avg;
		
		while(true) {
			
			System.out.println("점수 입력:");
			score=sc.nextLine();
			
			if(score.equals("끝")) {
				break;}
			
			int i = Integer.parseInt(score);
			cnt++;
			
			
			if(i<0||i>100) {
				cnt--;
				continue;
			}
			
				sum+=i;
			
		}
		
		avg=(double)sum/cnt;
		
		System.out.println("총점: "+sum);
		System.out.printf("평균: %.2f",avg);
		
	}
	
	public static void quiz3() {
		/*
		총 5개의 점수를 입력받아 합계를 구해라
		만약 1~100이 아닐 경우 다시 입력받는다.(continue)
		
		1번 점수: 88
		2번 점수: 99
		3번 점수: 200
		 잘못입력했습니다
		3번 점수:33
		
		 합계: 점
		 */
		
		Scanner sc = new Scanner(System.in);
		
		int score, sum=0;

		
		for(int cnt=1; cnt<=5 ; cnt++) {
			System.out.printf(cnt+"번 점수:");
			score=sc.nextInt();
			
			if(score<0||score>100) {
				cnt--;
				System.out.println("점수를 잘못입력했습니다.");
				continue;
			}
			
			sum+=score;
			
		}
		
		System.out.println("===============");
		System.out.println("합계:"+sum);
		
	}
	
	public static void quiz4() {
		
	}
	
	public static void quiz5() {
		
	}
	
	public static void main(String[] args) {
		
		quiz3();
	}

}
