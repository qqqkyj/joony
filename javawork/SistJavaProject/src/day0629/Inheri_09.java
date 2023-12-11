package day0629;

class Work{
	public void process() {
		System.out.println("작업중!!!");
	}
}

class Food1 extends Work{
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("***음식을 합니다***");
	}
}

class Clean extends Work{
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("***청소를 합니다***");
	}
}

class Study extends Work{
	@Override
	public void process() {
		// TODO Auto-generated method stub
		super.process();
		System.out.println("***공부를 합니다***");
	}
}


public class Inheri_09 {

	public static void main(String[] args) {
		//일반적인 생성, 메서드 호출
		Food1 food = new Food1();
		food.process();
		Clean clean = new Clean();
		clean.process();
		Study study = new Study();
		study.process();
		
		//다형성, 부모클래스 참조변수 = new 자식클래스();
		System.out.println("-----------다형성 출력-----------");
		Work work;
		work= new Food1();
		work.process();
		work = new Clean();
		work.process();
		work = new Study();
		work.process();
		
		
	}

}
