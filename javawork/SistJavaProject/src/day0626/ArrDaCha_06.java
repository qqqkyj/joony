package day0626;

public class ArrDaCha_06 {

	public static void main(String[] args) {
		
		int [][] arr = new int[2][3];//2행3열로 할당(row, col)
		
		//초기값
		arr[0][0]=10;
		arr[0][1]=20;
		arr[0][2]=30;
		
		arr[1][0]=5;
		arr[1][1]=10;
		arr[1][2]=20;
		
		System.out.println("***데이터 출력***");
		
		for(int row=0; row<arr.length; row++) {//행의 개수:arr.length
			for(int col=0; col<arr[row].length; col++) {//열의 개수:arr[i].length
			//System.out.print(arr[row][col]+" ");
			System.out.printf("arr[%d][%d]=%d\t",row,col,arr[row][col]);
			}
			System.out.println();
		}
		
		
		System.out.println("2차원 배열에 값 변경후 다시 출력");
		arr[0][1]=1000;
		arr[1][0]=2000;
		arr[1][2]=3000;
		
		for(int row=0; row<arr.length; row++) {//행의 개수:arr.length
			for(int col=0; col<arr[row].length; col++) {//열의 개수:arr[i].length
			//System.out.print(arr[row][col]+" ");
			System.out.printf("arr[%d][%d]=%d\t",row,col,arr[row][col]);
			}
			System.out.println();
		}
		
	}

}
