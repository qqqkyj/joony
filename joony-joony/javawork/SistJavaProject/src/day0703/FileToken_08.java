package day0703;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.nio.file.attribute.AclEntry;
import java.util.StringTokenizer;

public class FileToken_08 {
	
	public static void movieRead() {
		String fileName="C:\\sis0615\\File\\movie.txt";
		FileReader fr=null;
		BufferedReader br=null;
		
		try {
			fr=new FileReader(fileName);
			br = new BufferedReader(fr);
			
			System.out.println("****과일목록****");
			System.out.println("제목\t이름\t나이");
			System.out.println("-------------------------------");
			
			while(true) {
				try {
					String s = br.readLine();
					
					if(s==null) {
						break;
					}
					
					//split
					String[] data = s.split(",");
					
					System.out.println(data[0]+"\t"+data[1]+"\t"+data[2]+"\t");
					
					//Tokenizer
					StringTokenizer st = new StringTokenizer(s,",");
					
					System.out.println(st.nextToken()+"\t"
							+st.nextToken()+"\t"
							+st.nextToken());
					
					
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch(IOException e) {
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

		movieRead();
		System.out.println("****File close!!****");
	}

}
