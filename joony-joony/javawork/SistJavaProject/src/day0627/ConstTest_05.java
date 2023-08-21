package day0627;

class ConstA{
	
	int num=0;
	
	//디폴트생성자...명시적인 생성자를 만들면 디폴트 생성자는 자동생성 되지않음, 필요시 만들어야 사용가능
	public ConstA() {//extends Object
		num=10;
		System.out.println("디폴트 생성자");
	}
	
	
	//인자있는생성자
	public ConstA(int n) {//생성과 동시에 파라메터값을 같이 넘김
		this.num=n;//자기자신을 가리키는 참조변수, this는 인스턴스변수(iv)만 붙일 수 있음, static은 안됨
		System.out.println("생성자 호출");
	}
	
	//메서드
	//클래스와 메서드차이: 클래스명과 같으면 생성자 아니면 메서드, 메서드이름의 시작은 소문자
	public int getNumber() {
		num=50;
		return num;
	}
	
}


/////////////////////////////////////////
public class ConstTest_05 {

	public static void main(String[] args) {
		
		//명시적 생성자(인자값으로 num을 보낸 생성자)
		ConstA ca1 = new ConstA(30);//객체생성과 동시에 parameter값을 인자에 넘겨줘야 됨
		System.out.println(ca1.num);
		
		//디폴트 생성자
		ConstA ca2 = new ConstA();
		System.out.println(ca2.num);
		
		//메서드 호출
		ConstA ca3 = new ConstA();//static이 붙지않은 메서드 호출시 반드시 객체를 생성해야 불러올 수 있음
		System.out.println(ca3.getNumber());
		
	}

}
