package day0704;

import java.text.NumberFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class ExFomat_04 {

	public static void main(String[] args) {
		
		Date date = new Date();
		System.out.println(date);//Format, ex)Tue Jul 04 11:15:01 KST 2023
		
		//날짜 시간을 원하는 양식에 맞게 출력
		//HH: 24시간 MM:월 mm:분
		SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm");
		System.out.println(sdf1.format(date));//ex)2023-07-04 11:15, 가시적으로 보임
		
		//a:오전/오후 hh:12시간
		SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd a hh:mm:ss");
		System.out.println(sdf2.format(date));//ex)2023-07-04 오전 11:16:39
		
		//EEE: 요일짧게 EEEE:요일길게
		SimpleDateFormat sdf3 = new SimpleDateFormat("yyyy-MM-dd HH:mm EEEE");
		System.out.println(sdf3.format(date));//ex)2023-07-04 11:18 화요일
		
		SimpleDateFormat sdf4 = new SimpleDateFormat("yyyy년 MM월 dd일 HH시 mm분");
		System.out.println(sdf4.format(date));//ex)2023년 07월 04일 11시 19분
		
		//숫자,돈, 컴마등등
		int money=123135;
		double num=15256.12323;
		
		NumberFormat nf1 = NumberFormat.getCurrencyInstance();//화폐단위 컴마제공
		System.out.println(nf1.format(money));//₩123,135
		
		NumberFormat nf2 = NumberFormat.getInstance();//컴마제공
		System.out.println(nf2.format(money));//123,135
		System.out.println(nf2.format(num));//15,256.123
		
	
	}

}
