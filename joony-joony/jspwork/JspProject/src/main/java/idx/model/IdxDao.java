package idx.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import mysql.db.DBConnect_2;

public class IdxDao {
	
	DBConnect_2 db = new DBConnect_2();
	
	//아이디 통해서 이름 얻기
	public String getName(String id) {
		
		String name="";
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql = "select * from idx where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				name=rs.getString("name");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	}
	
	//아이디에 맞는 pass인지 확인
	public boolean isLogin(String id, String pass) {
		boolean flag=false;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql ="select * from idx where id=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				flag=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		
		return flag;
	}
}
