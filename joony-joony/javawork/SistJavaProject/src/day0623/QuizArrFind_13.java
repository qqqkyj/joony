package day0623;

import java.util.Scanner;

public class QuizArrFind_13 {

	public static void main(String[] args) {
		//이름을 입력해서 없으면 없다고 있으면 몇번째 있는지 
		//끝이라고 쓰면 종료
		
		String [] stuNames = {"이성신","이민규","박병주","최성현","김영준","강연주","최진평","고은비","송주영"};
		
		String name;
		boolean flag;
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			
			System.out.print("찾을 이름 입력:");
			name=sc.nextLine();
			
			if(name.equals("끝")) {
				System.out.println("종료");
				break;
			}
			
			flag=false;
			
			for(int i=0; i<stuNames.length; i++) {
				if(name.equals(stuNames[i])) {
					flag=true;
					System.out.println((i+1)+"번째에서 찾았습니다.");
				}
			}
			
			if(!flag)
				System.out.println("데이터를 찾지 못했습니다.");
			
		}
		
	}

}
