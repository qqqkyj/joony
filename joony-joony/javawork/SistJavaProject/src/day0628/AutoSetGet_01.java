package day0628;

class MyDate{
	
	//인스턴스 변수(static이 안붙으면 instance변수)=>생성없이 쓸 수 있는 변수
	private int year;
	private int month;
	private int day;
	
	//디폴드 생성자가 숨어있음
	public MyDate() {
		// TODO Auto-generated constructor stub
	}
	
	//명시적 생성자, 3개의 인자값을 수정과 동시에 생성
	public MyDate(int year, int month, int day) {
		this.year=year;
		this.month=month;
		this.day=day;
	}
		
	public void Year(int myYear) {
		this.year=myYear;
	}
	
	//source->generate getters and setters로 자동완성가능(보편적으로 사용)
	
	MyDate date = new MyDate(2023,6,25);

	
	public int getYear() {
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public int getMonth() {
		return month;
	}
	public void setMonth(int month) {
		this.month = month;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
	
	
}

public class AutoSetGet_01 {

	public static void main(String[] args) {
		
		//객체생성
		MyDate date = new MyDate();
		date.setYear(2023);
		date.setMonth(6);
		date.setDay(28);
		
		MyDate date2 = new MyDate(2023,06,23);//명시적 생성자는 생성과 동시에 파라메터값(인자값)을 동시에 넘겨줌
		
		System.out.printf("%d-%d-%d\n",date.getYear(),date.getMonth(),date.getDay());
		System.out.printf("%d-%d-%d\n",date2.getYear(),date2.getMonth(),date2.getDay());
		
	}

}
