package dbtest;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//driver, url, close메소드등
public class DBConnect {
	
	//url
	static final String ORACLE_URL="jdbc:oracle:thin:@localhost:1521:xe";
	
	//driver, 생성자에서 생성
	String driver="oracle.jdbc.driver.OracleDriver";//생략가능
	
	public DBConnect() {//mysql은 driver가 없으면 오류가 나지만 oracle은 생략가능
		try {
			Class.forName(driver);
			System.out.println("오라클 드라이버 성공!!");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("오라클 드라이버 실패!!"+e.getMessage());
		}
	}
	
	//Connection
	public Connection getConnection() {//return값의 Connection
		
		Connection conn=null;
		try {
			conn=DriverManager.getConnection(ORACLE_URL,"joony","a1234");
			System.out.println("디비 연결 성공!!");
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("디비 연결 실패:"+e.getMessage());
		}
		
		return conn;
	}
	
	
	//Close메서드, 총 4개, 자원반납, 오버라이딩
	public void dbClose(ResultSet rs, Statement stmt, Connection conn) {//select문 사용시(완성된 구문)
		try {
			if(rs!=null) rs.close();
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void dbClose(Statement stmt, Connection conn) {
		try {
			if(stmt!=null) stmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		}
	
	public void dbClose(ResultSet rs, PreparedStatement pstmt, Connection conn) {//select문 사용시(미완의 구문)
		try {
			if(rs!=null) rs.close();
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public void dbClose(PreparedStatement pstmt, Connection conn) {
		try {
			if(pstmt!=null) pstmt.close();
			if(conn!=null) conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	
}
