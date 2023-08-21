package day0623;

import java.util.Scanner;

public class ArrScannerSum_09 {

	public static void main(String[] args) {
		/*
		 0번지 값: 55
		 1번지 값: 77
		 2번지 값: 89
		 3번지 값: 49
		 4번지 값: 23		 
		 ===========
		 [입력값 확인]
		 1번째 값: 55
		 2번째 값: 77
		 3번째 값: 88
		 4번째 값: 49
		 5번째 값: 29
		 
		 ===========
		 총합계:
		 */
		
		int[] data;
		data=new int[5];
		
		int sum=0;
		
		Scanner sc = new Scanner(System.in);
		
		for(int i=0; i<data.length; i++) {
		System.out.print(i+"번지 값: ");
		data[i]=sc.nextInt();
		sum+=data[i];
		}
		
		sc.close();
		
		System.out.println("============");
		System.out.println("[입력값 확인]");
		for(int i=0; i<data.length; i++) {
			System.out.println((i+1)+"번째 값:"+data[i]);
		}
		
		System.out.println("============");
		System.out.println("총합계:"+sum);
	}

}
