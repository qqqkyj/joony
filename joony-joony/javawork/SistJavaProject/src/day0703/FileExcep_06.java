package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;

/*
 score.txt를 읽고 총점, 평귵, 개수까지 구해서 출력
 */
public class FileExcep_06 {
		
	public static void scoreRead() {
		String fileName = "C:\\sis0615\\File\\score.txt";
		BufferedReader br=null;
		FileReader fr=null;
		int cnt=0;//총 갯수
		int total=0;//총 합계
		double avg=0;//평균
		
		
		try {
			//파일읽기
			fr= new FileReader(fileName);
			System.out.println("File Open!!");
			
			//버퍼리더에 읽어온 파일을 담음
			br = new BufferedReader(fr);
			
			
			while(true) {
				
				String s = br.readLine();
				//읽어올 데이터가 없으면 종료
				if(s==null) {
					break;
				}
				cnt++;//읽은 개수
				total+=Integer.parseInt(s);//누적해서 더해줌
				System.out.println(s);
			}
			
			System.out.println("===================");
			//평균
			avg=(double)total/cnt;
			System.out.println("총 개수:"+cnt);
			System.out.println("총점:"+total);
			System.out.printf("평균:%.2f\n",avg);
			
			
			
		} catch (FileNotFoundException e) {
			System.out.println("파일을 찾을 수 없습니다.\n"+e.getMessage());
		}catch(IOException e) {
			e.printStackTrace();
		}finally {
			try {
				br.close();
				fr.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	
	public static void main(String[] args) {
		scoreRead();
		System.out.println("****File close!!****");
	}

}
