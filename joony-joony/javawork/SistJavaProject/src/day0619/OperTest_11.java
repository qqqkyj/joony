package day0619;

public class OperTest_11 {

	public static void main(String[] args) {
		//삼항(조건)연산자
		//수식?"참":"거짓";
		
		int score=85;
		
		
		char grade1 = (score>90)?'A':'F'; //조건 2개
		char grade = (score>90)?'A' : ((score > 80)? 'B':'C'); //조건 3개
		
		System.out.println(score+"점은 "+ grade+"등급입니다.");
		
		
		
		
	}

}
