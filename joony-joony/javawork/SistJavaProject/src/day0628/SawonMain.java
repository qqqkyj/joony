package day0628;

import java.util.Scanner;

/*
이름 급여 가족수 시간수 : 입력

이름 급여 가족수 초과시간 가족수당 시간수당 총급여 : 최종출력

*/
public class SawonMain {

	public static void getSawon(Sawon[] s) {
		//제목
		Sawon.getTitle();
		
		/*for(int i=0; i<s.length; i++) {
			System.out.println(s[i].getSawonName()+"\t"+s[i].getPay()+"\t"+s[i].getFamSu()+
					"\t"+s[i].getTimeSu()+"\t"+s[i].getFamilySudang()+"\t"+s[i].getTimeSudang()+"\t"+s[i].getTotalPay());
		}*/
	
		for(Sawon s1: s) {
			System.out.println(s1.getSawonName()+"\t"+s1.getPay()+"\t"+s1.getFamSu()+
					"\t"+s1.getTimeSu()+"\t"+s1.getFamilySudang()+"\t"+s1.getTimeSudang()+"\t"+s1.getTotalPay());
		}
	}
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		System.out.println("입력할 직원수:");
		int inwon = Integer.parseInt(sc.nextLine());
		
		//Sawon이라는 클래스형의 배열을 할당, inwon=sawon.length
		Sawon[] sawon = new Sawon[inwon];
		
		//인원수만큼 데이터 입력
		for(int i=0; i<inwon; i++) {
			//sawon을 생성
			sawon[i]=new Sawon();
			System.out.println("사원명:");
			sawon[i].setSawonName(sc.nextLine());
			System.out.println("급여:");
			sawon[i].setPay(Integer.parseInt(sc.nextLine()));
			System.out.println("가족수:");
			sawon[i].setFamSu(Integer.parseInt(sc.nextLine()));
			System.out.println("초과시간:");
			sawon[i].setTimeSu(Integer.parseInt(sc.nextLine()));
			System.out.println("---------------");
		}
		
		//출력
		getSawon(sawon);
		
		
		
	}

}
