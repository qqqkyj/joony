package day0628;

class Score{
	
	private String stuName;
	private int java;
	private int oracle;
	private int html;
	
	static final String TITLE = "중간고사 시험결과";

	public String getStuName() {
		return stuName;
	}

	public void setStuName(String stuName) {
		this.stuName = stuName;
	}

	public int getJava() {
		return java;
	}

	public void setJava(int java) {
		this.java = java;
	}

	public int getOracle() {
		return oracle;
	}

	public void setOracle(int oracle) {
		this.oracle = oracle;
	}

	public int getHtml() {
		return html;
	}

	public void setHtml(int html) {
		this.html = html;
	}
	
	//합계 메서드
	public int getTotal() {
		int total = java+oracle+html;
		return total;
	}
	
	//평균 메서드
	public double getAvg() {
		return getTotal()/3.0;
	}
	
	
}

public class ExObject_07 {

	public static void main(String[] args) {

		Score[] m = new Score[2];
		
		for(int i=0; i<2; i++) {
			m[i]=new Score();
		}
		m[0].setStuName("김지윤");
		m[0].setJava(99);
		m[0].setOracle(88);
		m[0].setHtml(56);
		
		m[1].setStuName("김동현");
		m[1].setJava(79);
		m[1].setOracle(68);
		m[1].setHtml(76);
		
		System.out.println("***"+Score.TITLE+"***");
		
		for(int i=0; i<2; i++) {
			System.out.println("학생명:"+m[i].getStuName());
			System.out.println("JAVA:"+m[i].getJava()+"점");
			System.out.println("ORACLE:"+m[i].getOracle()+"점");
			System.out.println("HTML:"+m[i].getHtml()+"점");
			System.out.println("총점:"+m[i].getTotal()+"점");
			System.out.printf("평균:%.2f점\n",m[i].getAvg());
			System.out.println("----------------");
		}
		
		
		
	}

}
