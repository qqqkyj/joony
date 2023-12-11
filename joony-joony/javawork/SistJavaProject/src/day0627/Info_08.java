package day0627;

public class Info_08 {

	String stuName;
	int age;
	String addr;
	
	//생성자
	public Info_08() {
		
	}
	
	//명시적 생성자
	public Info_08(String name, int age, String addr) {
		
		stuName=name;
		this.age=age;
		this.addr=addr;
		
	}
	
	//getter메서드
	public String GetStuName() {
		return stuName;
	}
	
	public int GetAge() {
		return age;
	}
	
	public String GetAddr() {
		return addr;
	}
	
}
