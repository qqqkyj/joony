package day0616;

public class OperTest_07 {

	public static void main(String[] args) {
		//기본자료형_8개
		//1.논리형_true,false
		boolean b = false;
		
		//2.문자형
		//반드시 하나의 문자 16비트 유니코드값 표현
		//자바에서 char 문자하나 2byte
		//기본적으로는 정수형, 아스키코드로 변환하면 알 수 있음
		char ch = 'A';//" "(X),' '(O)
		
		//3.정수형
		byte a = -128;//8bit = 1byte -128~127까지 가능
		short s=32000;//16bit
		int c = 6700000;//32bit
		long num = 100L;//64bit, 뒤에 L,l을 붙여야 long
		
		//4.실수형
		double d = 156.486513;//64bit, 소수점
		float f = 3.618565322f;//32bit(1byte=8bit)
		
		//int.float는 똑같이 32bit 사용하지만 기본적으로 실수형이 정수형보다 큰타입으로 처리된다.
		
		//출력
		System.out.println("bool="+b);
		System.out.println("not bool="+!b);
		System.out.println("ch="+ch);//A
		System.out.println("ch="+(ch+1));//65(A)+1=66(B)
		System.out.println("ch="+(char)(ch+1));//B
		System.out.println("d="+d);//정밀도 15자리
		System.out.println("f="+f);//정밀도 8자리
		
		//printf %f:실수
		//전체자리수 10자리 소수점2
		System.out.printf("d=%10.2f\n",d);
		
		//소수점1자리
		System.out.printf("d=%.1f",d);
		
	}

}
