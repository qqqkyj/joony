package day0626;

import java.util.Scanner;

public class QuizFind_05 {

	public static void main(String[] args) {
		//숫자를 입력 받아서 배열의 몇번째에 있는지 출력하고 없을 경우 없습니다 라고 출력하세요
		//0이면종료
		//입력값:11
		// 11은 2번째에 있어요
		
		int[] arrNums= {23,11,55,88,99,77,54,21,32,2,5};
		
		Scanner sc = new Scanner(System.in);
		
		int search;
		boolean flag;
		
		while(true) {
			System.out.println("숫자 입력:");
			search=sc.nextInt();
			flag=false;
			
			if(search==0) {
				System.out.println("종료");
				break;
			}
			
			for(int i=0; i<arrNums.length; i++) {
				if(search==arrNums[i]) {
					flag=true;
					System.out.println("입력값:"+search);
					System.out.println(search+"는 "+(i+1)+"번째에 있어요.");
				}
			}
			
			if(!flag) {
				System.out.println("입력하신 데이터는 존재하지 않습니다.");
			}
	
		}
		
	}

}
