package day0619;

import java.util.Scanner;

public class IfTest_14 {

	public static void main(String[] args) {
		
		/*int n=200;
		
		if(n>=100) {
			System.out.println("n은 100보다 크거나 같다.");
			System.out.println("***");
		}
			System.out.println("프로그램정료!!!");*/
		
		//i가 홀수인지 짝수인지 구하기
		/*int i = 9;
		
		if(i%2==0) {
			System.out.println(i+"는 짝수입니다.");
		}
		else {
			System.out.println(i+"는 홀수입니다.");
		}*/
		
		
		//if문을 이용해서 학점구하기 ..90점이상 A, 80점이상 B, 70점이상 C, 60점이상 D, 60점미만 F
		/*int score = 88;
		String grade;
		
		if(score<60) {
			grade="F";
		}
		else if(score<70) {
			grade="D";
		}
		else if(score<80) {
			grade="C";
		}
		else if(score<90) {
			grade="B";
		}
		else {
			grade="A";
		}*/
		
		//삼항연산자를 이용하여 학점을 구해보기(조건문 2,3개정도에서 많이 쓰임)
		
		Scanner sc = new Scanner(System.in);
		
		int score;
		String grade;
		
		System.out.println("점수:");
		score = sc.nextInt();
				
		grade=(score<60)? "F":
				(score<70)?"D":
					(score<80)?"C":
						(score<90)?"B":"A";
		
		System.out.printf("%d는 %s학점 입니다.",score, grade);
		
		
	
	
	
	}

}
