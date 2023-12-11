package day0629;
/*
 Shop클래스
 sangpum 상품명
 su 개수
 
 인자있는 생성자로 만들어 전달
 출력메서드 writeShop()
 -상품과 개수를 출력
 =================
 MyCart클래스
 price 가격
 Shop을 상속받아 생성자 완성
 writeShop() 오버라이드해서 가격추가
 ====================
 main에서 출력
 상품,개수,가격모두 있는 메서드 출력
 */
class Shop{
	String sangpum;
	int su;
	
	public Shop(String name, int num) {
		this.sangpum = name;
		this.su = num;
	}
	
	public String writeShop() {
		return sangpum+","+su;
	}
}

class MyCart extends Shop{
	
	int price;
	
	public MyCart(String name, int num, int price) {
		super(name, num);
		this.price = price;
	}
	
	@Override
	public String writeShop() {
		return super.writeShop()+","+price;
	}
	
	
}

public class Inheri_06 {

	public static void main(String[] args) {
		
		MyCart my = new MyCart("아이스 아메리카노", 3, 5000);
		System.out.println(my.writeShop());		
	}

}


