package day0629;

public class EmpMain_04 {

	public static void main(String[] args) {
		//최지우, 2500000, 기획경영부 라고 출력하려면?
		
		Manager_04 manager = new Manager_04("최지우", 2500000, "기획경영부");
		
		System.out.println(manager.getEmp());//재정의된 메서드 호출(override된 메서드)
		
	}

}
