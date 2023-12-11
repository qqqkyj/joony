package day0628;

class Member{
	private String stuName;//학생명
	private String gender;//성별
	private String addr;//주소
	
	static String ban="SSANGYONG";
	static int cnt=0;
	
	//수정용 메서드
	public void setMembers(String name, String gender, String addr) {
		this.stuName=name;
		this.gender=gender;
		this.addr=addr;
	}
	
	//출력용 메서드
	public void getMembers() {
		cnt++;
		System.out.println("**학생"+cnt+"정보**");
		System.out.println("이름:"+stuName);
		System.out.println("성별:"+gender);
		System.out.println("주소:"+addr);
		System.out.println("소속 학급:"+ban);
		System.out.println("------------------");
	}
	
	
}

public class ExObject_06 {

	public static void main(String[] args) {

		Member stu1 = new Member();
		stu1.setMembers("강연주", "여자", "경기도 성남시");
		stu1.getMembers();
		
		Member stu2 = new Member();
		stu2.setMembers("홍길동", "남자", "서울시 강남구");
		stu2.getMembers();
		
		Member stu3 = new Member();
		stu3.setMembers("홍길순", "여자", "강원도 인제군");
		stu3.getMembers();
		
	}

}
