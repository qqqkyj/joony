package day0628;

class Apple{
	private String writer;
	private String subject;
	private static String msg="Happy Day!!";
	
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public static String getMsg() {
		return msg;
	}
	public static void setMsg(String msg) {
		Apple.msg = msg;
	}
	
	
}

public class ExObject_08{
	
	//static메소드는 ExObject_08이라는 클래스를 생성하지 않고 바로 사용가능
	public static void writeApple(Apple apl) {//클래스 자체를 인자값으로 보냄 but main메소드에서 Apple의 객체를 생성 후 사용가능
		System.out.println("***Apple클래스 출력***");
		System.out.println("작성자:"+ apl.getWriter());
		System.out.println("제목:"+ apl.getSubject());
		System.out.println("메세지:"+ Apple.getMsg());
	}
	
	

	public static void main(String[] args) {
		
		System.out.println("Apple클래스의 메시지 출력");
		//객체생성 후 set메소드를 이용해 파라메터값을 넘긴 후 writeApple(Apple클래스의 참조변수)메소드를 이용해 출력가능
		Apple a1 = new Apple();
		a1.setWriter("김은희");
		a1.setSubject("악귀");
		writeApple(a1);
		
		Apple a2 = new Apple();
		a2.setWriter("김성완");
		a2.setSubject("신기생뎐");
		writeApple(a2);
	}

}
