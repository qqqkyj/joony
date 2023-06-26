package day0616;

import java.util.Calendar;
//import java.util.Date;

public class CalendarTest_11 {

	public static void main(String[] args) {

		//Date data = new Date(); //객체생성한 것은 참조변수 date(사용안함)		
		//System.out.println("지금은 "+ (data.getYear()+1990));
		
		//cal은 참조변수명
		Calendar cal = Calendar.getInstance();//수학공식,달력처럼 이미 정해져 있는것을 instance화 해서 가져오도록 함
		System.out.println("지금은 "+cal.get(cal.YEAR)+"년도 입니다.");
		System.out.println("지금은 "+(cal.get(cal.MONTH)+1)+"월 입니다.");//달은 +1을 해야됨
		System.out.println("지금은 "+cal.get(cal.DATE)+"일 입니다.");
		//System.out.println("지금은 "+cal.get(cal.DAY_OF_MONTH)+"일 입니다.");//위의 값과 같은 결과출력
		System.out.printf("오늘은 %d년 %d월 %d일 입니다.\n", cal.get(cal.YEAR),cal.get(cal.MONTH),cal.get(cal.DATE));
		System.out.printf("지금은 %d시 %d분 %d초 입니다.\n", cal.get(cal.HOUR),cal.get(cal.MINUTE),cal.get(cal.SECOND));
		System.out.printf("지금은 %d시 %d분 %d초 입니다.", cal.get(cal.HOUR_OF_DAY),cal.get(cal.MINUTE),cal.get(cal.SECOND));
		
	}

}
