package day0703;

import java.util.Date;

public class NullPoint_02 {
	
	Date date;//객체를 생성하지 않고 클래스의 메서드 호출시,  nullPointException 발생
	
	public void writeDay() {
		int y,m,d;
		try {
		//date = new Date();
		y=date.getYear()+1900;
		m=date.getMonth()+1;//calendar도 +1 해줘야 됨
		d=date.getDate();
		
		System.out.printf("%d년 %d월 %d일 입니다.\n",y,m,d);
		}catch (NullPointerException e) {
			System.out.println("객체생성을 하지 않았습니다.\n"+e.getMessage());
		}
	}
	
	public static void main(String[] args) {
		NullPoint_02 np = new NullPoint_02();
		np.writeDay();
		System.out.println("정상종료!!");
	}

}
