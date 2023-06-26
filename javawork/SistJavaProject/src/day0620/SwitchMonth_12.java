package day0620;

import java.util.Scanner;

public class SwitchMonth_12 {

	public static void main(String[] args) {
		//동일한 case가 많을땐 switch가 효과적
		//월을 입력받아서 2일경우에는 "28 or 29까지 있습니다."
		//1,3,5,7,8,10,12월은 "31일까지 있습니다."
		//4,6,9,11월은 "30일까지 있습니다."
		
		Scanner sc = new Scanner(System.in);
		int month;
		
		System.out.println("월을 입력해 주세요.");
		month=sc.nextInt();
		
		switch(month){
			case 2:
				System.out.println("28 or 29까지 있습니다.");
				break;
			case 4,6,9,11:
				System.out.println("30일까지 있습니다.");
				break;
			case 1,3,5,7,8,10,12:
				System.out.println("31일까지 있습니다.");
				break;
			default:
				System.out.println("존재하지 않는 달입니다.");
				break;
		}
		
		
	}

}
