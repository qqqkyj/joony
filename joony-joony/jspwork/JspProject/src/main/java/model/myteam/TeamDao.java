package model.myteam;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Vector;

import oracle.db.DBConnect_2;

public class TeamDao {

	DBConnect_2 db = new DBConnect_2();
	
	//insert
	public void insertMyTeam(TeamDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt= null;
		
		String sql = "insert into myteam values(seq_1.nextVal,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDriver());
			pstmt.setString(3, dto.getAddr());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//select
	public ArrayList<TeamDto> getAllMyTeams() {
		ArrayList<TeamDto> list = new ArrayList<TeamDto>();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs=null;
		
		String sql = "select * from myteam order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				TeamDto dto = new TeamDto();
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("tname"));
				dto.setDriver(rs.getString("driver"));
				dto.setAddr(rs.getString("taddr"));
				dto.setWriteday(rs.getTimestamp("writeday"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//delete
	public void deleteMyTeam(String num) {
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql = "delete from myteam where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//update_find
	public TeamDto getData(String num) {
		TeamDto dto = new TeamDto();
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from myteam where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("tname"));
				dto.setDriver(rs.getString("driver"));
				dto.setAddr(rs.getString("taddr"));
				dto.setWriteday(rs.getTimestamp("writeday"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//update
	public void updateTeam(TeamDto dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql = "update myteam set tname=?, driver=?, taddr=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getDriver());
			pstmt.setString(3, dto.getAddr());
			pstmt.setString(4, dto.getNum());
			
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
}
