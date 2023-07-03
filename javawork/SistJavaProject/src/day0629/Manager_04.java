package day0629;

public class Manager_04 extends Employee_04{
	
	String buseo;
	
	public Manager_04(String name, int sal, String b) {
		super(name, sal);//부모생성자 호출
		this.buseo = b;//초기화
		
	}
	
	//1.상속이 전제, 2.메서드이름 동일, 3.리터타입 동일
	@Override//부모 클래스에 있는 메소드를 자식 클래스에서 재정의=>Override(기각하다, 이전 결정을 번복하는 결정_재정의)
	public String getEmp(){
		return super.getEmp()+","+buseo;
		
	}
}
