package day0620;

public class subString {

	public static void main(String[] args) {
		
		String str="나는 쌍용에서 자바를 공부중입니다.";
		
		char ch=str.charAt(3);
		String word1 = str.substring(8);
		String word2 = str.substring(8,10);//end->추출하려는 자리에 +1
		int i = str.length();//공백포함 글자 수 
		
		System.out.println(ch);
		System.out.println(word1);
		System.out.println(word2);
		System.out.println(i);
		
	}

}
