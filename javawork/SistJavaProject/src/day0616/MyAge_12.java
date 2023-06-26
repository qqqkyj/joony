package day0616;

import java.util.Calendar;

public class MyAge_12 {

	public static void main(String[] args) {
		//매개변수 args에서 실행시 이름과 태어난 연도를 보낸 후 출력하세요(name, myBirth)
		//이름: 이민규
		//태어난 연도: 1995년도
		//나이: 28세
		
		//현재년도는 Calendar import하여 구할 수 있다.
		//import->변수->계산->출력
		
		//변수
		String name = args[0];
		int myBirth = Integer.parseInt(args[1]);
		int age;
		Calendar cal = Calendar.getInstance();
		//int curYear = calendar.get(calendar.YEAR);//현재년도
		
		//계산
		age = cal.get(cal.YEAR)-myBirth;
		//int myAge = curYear-myBirth;
		
		//출력
		System.out.printf("이름: %s\n"
						+ "태어난 연도: %d년도\n"
						+ "나이: %d세",name,myBirth,age);
		
		
		
	}

}
