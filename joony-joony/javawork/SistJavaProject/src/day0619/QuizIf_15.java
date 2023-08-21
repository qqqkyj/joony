package day0619;

import java.util.Scanner;

public class QuizIf_15 {

	public static void main(String[] args) {
		//점수를 입력하여 평가를 출력하시오
		/*
		 * 당신의 점수는? 88
		 * ======================================
		 * 90점이상: 장학생 80점이상: 우수상 80점미만: 재시험
		 * ======================================
		 * 당신은 88점으로 우수상으로 평가되었습니다.
		 */
		
		//생성
		Scanner sc = new Scanner(System.in);
		
		//변수
		int score;
		String grade;
		
		//입력
		System.out.println("당신의 점수는? ");
		score=sc.nextInt();
		
		/*
		//조건
		grade=(score>=90)?"장학생":
				(score>=80)?"우수상":"재시험";
		*/
		
		if(score>=90)
			grade="장학생";
		else if(score>=80)
			grade="우수상";
		else
			grade="재시험";
		
		//출력
		System.out.println("========================================");
		System.out.println(" 90점이상: 장학생 80점이상: 우수상 80점미만: 재시험");
		System.out.println("========================================");
		System.out.printf("당신은 %d점으로 %s으로 평가되었습니다.\n",score,grade);
					
		
	}

}
