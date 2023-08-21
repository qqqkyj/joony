package day0628;

class MyPersonInfo{
	private String name;
	private String blood;
	private String age;
	
	//명시적 생성자
	public MyPersonInfo(String name, String blood, String age) {
		this.name=name;
		this.blood=blood;
		this.age=age;
	}
	
	//제목
	public static void title() {
		System.out.println("이름\t혈액형\t나이");
		System.out.println("----------------------");
	}
	
	//출력문
	public void getInfo() {
		System.out.println(name+"\t"+blood+"형\t"+age+"세");
	}
}


public class ArrObject_10 {

	public static void main(String[] args) {
		MyPersonInfo[] m = new MyPersonInfo[3];
		
		m[0]=new MyPersonInfo("홍길동", "A", "25");
		m[1]=new MyPersonInfo("홍길순", "B", "27");
		m[2]=new MyPersonInfo("강철수", "O", "23");
		
		MyPersonInfo.title();
		
		for(int i=0; i<m.length; i++) {
			m[i].getInfo();
			System.out.println("----------------------");
		}
		
		
		//배열생성과 동시에 초기화
		MyPersonInfo[] n= {new MyPersonInfo("홍길동", "A", "25"),
							new MyPersonInfo("홍길순", "B", "27"),
							new MyPersonInfo("강철수", "O", "23")};
						
		for(MyPersonInfo info:n) {
			info.getInfo();
			System.out.println("----------------------");
		}
		
	}

}
