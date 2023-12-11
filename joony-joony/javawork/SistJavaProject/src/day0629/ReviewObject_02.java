package day0629;
/*
 나는 (스타벅스 코엑스매장)에 왔습니다
 (아이스 아메리카노)를 주문합니다
 (우산)을 샀어요 
 */
class Starbucks{
	
	private String store;//지점
	private String menu;//메뉴
	private String goods;//텀블러등등
	
	//디폴트 생성자
	public Starbucks() {
	}
	
	//명시적 생성자
	public Starbucks(String store, String menu, String goods) {
		this.store = store;
		this.menu = menu;
		this.goods = goods;
	}
	
	public String getStore() {
		return store;
	}
	public void setStore(String store) {
		this.store = store;
	}
	public String getMenu() {
		return menu;
	}
	public void setMenu(String menu) {
		this.menu = menu;
	}
	public String getGoods() {
		return goods;
	}
	public void setGoods(String goods) {
		this.goods = goods;
	}
	
	
	
}

public class ReviewObject_02 {
		public static void getData(Starbucks a) {
			System.out.println("나는 "+a.getStore()+"에 왔습니다.");
			System.out.println(a.getMenu()+"를 주문합니다.");
			System.out.println(a.getGoods()+"을 샀어요.");
			System.out.println("------------------------------");
		}
	
	public static void main(String[] args) {
		
		Starbucks shop = new Starbucks();
		shop.setStore("스타벅스 코엑스매장");
		shop.setMenu("아이스 아메리카노");
		shop.setGoods("우산");
		
		getData(shop);
		
		//명시적 생성자 이용
		Starbucks shop2 = new Starbucks("스타벅스 강남점","라떼","머그컵");
		
		getData(shop2);
		
	}

}
