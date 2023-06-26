package day0620;

import java.util.Scanner;

public class QuizIfOper_05 {

	public static void main(String[] args) {
		/*
		 상품명? 아이패드
		 수량? 3개
		 가격? 500000
		 =============
		 아이패드 3개는 총 15000000원 입니다
		 3개이상은 10프로 DC가 됩니다
		 DC된 총금액:1350000원
		 */
		
		//생성
		Scanner sc = new Scanner(System.in);
		
		//변수
		String name;
		int num,price;
		double total,dc,dc_total;
		
		//입력
		System.out.print("상품명?");
		name = sc.nextLine();
		System.out.print("수량?");
		num = sc.nextInt();
		System.out.print("가격?");
		price = sc.nextInt();
		
		
		//계산
		
		total=price*num;
		
		if(num>=3) {
			dc_total=0.9*total;
			
			//출력
			System.out.printf("아이패드 %d개는 총 %.0f원 입니다.\n"
					+ "3개이상은 10프로 DC가 됩니다.\n"
					+ "DC된 총금액:%.0f원",num, total,dc_total);
		}
		else {
			dc_total=total;
		}
		
		/*dc=1;
		dc=(num>=3)?0.9:1;
		total = price*num;
		dc_total=total*dc;*/
		
		//출력
		System.out.printf("아이패드 %d개는 총 %.0f원 입니다.",num, total);
		
	}

}
