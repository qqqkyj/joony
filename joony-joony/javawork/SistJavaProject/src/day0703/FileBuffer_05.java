package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

public class FileBuffer_05 {
	
	public static void read() {
		String FileName ="C:\\sis0615\\File\\test.txt";
		BufferedReader br = null;//변수를 다시 사용할 수 있기에 생성 후 사용하는 것이 좋음
		FileReader fr = null;
		
		try {
		
			fr = new FileReader(FileName);
			br = new BufferedReader(fr);
			//BufferedReader br = new BufferedReader(new FileReader(FileName));
			System.out.println("File Open!!");
			
			while(true){
				String s = br.readLine();
				
				if(s==null) {
					break;
				}
				
				System.out.println(s);
			}
			
			
		} catch (FileNotFoundException e) {
			System.out.println("파일이 없습니다.\n"+e.getMessage());
		}catch (IOException e) {
			e.printStackTrace();
		}finally {
			try {
				br.close();
				fr.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

	public static void main(String[] args) {
		read();
		System.out.println("*****메모 정상종료******");
	}

}
