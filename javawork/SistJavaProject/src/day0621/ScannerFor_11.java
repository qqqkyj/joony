package day0621;

import java.util.Scanner;

public class ScannerFor_11 {

	public static void main(String[] args) {
		quizFact();
	}
	
	public static void numSum() {
		//합계를 구할 숫자는? 100
		//1부터 100까지의 합은 5050입니다
		Scanner sc = new Scanner(System.in);
		int n; //입력할 수
				
		int sum=0;
				
		System.out.println("합계를 구할 숫자는?");
		n=sc.nextInt();
				
		for(int i=1; i<=n; i++)
			sum+=i;
		System.out.println("1부터~"+n+"까지의 합="+sum);
				
	}
	
	public static void factorialTest() {
		//10!출력
		int result=1;
		for(int i=1; i<=3; i++) {
			result*=i;
			System.out.println(i+"!="+result);
		}
	}
	
	public static void quizFact() {
		//팩토리얼을 구할 숫자를 입력
		//5!=120
		Scanner sc = new Scanner(System.in);
		int su,result=1;
		
		System.out.println("팩토리얼 구할 숫자 입력");
		su=sc.nextInt();
		
		for(int i=1; i<=su; i++)
			result*=i;
		System.out.println(su+"!="+result);
	}
	

}
