package mysql.db;


import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class DBConnect_2 {

	//driver,url,계정 비밀번호
	static final String MYSQL_URL="jdbc:mysql://semi.cghngf9gqw71.eu-north-1.rds.amazonaws.com:3306/semi?serverTimezone=Asia/Seoul";
	
	//driver
	String driver="com.mysql.cj.jdbc.Driver";
	
	public DBConnect_2() { //My SQL은 driver가 없으면 오류가 나지만 Oracle은 생략 가능
		try {
			Class.forName(driver);
			System.out.println("Mysql 드라이버 성공");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Mysql 드라이버 실패!!!");
		}
	}
	
	//Connection
	public Connection getConnection() {
		
		Connection conn=null;
		try {
			
			conn=DriverManager.getConnection(MYSQL_URL,"admin3jo", "joony1234");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println("Mysql 연결 실패: url,계정,비번 확인 요함!!"+e.getMessage());
		}
		return conn;
	}
	
	//close메서드..총 4개
	public void dbClose(ResultSet rs,Statement stmt,Connection conn){ //완성된 구문
		
		try {
			if(rs!=null)rs.close();
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
	public void dbClose(Statement stmt,Connection conn){
		try {
			if(stmt!=null)stmt.close();
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	public void dbClose(ResultSet rs,PreparedStatement pstmt,Connection conn){ // 미완의 객체를 전달하는 것
		try {
			if(rs!=null)rs.close();
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	
	public void dbClose(PreparedStatement pstmt,Connection conn){
		try {
			if(pstmt!=null)pstmt.close();
			if(conn!=null)conn.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
}
}