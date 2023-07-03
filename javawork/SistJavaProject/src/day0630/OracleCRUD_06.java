package day0630;

import java.util.Scanner;

abstract class Command{
	public abstract void write();
}

class Insert1 extends Command{

	@Override
	public void write() {
		System.out.println("출력");
	}
	
}

class List extends Command{

	@Override
	public void write() {
		System.out.println("조회");
	}
	
}

class Modify extends Command{

	@Override
	public void write() {
		System.out.println("수정");
	}
	
}

class Delete1 extends Command{

	@Override
	public void write() {
		System.out.println("삭제");
	}
	
}

public class OracleCRUD_06 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		Command com = null;
		int n;
		
		while(true) {//while은 range(범위)가 정해지지 않을 떄 사용하고 break문으로 종료, for은 range(범위)가 정해져 있을 때 사용
			System.out.println("1.추가 2.조회 3.수정 4.삭제 0.종료");
			System.out.println("숫자 입력:");
			n=sc.nextInt();
			
			if(n==0) {
				System.out.println("종료합니다.");
				break;
			}
			else if(n==1) {
				com = new Insert1();
			}
			else if(n==2) {
				com = new List();
			}
			else if(n==3) {
				com = new Modify();
			}
			else if(n==4) {
				com = new Delete1();
			}
			else {
				System.out.println("숫자를 잘못 입력했습니다!!!");
			}
			
			if(n>0||n<5) {
				//인터페이스를 활용한 다형성
				com.write();
				System.out.println("-------------------");
			}
		}
	}

}
