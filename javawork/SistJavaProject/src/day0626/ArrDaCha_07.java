package day0626;

public class ArrDaCha_07 {

	public static void main(String[] args) {
		//다차원배열 선언과 동시에 초기값 지정후 출력
		
		int[][] arr = {
				{22,33},
				{11,22,33},
				{10,20,30,40}
		};
		
		System.out.println("총행개수:"+arr.length);
		System.out.println("0행의 열개수:"+arr[0].length);
		System.out.println("1행의 열개수:"+arr[1].length);
		System.out.println("2행의 열개수:"+arr[2].length);
		
		//for문 출력
		for(int row=0; row<arr.length; row++) {//행의 개수:arr.length
			for(int col=0; col<arr[row].length; col++) {//열의 개수:arr[i].length
			//System.out.print(arr[row][col]+" ");
			System.out.printf("arr[%d][%d]=%d\t",row,col,arr[row][col]);
			}
			System.out.println();
		}
		
	}

}
