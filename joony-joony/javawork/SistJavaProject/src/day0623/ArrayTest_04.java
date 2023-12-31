package day0623;

import java.util.Scanner;

public class ArrayTest_04 {

	public static void main(String[] args) {
		//기본형배열은 객체로 인식
		
		int[] arr1, arr2;//배열선언
		arr1 = new int[3];//index값을 줘야 메모리를 할당함, list와 달리 배열은 메모리를 먼저 할당해야 사용할 수 있음
		arr2 = new int[5]; //할당만 되도 값은 0으로 초기화
		
		//int[] arr1 = new int[3];
		//int[] arr2 = new int[5];
		
		//arr1 배열에 값을 넣는다
		arr1[0]=10;
		arr1[1]=5;
		arr2[2]=20;
		
		//배열의 개수
		System.out.println(arr1.length);
		System.out.println(arr2.length);
		
		System.out.println("for문으로 arr1출력_범위를 변수화");
		
		for(int i=0; i<arr1.length; i++) {
			System.out.print(arr1[i]+" ");
		}
		
		System.out.println();
		
		//arr2를 출력해 보는데 범위를 변수화한 for문으로 출력해보세요
		for(int i=0; i<arr2.length; i++) {
			System.out.print(arr2[i]+" ");
		}
		
		System.out.println();
		
		//for~each
		//foreach(배열변수자료형 임의의이름: 변수명)
		for(int a1:arr1) //arr1을 a1에 대입
		{
			System.out.print(a1+" ");
		}
		
		System.out.println();
		
		for(int a2:arr2) {//arr2를 a2에 대입
			System.out.print(a2+" ");
		}
		
		
	}

}
