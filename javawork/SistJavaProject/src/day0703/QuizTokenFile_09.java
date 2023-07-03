package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.StringTokenizer;

/*
 ***과일목록***
 상품 수량 단가 총금액
 바나나 10 5000 50000원
 */
public class QuizTokenFile_09 {

	public static void readFruit() {
		String fileName = "C:\\sis0615\\File\\fruit.txt";
		
		FileReader fr = null;
		BufferedReader br = null;
	
		
		try {
			fr = new FileReader(fileName);
			br = new BufferedReader(fr);
			
			System.out.println("****과일목록****");
			System.out.println("상품\t수량\t단가\t총금액");
			System.out.println("-------------------------------");
			
			while(true) {
				try {
					String s = br.readLine();
					
					if(s==null) {
						break;
					}
					
					//분리1
					/*StringTokenizer st = new StringTokenizer(s,",");
					
					String name = st.nextToken();
					int cnt=Integer.parseInt(st.nextToken());
					int price = Integer.parseInt(st.nextToken());
					int total = cnt*price;*/
					
					//분리2
					String[] data = s.split(",");
					
					String name = data[0];
					int cnt = Integer.parseInt(data[1]);
					int price = Integer.parseInt(data[2]);
					int total = cnt*price;
					
					System.out.println(name+"\t"
										+cnt+"개\t"+
										+price+"원\t"+
										+total+"원");
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
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
		readFruit();
		System.out.println("****File close!!****");
	}

}
