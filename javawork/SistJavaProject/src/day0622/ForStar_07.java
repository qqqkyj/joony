package day0622;

public class ForStar_07 {

	public static void main(String[] args) {
		
		System.out.println("중첩(다중)for문으로 별모양 찍기\n");
		
		/*for(int i=1; i<=5; i++) {//행갯수=>세로
			for(int j=1; j<=9; j++) {//열갯수=>가로
				System.out.print("*");	
			}
			System.out.println();
		}*/
		
		
		/*for(int i=5; i>=1; i--) {//행갯수=>세로
			for(int j=i; j<=5; j++) {//열갯수=>가로
				System.out.print("*");
			}
			System.out.println(" ");
		}
		
		for(int i=1; i<=5; i++) {		
			for(int j=1; j<=i; j++) {
				System.out.print("*");
			}
			System.out.println(" ");
		}
		
		for(int i=1; i<=5; i++) {
			for(int j=5; j>=i; j--) {
				System.out.print("*");
			}
			System.out.println(" ");
		}*/
		
		for(int i=0; i<=5; i++) {//TREE 만들기
			
			for(int j=5; j>=i; j--) {//공백찍기
				System.out.print(" ");
			}
			
			for(int j=1; j<=i*2+1; j++) {//*찍기
				System.out.print("*");
			}
			System.out.println(" ");
		}
		
		
		
	}

}
