package day0616;

public class ParseArgs_04 {

	public static void main(String[] args) {
		/*
		 * 변수명: sangName,su,dan,total
		 * 
		 * 1.변수선언
		 * 2.계산
		 * 3.출력
		 * 
		 * [상품정보]
		 * 상품명: 갤럭시폴드
		 * 수량: 5개
		 * 단가: 800000원
		 * 총금액: 4000000원*/
		
		//변수
		String sangName = args[0];
		int su = Integer.parseInt(args[1]);
		int dan = Integer.parseInt(args[2]);
		int total;
		
		//계산
		total = su*dan;
		
		//출력
		System.out.println("[상품정보]"
							+"\n상품명:"+sangName
							+"\n수량: "+su+"개"
							+"\n단가: "+dan+"원"
							+"\n총금액: "+total+"원");
		
		
		
	}

}
