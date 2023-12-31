package day0626;

import java.util.Scanner;

public class BinggoGame_09 {

	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		
		//3행3열 배열 생성
		int[][] puzzle= new int [3][3];
		int binggo;
		
		while(true) {
			System.out.println("***같은 숫자가 나오면 빙고***");
			
			
			//3행3열에서 1~3까지의 난수발생
			for(int row=0; row<puzzle.length;row++) {//행
				for(int col=0; col<puzzle[row].length;col++) {//열
					puzzle[row][col]=(int)(Math.random()*3)+1;
					System.out.printf("%4d",puzzle[row][col]);
				}
				System.out.println();
			}
			
			//빙고 갯수
			binggo=0;
			//가로방향 3개 세로방향 3개
			for(int i=0; i<puzzle.length; i++) {
				//가로방향
				if(puzzle[i][0]==puzzle[i][1]&&puzzle[i][1]==puzzle[i][2])
					binggo++;
					
				//세로방향
				if(puzzle[0][i]==puzzle[1][i]&&puzzle[1][i]==puzzle[2][i])
					binggo++;
			}
			
			//대각선 /방향
			if(puzzle[0][2]==puzzle[1][1]&&puzzle[1][1]==puzzle[2][0])
				binggo++;
				
			//대각선 \방향
			if(puzzle[0][0]==puzzle[1][1]&&puzzle[1][1]==puzzle[2][2])
				binggo++;
			
			//빙고출력
			if(binggo==0) {
				System.out.println("\t꽝!!!");
			}else {
				System.out.println("\t빙고:"+binggo+"개");
			}
			
			//게임종료
			System.out.println("엔터를 누르면 다음 난수가 나옵니다.(q:종료)");
			String answer = sc.nextLine();
			if(answer.equalsIgnoreCase("q")||answer.equalsIgnoreCase("Q")){
				System.out.println("게임을 종료합니다.");
				break;
			}
			
			
			
		}
		
		
		
	}

}
