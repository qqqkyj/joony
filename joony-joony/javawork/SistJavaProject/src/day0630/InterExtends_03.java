package day0630;

interface InterAA{
	public void eat();
	public void go();
}

interface InterBB extends InterAA{
	public void ride();
}

class InterImpl2 implements InterBB{

	@Override
	public void eat() {
		System.out.println("저녁을 먹습니다.");
	}

	@Override
	public void go() {
		System.out.println("롯데월드를 갑니다.");
	}

	@Override
	public void ride() {
		System.out.println("자전거를 탑니다.");
	}
	
}

public class InterExtends_03 {

	public static void main(String[] args) {
		InterImpl2 im = new InterImpl2();
		im.eat();
		im.go();
		im.ride();
		System.out.println("기본출력");
		
		//다형성
		InterAA inA = new InterImpl2();
		inA.eat();
		inA.go();
		System.out.println("다형성 inAA");
		
		InterBB inB = new InterImpl2();
		inB.eat();
		inB.go();
		inB.ride();
		System.out.println("다형성 inBB");
	}

}
