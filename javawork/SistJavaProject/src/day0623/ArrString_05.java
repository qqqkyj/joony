package day0623;

public class ArrString_05 {

	public static void main(String[] args) {
		//배열선언 문자열 선언후 초기값
		String[] str = new String[4];
		
		//초기화
		str[0]="최진평";
		str[1]="고은비";
		str[2]="김영환";
		str[3]="홍성경";
		
		//출력
		for(int i=0; i<str.length; i++) {
			System.out.print(i+":"+str[i]+" ");
		}
		
		System.out.println();
		
		for(String s1 : str) {
			System.out.print(s1+" ");
		}
		
	}

}
