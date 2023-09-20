package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

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
	
	//select_이미 선택된 좌석들을 가져오기
	public List<SeatDto> getSeats(){
		List<SeatDto> list = new ArrayList<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		String sql = "select * from seat_table order by seat_no";
		
		try {
			pstmt= conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				SeatDto dto = new SeatDto();
				
				dto.setSeat_no(rs.getString(1));
				dto.setRev_no(rs.getString(2));
				dto.setAdultCnt(rs.getInt(3));
				dto.setTeenCnt(rs.getInt(4));
				dto.setChildCnt(rs.getInt(5));
				dto.setSeat_name(rs.getString(6));
				dto.setTotalPrice(rs.getInt(7));
				
				list.add(dto);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return list;
	}
	
	//마지막 insert한 seat_no를 반환(결제페이지에 넘겨줘야됨)
	public int maxNum() {
		int max=0;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select max(seat_no) max from seat_table";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				max=rs.getInt("max");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return max;
	}
	
	//seat_no에 해당하는 데이터가져오기
	public SeatDto getData(int seat_no) {
		SeatDto dto = new SeatDto();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from seat_table where seat_no=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setInt(1, seat_no);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setRev_no(rs.getString("rev_no"));
				dto.setSeat_name(rs.getString("seat_name"));
				dto.setAdultCnt(rs.getInt("adultCnt"));
				dto.setTeenCnt(rs.getInt("teenCnt"));
				dto.setChildCnt(rs.getInt("childCnt"));
				dto.setTotalPrice(rs.getInt("totalPrice"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	
	//rev_no에 해당하는 데이터가져오기
		public SeatDto getSeatRev(String rev_no) {
			SeatDto dto = new SeatDto();
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from seat_table where rev_no=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setInt(1, Integer.parseInt(rev_no));
				
				rs=pstmt.executeQuery();
				
				if(rs.next()) {
					dto.setSeat_no(rs.getString("seat_no"));
					dto.setSeat_name(rs.getString("seat_name"));
					dto.setAdultCnt(rs.getInt("adultCnt"));
					dto.setTeenCnt(rs.getInt("teenCnt"));
					dto.setChildCnt(rs.getInt("childCnt"));
					dto.setTotalPrice(rs.getInt("totalPrice"));
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return dto;
		}

}
