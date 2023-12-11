package Quiz_0711;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;
import java.util.Scanner;

public class MyStudentCRUD {

	DBConnect db = new DBConnect();
	Scanner sc = new Scanner(System.in);
	
	//insert
	public void stuInsert() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("학생명:");
		String name=sc.nextLine();
		System.out.println("학년:");
		int grade=Integer.parseInt(sc.nextLine());
		System.out.println("핸드폰 번호:");
		String hp=sc.nextLine();
		System.out.println("주소:");
		String addr=sc.nextLine();
		System.out.println("나이:");
		int age=Integer.parseInt(sc.nextLine());
		
		String sql="insert into mystudent values(seq_stu.nextval,?,?,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setInt(2, grade);
			pstmt.setString(3, hp);
			pstmt.setString(4, addr);
			pstmt.setInt(5, age);
			
			pstmt.executeUpdate();
			System.out.println();
			System.out.println("학생정보가 추가되었습니다.");
			System.out.println();
			
			
		} catch (SQLException e) {
			System.out.println("stuInsert error: "+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	//select
	public void stuSelect() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from mystudent order by stu_num";
		
		System.out.println("번호\t이름\t학년\t핸드폰번호\t주소\t나이\t등록일");
		System.out.println("---------------------------------------------");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
			
				int num=rs.getInt("stu_num");
				String name=rs.getString("stu_name");
				int grade=rs.getInt("stu_grade");
				String hp=rs.getString("hp");
				String addr=rs.getString("addr");
				int age=rs.getInt("age");
				Date date=rs.getDate("sdate");
				
				System.out.println(num+"\t"
									+name+"\t"
									+grade+"\t"
									+hp+"\t"
									+addr+"\t"
									+age+"\t"
									+date);
				
			}
			
			System.out.println();
			System.out.println("학생정보가 조회되었습니다.");
			System.out.println();
		
			
		} catch (SQLException e) {
			System.out.println("stuSelect error: "+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	
	//isData:해당 정보가 존재하는지 여부를 조회하는 메서드
	public boolean isData(int num) {
		boolean flag=false;
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from mystudent where stu_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				flag=true;//해당 데이터값이 존재하면 true
			}else {
				flag=false;//없으면 false
			}
			
		} catch (SQLException e) {
			System.out.println("isData error:"+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}
	
	
	//delete
	public void stuDelete() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("삭제할 학생의 번호:");
		int num=Integer.parseInt(sc.nextLine());
		
		if(!this.isData(num)) {//해당 번호의 학생정보가 존재하지 않는다면
			System.out.println("존재하는 학생이 아닙니다.");
			return; //메서드 종료
		}
		
		String sql="delete from mystudent where stu_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			pstmt.execute();
			
			System.out.println();
			System.out.println("정보가 삭제되었습니다.");
			System.out.println();
			
			
		} catch (SQLException e) {
			System.out.println("delete error: "+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	//update
	public void stuUpdate() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("수정할 학생의 번호입력:");
		int num=Integer.parseInt(sc.nextLine());
		
		if(!this.isData(num)) {//해당 데이터가 존재하지 않는다면
			System.out.println("존재하는 학생이 아닙니다.");
			return;//메서드 종료
		}
		
		System.out.println("수정할 학생명:");
		String name=sc.nextLine();
		System.out.println("수정할 학년:");
		int grade=Integer.parseInt(sc.nextLine());
		System.out.println("수정할 핸드폰 번호:");
		String hp=sc.nextLine();
		System.out.println("수정할 주소:");
		String addr=sc.nextLine();
		System.out.println("수정할 나이:");
		int age=Integer.parseInt(sc.nextLine());
		
		String sql="update mystudent set stu_name=?, stu_grade=?, hp=?, addr=?, age=? where stu_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, name);
			pstmt.setInt(2, grade);
			pstmt.setString(3, hp);
			pstmt.setString(4, addr);
			pstmt.setInt(5, age);
			pstmt.setInt(6, num);
			
			pstmt.executeUpdate();
			
			System.out.println();
			System.out.println("학생정보가 수정되었습니다.");
			System.out.println();
			
			
		} catch (SQLException e) {
			System.out.println("stuUpdate error: "+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
	//search
	public void stuSearch() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.println("검색할 이름:");
		String search=sc.nextLine();
		
		String sql="select * from mystudent where stu_name like ?";
		
		System.out.println("번호\t이름\t학년\t핸드폰번호\t주소\t나이\t등록일");
		System.out.println("---------------------------------------------");
		
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, "%"+search+"%");
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				
				int num=rs.getInt("stu_num");
				String name=rs.getString("stu_name");
				int grade=rs.getInt("stu_grade");
				String hp=rs.getString("hp");
				String addr=rs.getString("addr");
				int age=rs.getInt("age");
				Date date=rs.getDate("sdate");
				
				System.out.println(num+"\t"
									+name+"\t"
									+grade+"\t"
									+hp+"\t"
									+addr+"\t"
									+age+"\t"
									+date);
				
			}
			
			System.out.println();
			System.out.println("학생정보가 검색되었습니다.");
			System.out.println();
			
			
		} catch (SQLException e) {
			System.out.println("stuSearch error: "+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	
	
	public static void main(String[] args) {
		MyStudentCRUD stu = new MyStudentCRUD();
		Scanner sc = new Scanner(System.in);
		
		while(true) {
			
			System.out.println("**********************학생정보**********************");
			System.out.println("1.입력 2.출력 3.삭제 4.수정 5.검색 9.종료");
			System.out.println("================================================");
			
			int n = sc.nextInt();
			
			if(n==1) {
				stu.stuInsert();
			}
			else if(n==2) {
				stu.stuSelect();
			}
			else if(n==3) {
				stu.stuDelete();
			}
			else if(n==4) {
				stu.stuUpdate();
			}
			else if(n==5) {
				stu.stuSearch();
				
			}
			else if(n==9) {
				System.out.println("종료!!");
				break;
			}
			else {
				System.out.println("숫자를 잘못 입력하였습니다.");
			}
			
			System.out.println();
			
		}
		
		
	}

}
