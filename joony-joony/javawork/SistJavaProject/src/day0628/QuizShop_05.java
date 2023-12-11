package day0628;

class MyShop{
	
	private String sangpumName;//상품이름
	private String ipgoday;//입고날
	private String chulgoday;//출고날

	//3개의 데이터를 한 번에 수정할 수 있는 메서드(setter)
	public void setDate(String name, String input, String output) {
		this.sangpumName = name;
		this.ipgoday=input;
		this.chulgoday=output;
	}
	
	//3개의 데이터를 한 번에 출력할 수 있는 메서드(getter)
	public void getDate() {
		System.out.println("상품 이름:"+sangpumName);
		System.out.println("입고일:"+ipgoday);
		System.out.println("출고일:"+chulgoday);
	}
	
	//디폴트 생성자
	public MyShop() {
		
	}
	
	//명시적 생성자(3개의 파라메터_인자값을 같이 넘겨줌)
	public MyShop(String name, String input, String output) {
		this.sangpumName = name;
		this.ipgoday=input;
		this.chulgoday=output;
	}
	
}

public class QuizShop_05 {

	public static void main(String[] args) {
		
		//메소드를 이용한 방법
		MyShop shop = new MyShop();
		shop.setDate("키보드", "2023-06-01", "2023-06-20");
		shop.getDate();
		
		//생성자를 이용한 방법
		MyShop shop2 = new MyShop("모니터","2023-06-04","2023-06-23");
		shop2.getDate();
		
		
		
	}

}
