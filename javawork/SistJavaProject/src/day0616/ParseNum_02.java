package day0616;

public class ParseNum_02 {

	public static void main(String[] args) {
		//String 타입을 int 타입으로 변경하려면
		//Integer.parseInt("10");=> 문자열10이 정수10로 반환 (Int로 형을 변형해 준다.) =>암기
		//Double.parseDouble("12.23"); 문자열 12.23이 실수타입의 12.23으로 반환
		
		String num1 = "10";
		String num2 = "20";
		
		System.out.println("두수 더하기: "+ (num1+num2));
		
		//문자열 num1, num2를 정수타입 int로 변환 후 계산
		int su1 = Integer.parseInt(num1);
		int su2 = Integer.parseInt(num2);
		
		System.out.println("변환 후 두수 더하기:"+(su1+su2));
		System.out.println("두수 뺴기:"+(su1-su2));
		System.out.println("두수 곱하기:"+(su1*su2));
		System.out.println("두수 나누기:"+(su2/su1));//정수형끼리 연산시 결과도 정수형
		
	}

}
