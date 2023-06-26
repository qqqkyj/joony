package day0623;

public class TempNumChange_11 {

	public static void main(String[] args) {
		//순서바꾸기
		int a=10, b=20;
		int temp;//일시적인 데이터 저장소
		
		System.out.println("a="+a+", b="+b);
		
		temp=a;
		a=b;
		b=temp;
		
		System.out.println("a="+a+", b="+b);
		
		int[] n = {5,7,9};
		
		for(int t:n) {
			System.out.printf(t+" ");
		}
		
		System.out.println("0번과 2번 교환 후 출력");
		
		int temp1=n[0];
		n[0]=n[2];
		n[2]=temp1;
		
		for(int t:n) {
			System.out.printf(t+" ");
		}
		
		
		int[] data = {15,21,30,8,98,45,2,10,9,78};
		int temp2;
		
		
	}

}
