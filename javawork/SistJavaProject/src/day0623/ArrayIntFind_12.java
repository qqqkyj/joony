package day0623;

import java.util.Scanner;

public class ArrayIntFind_12 {

	public static void main(String[] args) {
		//숫자를 입력해서 그 숫자가 있는지 찾기
		//없으면 없다고, 있으면 그 숫자가 몇번째 있는지 찾기
		//0을 입력시 종료: while(true)
		
		int [] data= {12,10,89,5,23,1,6,78,98,50};
		int find;//입력할 수
		boolean flag;//
		
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			System.out.print("숫자 입력:");
			find=sc.nextInt();
			
			//break
			if(find==0)
			{
				System.out.println("종료");
				break;
			}
			
			//있다/없다 초기값
			flag=false;//data를 찾으면 true로 바뀜
			
			//값 찾기
			for(int i=0; i<data.length; i++) {
				if(find==data[i]) {
					flag=true;
					System.out.println((i+1)+"번째에서 검색");
				}
			}
			
			if(!flag)//flag=false
				System.out.println(find+"는 데이터에 없습니다.");
			
		}
		
		
	}

}
