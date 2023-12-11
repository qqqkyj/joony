package day0629_1;
//부모 패키지
/*부모클래스가 다른패키지에 있을 경우 protected, public 변수는 접근이 가능
  같은 패키지인 경우에는 private을 제외한 모든 접근은 가능*/
public class SuperObj {
	
	protected String name;
	protected int age;
	
	//명시적 생성자
	public SuperObj(String name, int age) {
		this.name=name;
		this.age=age;
	}
	

}
