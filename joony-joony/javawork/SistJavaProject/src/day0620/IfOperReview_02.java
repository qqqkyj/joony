package day0620;

import java.util.Scanner;

public class IfOperReview_02 {

	public static void main(String[] args) {
		/*평가메세지: 90점이상:참잘함 80점이상:잘함 80점미만:다음기회에...=>삼항
		 * 학덤:90점이상:A=>if문
		 * 점수를 입력하세요
		 * 88
		 * =============
		 * 점수:88점
		 * 평가메세지:잘함
		 * 학점: B
		 */
		
		//생성
		Scanner sc = new Scanner(System.in);
		
		//변수
		int score;
		String grade, message;
		
		//입력
		System.out.print("점수를 입력하세요:");
		score = sc.nextInt();
		
		//계산
		message = (score<80)?"다음기회에":
					(score<90)?"잘함":"참잘함";
		
		if(score<60) {
			grade="F";;
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
		}
		
		//출력
		System.out.println("===========");
		System.out.println("점수:"+score+"점");
		System.out.println("평가메세지:"+message);
		System.out.println("학점:"+grade);
		
		
		
		
		
	}

}
