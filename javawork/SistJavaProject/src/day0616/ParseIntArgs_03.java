package day0616;

public class ParseIntArgs_03 {

	public static void main(String[] args) {
		//변수선언->계산->출력 형태로 코드를 작성

		/*[결과출력]
		 * 내이름은 김영환
		 * 자바점수는 88
		 * 오라클점수는 77
		 * 두과목의 합계는 165점 입니다.
		 */
		
		//변수 선언
		String name = args[0];
		int javaScore = Integer.parseInt(args[1]);
		int oracleScore = Integer.parseInt(args[2]);
		
		//계산
		int totalScore = javaScore+oracleScore;
		
		//출력
		System.out.println("[결과출력]"+
							"\n내이름은 "+name+
							"\n자바점수는 "+javaScore+
							"\n오라클점수는 "+oracleScore+
							"\n두과목의 합계는 "+totalScore+"점 입니다." );
	}

}
