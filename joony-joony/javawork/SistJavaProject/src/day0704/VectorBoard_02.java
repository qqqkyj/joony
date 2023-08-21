package day0704;

import java.util.List;
import java.util.Scanner;
import java.util.Vector;

public class VectorBoard_02 {
	
	//Vector<Board> v = new Vector<Board>();//Vector에 Board라는 클래스를 담음
	List<Board> list = new Vector<Board>();//List에 Board클래스타입으로 담음
	//클래스 타입으로 지정했으므로 데이터를 꺼내고 받을때도 클래스
 	
	//입력
	public void inputBoard() {
		Scanner sc = new Scanner(System.in);
		String writer, subject, content;
		
		System.out.println("작성자명:");
		writer=sc.nextLine();
		System.out.println("제목:");
		subject=sc.nextLine();
		System.out.println("내용:");
		content=sc.nextLine();
		
		Board data = new Board(writer, subject, content);
		/*Board data2 = new Board(); //각각 삽입하는 방법도 있음
		data2.setWriter(writer);
		data2.setContent(content);
		data2.setSubject(subject);*/
		list.add(data);
		
		System.out.println("현재 데이터 개수:"+list.size());
	}
	
	//출력
	public void writeBoard() {
		System.out.println("*****게시판*****");
		System.out.println("==========================================");
		
		for(int i=0; i<list.size(); i++) {
			Board b = list.get(i);//리스트내에 지정된 위치에 있는 요소값을 돌려줌
			System.out.println("["+(i+1)+"]"
								+"\t작성자:"+b.getWriter()
								+"\t제목:"+b.getSubject()
								+"\t내용:"+b.getContent());
			System.out.println("---------------------------------------");
			
			/*System.out.println("작성자:"+list.get(i).getWriter());
			System.out.println("제목:"+list.get(i).getSubject());
			System.out.println("내용:"+list.get(i).getContent());*/
		}
	}
	
	public static void main(String[] args) {
		
		VectorBoard_02 vb = new VectorBoard_02();
		Scanner sc = new Scanner(System.in);
		int n;
		
		while(true) {
			System.out.println("1.추가 2.전체출력 0.종료");
			n=Integer.parseInt(sc.nextLine());
			
			if(n==1)
				{vb.inputBoard();}
			else if(n==2)
				{vb.writeBoard();}
			else if(n==0)
				{System.out.println("프로그램 종료");
				break;}
			else {
				System.out.println("숫자를 잘못 입력하셨습니다.");
			}
		}
		
	}

}
