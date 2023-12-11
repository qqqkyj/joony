package day0629;

import java.util.Scanner;

public class SungjukMain {

	public static void getSungjuk(Sungjuk s) {
		System.out.println(s.getName()+
				"\t"+s.getJava()+
				"\t"+s.getOracle()+
				"\t"+s.getTotal()+
				"\t"+s.getAvg()+
				"\t"+s.getPyungga());
	}
	
	public static void main(String[] args) {
		
		Scanner sc = new Scanner(System.in);
		int inwon;		
		Sungjuk[] sj;
		String schoolName;
		
		System.out.println("입력할 인원수:");//배열할당
		inwon = Integer.parseInt(sc.nextLine());
		
		System.out.println("학교명:");
		schoolName = sc.nextLine();
		
		Sungjuk.setSchoolName(schoolName);
		
		//인원수만큼 배열 할당
		sj = new Sungjuk[inwon];
		
		//인원수 입력
		for(int i=0; i<inwon; i++) {
			System.out.println((i+1)+"번 학생이름:");
			String name = sc.nextLine();
			
			System.out.println("자바와 오라클 점수 입력:");
			int java = Integer.parseInt(sc.nextLine());
			int oracle= Integer.parseInt(sc.nextLine());
			
			//i번째 학생성적 생성
			sj[i] = new Sungjuk();
			
			//set
			sj[i].setName(name);
			sj[i].setJava(java);
			sj[i].setOracle(oracle);
		}
		
		//결과출력
		System.out.println("****결과출력****");
		System.out.println("학교명:"+Sungjuk.getSchoolName());
		
		System.out.println("학생명\tJava\tOracle\t총점\t평균\t평가(평균 60점이상 합격)");
		
		for(Sungjuk s1: sj) {
			getSungjuk(s1);
		}
		/*for(int i=0; i<inwon; i++) {
			getSungjuk(sj[i]);
		}*/
		
		
		
	}

}
