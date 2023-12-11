package day0620;

import java.util.Scanner;

public class QuizOper_06 {

	public static void main(String[] args) {
		/*
		 이름을 입력하세요
		 강민호
		 3과목의 점수를 입력하세요
		 39
		 88
		 99
		 ==================
		 3과목점수: 39,88,99
		 평균점수:75.3
		 ------------------
		 ***합격조건: 평균이 70점 이상이고, 각 과목이 40점이상이면 합격***
		 *----------------
		 강민호님은 불합격입니다.
		 */
		
		//생성
		Scanner sc = new Scanner(System.in);
		
		//변수
		String name;
		int a,b,c;
		double avg;
		
		//입력
		System.out.println("이름을 입력하세요");
		name=sc.nextLine();
		System.out.println("3과목의 점수를 입력하세요");
		a=sc.nextInt();
		b=sc.nextInt();
		c=sc.nextInt();
		
		//계산
		avg=(a+b+c)/3.0;
		
		//출력
		 System.out.println("3과목점수:"+a+","+b+","+c);
		 System.out.printf("평균점수: %.2f점\n",avg);
		 System.out.println("***합격조건: 평균이 70점 이상이고, 각 과목이 40점이상이면 합격***");
		 
		if(avg>=70&&a>=40&&b>=40&&c>=40) {
			System.out.println(name+"은 합격입니다.");
		}
		else {
			System.out.println(name+"은 불합격입니다.");
		}
		
		
		
	}

}
