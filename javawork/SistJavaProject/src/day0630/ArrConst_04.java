package day0630;
/*
 성현이가 게임을 합니다
 순영이가 게임을 합니다
 선범이가 게임을 합니다
 선범이가 게임을 종료합니다
 순영이가 게임을 종료합니다
 성현이가 게임을 종료합니다
 */
abstract class Game{
	abstract void play();
	abstract void stop();
}

class SungHyeon extends Game{

	@Override
	void play() {
		System.out.println("성현이가 게임을 합니다.");
	}

	@Override
	void stop() {
		System.out.println("성현이가 게임을 종료합니다.");
	}
	
}

class SunYeong extends Game{

	@Override
	void play() {
		System.out.println("순영이가 게임을 합니다.");
	}

	@Override
	void stop() {
		System.out.println("순영이가 게임을 종료합니다.");
	}
	
}

class SunBum extends Game{

	@Override
	void play() {
		System.out.println("선범이가 게임을 합니다.");
	}

	@Override
	void stop() {
		System.out.println("선범이가 게임을 종료합니다.");
	}
	
}

public class ArrConst_04 {

	public static void main(String[] args) {
		
		//다형성=> 부모클래스명 참조변수 = new 자식클래스명
		Game[] game = {new SungHyeon(),new SunYeong(),new SunBum()};
		
		for(int i=0; i<game.length; i++) {
			game[i].play();
		}
		
		for(int i=game.length-1; i>=0;i--) {
			game[i].stop();
		}
		

	}

}
