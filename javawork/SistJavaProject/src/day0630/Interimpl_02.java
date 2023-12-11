package day0630;

interface InterA{
	public void draw();
	public void write();
	
}

interface InterB{
	public void play();
}

class Impl implements InterA, InterB{//인터페이스는 다중 구현(implements)이 가능, but inter와 inter는 extends

	@Override
	public void play() {
		System.out.println("축구를 합니다.");
	}

	@Override
	public void draw() {
		System.out.println("그림을 그립니다.");
	}

	@Override
	public void write() {
		System.out.println("일기를 씁니다.");
	}
	
}


public class Interimpl_02 {

	public static void main(String[] args) {
		Impl im = new Impl();
		im.play();
		im.draw();
		im.write();
		
		//다형성=>앞에 부모를 자식으로 생성
		InterA inA = new Impl();
		inA.draw();
		inA.write();
		
		InterB inB = new Impl();
		inB.play();
	}

}
