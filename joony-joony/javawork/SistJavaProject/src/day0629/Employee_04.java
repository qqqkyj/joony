package day0629;
//부모클래스
public class Employee_04 {
	String sawonName;
	int salary;
	
	public Employee_04(String name, int sal) {
		this.sawonName = name;
		this.salary = sal;
	}
	
	//리턴메서드
	public String getEmp() {
		return sawonName+","+salary;
	}
	
	//인터페이스의 목적은 오버라이딩, {}인 구현부가 없음, 추상메서드의 집합, EX)public String getEmp();
	//즉 인터페이스를 통해 추상메서드를 불러와 구현{}작성을 해주는 것이 일반적(체계적 업무)
	
}
