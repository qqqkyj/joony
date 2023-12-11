package day0622;

import java.util.Scanner;

public class StartsWith_03 {

	public static void main(String[] args) {
		//이름을 반복해서 입력해서 이씨가 몇명인지 알아보자
		//종료==끝
		
		Scanner sc = new Scanner(System.in);
		
		String name;
		int cnt=0;
		
		while(true) {
			System.out.println("이름:");
			name=sc.nextLine();
			
			//break
			if(name.equals("종료"))
				break;
			
			//조건
			if(name.startsWith("이"))// if this string starts with the specified prefix.
				cnt++;
			
		}
		
		System.out.println("이씨성을 가진사람은 총 "+cnt+"명 입니다.");
		
	}

}
