package day0630;

import java.util.Scanner;

interface Board{
	public void process();
}

class Insert implements Board{

	@Override
	public void process() {
		System.out.println("게시물 추가");
	}
	
}

class Select implements Board{

	@Override
	public void process() {
		System.out.println("게시물 조회");
	}
	
}

class Update implements Board{
	//modify
	@Override
	public void process() {
		System.out.println("게시물 수정");
	}
	
}

class Delete implements Board{

	@Override
	public void process() {
		System.out.println("게시물 삭제");
	}
	
}



public class BoardCRUD_ {

	public static void main(String[] args) {
		Scanner sc = new Scanner(System.in);
		
		//다형성, board라는 부모클래스가 Insert, Select, Update, Delete라는 자식클래스로 객체 생성가능
		//부모클래스명(Board) 참조변수(board) = new 자식클래스명(); 참조변수(board)로 4가지의 클래스를 모두 호출할 수 있음
		Board board = null;
		int n; //입력받을 숫자
		
		exit :while(true) {
			System.out.println("1.추가 2.조회 3.수정 4.삭제 0.종료");
			System.out.println("==============================");
			n=sc.nextInt();
			
			switch(n) {//각각의 case의 조건을 실행 후 break를 해줘야 switch문을 빠져나갈 수 있음
			case 1:
				board = new Insert();
				break;
			case 2:
				board = new Select();
				break;
			case 3:
				board = new Update();
				break;
			case 4:
				board = new Delete();
				break;
			case 0:
				System.out.println("종료합니다.");
				sc.close();//Scanner 종료
				//System.exit(0);//강제종료, 루프 사용없이 강제종료가능
				break exit;//exit이라는 이름의 루프를 빠져나감
			default:
				System.out.println("숫자를 잘못 입력했습니다.");		
			}
			
			if(n>0||n<5) {
				board.process();
			}
			
		}
		
	}

}
