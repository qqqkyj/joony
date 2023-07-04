package day0704;

import java.util.List;
import java.util.Scanner;
import java.util.Vector;

/*
 1.상품입고	2.상품재고		0.종료
 1
 상품명:바나나
 수량:10
 가격:3000
 2
 번호 상품명 수량 가격 총가격
 1 	바나나 10	 3000	30000
 */
public class ShopMain_03 {
	
	List<Shop> list = new Vector<Shop>();
	
	//입력
	public void inputWrite(){
		Scanner sc = new Scanner(System.in);
		System.out.println("상품명:");
		String sangName = sc.nextLine();
		System.out.println("수량:");
		int su = Integer.parseInt(sc.nextLine());
		System.out.println("가격:");
		int dan = Integer.parseInt(sc.nextLine());
		
		Shop shop = new Shop(sangName, su, dan);
		list.add(shop);
		
	}
	
	//출력
	public void writeShop() {
		System.out.println("****************상품재고*****************");
		System.out.println("=======================================");
		System.out.println("번호\t상품명\t수량\t가격\t총가격");
		
		for(int i=0; i<list.size(); i++) {
			Shop data = list.get(i);
			System.out.println("["+(i+1)+"]"
								+"\t"+data.getSangName()
								+"\t"+data.getSu()+"개"
								+"\t"+data.getDan()+"원"
								+"\t"+(data.getSu()*data.getDan())+"원");
		}
	}

	public static void main(String[] args) {
		ShopMain_03 shop = new ShopMain_03();
		Scanner sc = new Scanner(System.in);
		int num;
		
		while(true) {
			System.out.println("1.상품입고\t2.상품재고\t 0.종료");
			num=sc.nextInt();
			
			if(num==1) {
				shop.inputWrite();
			}
			else if(num==2) {
				shop.writeShop();
			}
			else if(num==0) {
				System.out.println("프로그램 종료");
				break;
			}
			else {
				System.out.println("숫자를 잘못 입력하였습니다.");
			}
		}
		
	}

}
