package day0704;

import java.io.FileWriter;
import java.io.IOException;
import java.util.Date;
import java.util.Scanner;

public class FileWriter_05 {
	
	//static method는 별도의 생성없이 사용가능
	public static void fileWriter() {
		FileWriter fw=null;//메소드안의 변수는 초기값 설정이 필수
		String fileName ="C:\\file\\filetest1.txt";//내가 쓴파일을 저장할 장소
		try {
			fw = new FileWriter(fileName);//파일을 새로 생성(같은 이름이 있어도 새로 생성)
			
			//파일에 내용 추가
			fw.write("Have a nice day!!\n");//메모장 줄 넘김
			fw.write(new Date().toString());//날짜를 String으로 형변형
			System.out.println("**********파일 저장 성공************");
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fw.close();//자원 반납
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
	}
	
	public static void fileWrite2() {
		FileWriter fw = null;
		String fileName="C:\\file\\filetest2.txt";
		try {
			fw=new FileWriter(fileName, true);//추가모드
			Scanner sc = new Scanner(System.in);
			System.out.println("내용:");
			fw.write(sc.nextLine()+"\n");//Scanner로 입력한 내용을 파일에 저장
			sc.close();
			fw.write("내 이름은 홍길동\n");
			fw.write("=====================\n");
			
			
		} catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				fw.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public static void main(String[] args) {
		
		fileWriter();
		fileWrite2();
		
	}

}
