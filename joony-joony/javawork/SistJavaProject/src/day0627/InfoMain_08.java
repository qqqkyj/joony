package day0627;

public class InfoMain_08 {

	public static void main(String[] args) {
		//명시적 생성자는 생성과 동시에 초기화(즉, 파라메터(인자)를 동시에 넘겨줌)
		Info_08 in1 = new Info_08("홍길동", 23, "서울시 강남구");
		Info_08 in2 = new Info_08("강연주", 27, "경기도 성남시");
	
		//getMethod 변수지정
		String name= in1.GetStuName();
		int age = in1.GetAge();
		String addr = in1.GetAddr();
		
		
		//출력
		System.out.println("이름:"+name);
		System.out.println("나이:"+age);
		System.out.println("주소:"+addr);
		
		System.out.println("이름은 "+in2.GetStuName()+"이고 나이는 "+in2.GetAge()+"세이고 주소는 "+in2.GetAddr()+"입니다.");
		
		//default Constructor로 생성
		Info_08 in3 = new Info_08();
		//in3.stuName="김완선";//직접 가져올 수 있지만 private이 설정될 시 접근제한이 걸려 getter로만 가져올 수 있음
		System.out.println("이름은 "+in3.GetStuName()+"이고 나이는 "+in3.GetAge()+"세이고 주소는 "+in3.GetAddr()+"입니다.");
		
	}

}
