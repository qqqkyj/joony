package day0627;
/*
 **상품입고**
 --------------
 입고된 상점:롯데마트
 --------------
 상품명:딸기
 가격:10000원
 수량:5팩
 --------------
 상품명:초코파이
 가격:5000원
 수량:10상자
 --------------
 상품명:요거트
 가격:2500원
 수량:100팩
 --------------
 */
public class Quiz_10 {

	//멤버변수선언
	private String sangpum;//상품명
	int su;//수량
	int dan;//단가
	static String SHOPNAME="롯데마트";//상점
	
	
	//setter
	public void setSangpum (String name) {
		this.sangpum=name;
	}
	
	public void setSu(int num) {
		this.su=num;
	}
	
	public void setDan(int price) {
		this.dan = price;
	}
	
	//getter
	
	public String getSangpum() {
		return sangpum;
	}
	
	public int getSu() {
		return su;
	}
	
	public int getDan() {
		return dan;
	}
	
	public String getSHOPNAME() {
		return SHOPNAME;
	}
}
