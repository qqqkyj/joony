package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import Dto.SeatDto;
import mysql.db.DBConnect_2;

public class SeatDao {
	
	DBConnect_2 db = new DBConnect_2();
	
	//insert 
	public void insertSeat(SeatDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into seat_table values(null,?,?,?,?,?,?)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getRev_no());
			pstmt.setInt(2, dto.getAdultCnt());
			pstmt.setInt(3, dto.getTeenCnt());
			pstmt.setInt(4, dto.getChildCnt());
			pstmt.setString(5, dto.getSeat_name());
			pstmt.setInt(6, dto.getTotalPrice());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}

}
