package day0627;
/*
 멤버: private, 디폴트 생성자
 [쇼핑 목록]
 
 쇼핑장소: 이마트
 
 목록1
 상품명:손선풍기
 가격:25000원
 
 목록2
 상품명:핸드폰 충전기
 가격:30000원
 
  목록3
  상품명:이어폰
  가격:70000원
 */
public class Quiz_09 {
	
	//변수선언
	private static String SHOP="EMART";
	private String name;//null
	private int price;//0

	//set메서드
	public void SetName(String name) {
		this.name = name;
	}
	
	public void SetPrice(int price) {
		this.price=price;
	}
	
	//get메서드
	public static String GetShop() {
		return SHOP;
	}
	
	public String GetName() {
		return name;
	}
	
	public int GetPrice() {
		return price;
	}
}
