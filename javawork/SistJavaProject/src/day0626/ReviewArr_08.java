package day0626;

public class ReviewArr_08 {

	public static void main(String[] args) {
		//해당 배열을 for문을 이용하여 출력하시오
		
		//1.ex)0번지: 영환이
		String[] names = {"영환이","수환이","동환이","성환이"};
		for(int i=0; i<names.length; i++) {
			System.out.println(names[i]+" ");
		}
		
		
		//2.해당 배열을 가로로 출력
		int [] nums = {2,4,5,7,8};
		for(int i=0; i<nums.length; i++) {
			System.out.printf(nums[i]+" ");
		}
		
		System.out.println();
		
		
		//flowers
		String[] flowers= {"장미","개나리","철죽","백합","코스모스"};
		for(int i=0; i<flowers.length;i++) {
			System.out.printf(flowers[i]+" ");
		}
		System.out.println();
		
		
		//colors
		String[] colors= {"빨강","파랑","검정","흰색","핑크"};
		for(int i=0; i<colors.length;i++) {
			System.out.print(colors[i]+" ");
		}
		System.out.println();
		
	}

}
