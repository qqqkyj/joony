package dbtest;

import java.awt.Taskbar.State;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Scanner;

public class CRUDTest {
	
	DBConnect db = new DBConnect();
	
	//insert
	public void insert() {
		Scanner sc = new Scanner(System.in);
		
		System.out.println("이름 입력:");
		String name=sc.nextLine();
		System.out.println("주소 입력:");
		String addr=sc.nextLine();
		
		//query문의 문자열은 ' '
		String sql="insert into myinfo values(seq1.nextval,'"+name+"','"+addr+"',sysdate)";
		
		//1.db연결
		Connection conn = db.getConnection();
		//2.statement
		Statement stmt=null;
		
		try {
			stmt=conn.createStatement();
			stmt.execute(sql);
			
			System.out.println(sql);
			System.out.println("*****정보가 추가되었습니다.*****");
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("insert error:"+e.getMessage());
		}finally {
			db.dbClose(stmt, conn);
		}
		
	}
	
	
	//select
	public void select() {
		
		//1.db연결
		Connection conn = db.getConnection();
		//2.statement
		Statement stmt = null;
		//3.resultset
		ResultSet rs = null;
		
		String sql = "select * from myinfo order by num";
		
		System.out.println("시퀀스\t 이름\t 주소\t\t 날짜");
		System.out.println("--------------------------------------");
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int num=rs.getInt("num");//컬럼명 or 컬럼번호
				String name=rs.getString("name");
				String addr=rs.getString("addr");
				Date date=rs.getDate("sdate");
				
				System.out.println(num+"\t"
									+name+"\t"
									+addr+"\t"
									+date);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("select error:"+e.getMessage());
		}finally {
			db.dbClose(rs, stmt, conn);
		}
				
	}
	
	
	//delete
	public void delete() {
		Scanner sc = new Scanner(System.in);
		System.out.println("삭제할 번호 입력:");
		int num= sc.nextInt();//String num = sc.nextLine()도 가능
		
		//1.db 연결
		Connection conn= db.getConnection();
		//2.statement
		Statement stmt = null;
		
		String sql="delete from myinfo where num="+num;
		
		try {
			stmt=conn.createStatement();
			int a = stmt.executeUpdate(sql);//int로 반환, 성공:1, 실패:0
			
			if(a==0) {
				System.out.println("없는 데이터 번호입니다.");
			}
			else {
				System.out.println("삭제되었습니다.");
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("delete error:"+e.getMessage());
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	
	//update
	public void update() {
		Scanner sc = new Scanner(System.in);
		System.out.println("수정할 시퀀스:");
		int num = Integer.parseInt(sc.nextLine());//String,num 둘 다 가능
		
		//Boolean 메소드인 isData가져와서 실행
		if(!this.isData(num)) {
			System.out.println("해당 번호는 존재하지 않습니다.");
			return ; //메서드 종료
		}
		
		System.out.println("수정할 이름:");
		String name=sc.nextLine();
		System.out.println("수정할 주소:");
		String addr=sc.nextLine();
		
		//1.db 연결
		Connection conn=db.getConnection();
		//2.statement
		Statement stmt = null;
		
		String sql="update myinfo set name='"+name+"',addr='"+addr+"' where num="+num;
		
		try {
			stmt=conn.createStatement();
			stmt.executeUpdate(sql);
			System.out.println("데이터가 수정되었습니다.");
			/*if(a==0) {
				System.out.println("입력한 데이터는 존재하지 않습니다.");
			}else {
				System.out.println("데이터가 수정되었습니다.");
			}*/
		 
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("update error:"+e.getMessage());
		}finally {
			db.dbClose(stmt, conn);
		}
	}
	
	//update할때 없는 번호인지 있는 번호인지 찾아주기
	public boolean isData(int num) {
		//num에 해당하는 데이타가 있으면 true, 없으면 false
		boolean flag=false;
		
		String sql="select * from myinfo where num="+num;//num값에 해당하는 data값을 반환
		
		Connection conn=db.getConnection();
		Statement stmt = null;
		ResultSet rs =null;
		
		try {
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			//1개일 경우는 if문
			if(rs.next()) {
				flag=true;//data가 존재하면 true 반환
			}else {
				flag=false;//존재하지 않으면 false 반환
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("isData error: "+e.getMessage());
		}finally {
			db.dbClose(rs, stmt, conn);
		}
		
		return flag;
	}
	
	
	public static void main(String[] args) {
		
		CRUDTest crud = new CRUDTest();
		
		Scanner sc = new Scanner(System.in);
		int n;
		
		while(true) {
			try {
				System.out.println("***Oralce db 연습_myinfo***");
				System.out.println("1.insert 2.select 3.delete 4.update 9.종료");
				
				n=Integer.parseInt(sc.nextLine());
				
				if(n==1) {
					crud.insert();
				}
				else if(n==2) {
					crud.select();
				}
				else if(n==3) {
					crud.delete();
				}
				else if(n==4) {
					crud.update();
				}
				else if(n==9) {
					System.out.println("종료!!");
					break;
				}
				else {
					System.out.println("숫자를 잘못 입력하였습니다!!!");
				}
				
			} catch (NumberFormatException e) {
				System.out.println("숫자를 입력해 주세요."+e.getMessage());
				System.out.println();
			}

		}
	}

}
