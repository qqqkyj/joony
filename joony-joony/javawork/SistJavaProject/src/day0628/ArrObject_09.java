package day0628;

class Student{
	private String sname;
	private String hp;
	private int grade;
	
	//명시적 생성자
	public Student(String name, String hp, int grade) {
		this.sname = name;
		this.hp = hp;
		this.grade = grade;
	}
	
	//멤버값 출력데이터
	public void getData() {
		System.out.println("이름: "+sname);
		System.out.println("연락처: "+hp);
		System.out.println("학년: "+grade+"학년");
	}
	
}

public class ArrObject_09 {

	public static void main(String[] args) {
		
		/*Student[] stu = new Student[3];
		
		stu[0] = new Student("이민규","010-4567-4567",3);
		stu[1] = new Student("최진평","010-1111-2345",1);
		stu[2] = new Student("진현규","010-4458-7777",4);*/
		
		//생성과 동시에 초기화
		Student[] stu = {new Student("이민규","010-4567-4567",3),
						 new Student("최진평","010-1111-2345",1),
						 new Student("진현규","010-4458-7777",4)};
		
		
		for(int i=0; i<stu.length; i++) {
			stu[i].getData();
			System.out.println("---------------------");
		}
		
		//foreach, for(자료형 참조변수명:가져올 참조변수명)=>for(클래스이름 내가정한이름: 클래스의 참조변수) 
		for(Student m: stu) {
			m.getData();
			System.out.println("---------------------");
		}
		
	}

}
