package day0620;

public class SwitchTest_10 {

	public static void main(String[] args) {

		
		/*int n=5;
		
		switch(n) {
		case 1:
			System.out.println("n is 1");
			break;//break가 없을 경우 끝까지 실행
		case 2:
			System.out.println("n is 2");
			break;
		case 3:
			System.out.println("n is 3");
			break;
		case 4:
			System.out.println("n is 4");
			break;
		default:
			System.out.println("n is > 4");
			break;
			
		}*/
		
		String msg = "happy";
		
		switch(msg) {
		case "hello":
			System.out.println("안녕");
			break;
		case "happy":
			System.out.println("행복하다");
			break;
		case "nice":
			System.out.println("좋구만");
			break;
		}
		
		//점수이용하여 학점구하기
		int score = 99;
		char grade;
		
		switch(score/10) {
		case 10:
		case 9:
			grade='A';
			break;
		case 8:
			grade='B';
			break;
		case 7:
			grade='C';
			break;
		case 6:
			grade='D';
			break;
		default:
			grade='F';
		}
		
		System.out.println(score+"==>"+grade);
		
		
		
	}

}
