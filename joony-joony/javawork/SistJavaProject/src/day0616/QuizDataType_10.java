package day0616;

public class QuizDataType_10 {

	public static void main(String[] args) {
		/* 매개변수(args)를 이용하여 출력해보세요
		 * [시험결과]
		 * Java=88, Jsp=77, Spring=99
		 * 총점:264점
		 * 평균:88.00점*/
		
		//변수
		int Java = Integer.parseInt(args[0]);
		int Jsp = Integer.parseInt(args[1]);
		int Spring = Integer.parseInt(args[2]);
		int count = 3;//3과목을 의미하는 변수
		int total;
		double avg;
		
		//계산
		total = Java+Jsp+Spring;
		avg = total/count;
		
		//출력, %(자리수).(소수점뒷자리 자리수)f
		System.out.printf("[시험결과]\n"
							+ "Java=%d, Jsp=%d, Spring=%d\n"
							+ "총점 : %d점\n"
							+ "평균 : %.2f점", Java, Jsp, Spring, total, avg);
		
		
	}

}
