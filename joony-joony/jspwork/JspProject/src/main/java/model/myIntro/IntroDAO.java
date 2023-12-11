package model.myIntro;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.db.DBConnect_2;

public class IntroDAO {
	
	DBConnect_2 db = new DBConnect_2();
	
	//insert
	public void insertIntro(IntroDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql = "insert into intro values(seq_1.nextVal,?,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBlood());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getCity());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//select
	public Vector<IntroDTO> selectIntro(){
		Vector<IntroDTO> list = new Vector<IntroDTO>();
		
		Connection conn= db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		String sql = "select * from intro order by intro_num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				IntroDTO dto = new IntroDTO();
				dto.setNum(rs.getString("intro_num"));
				dto.setName(rs.getString("intro_name"));
				dto.setBlood(rs.getString("intro_blood"));
				dto.setHp(rs.getString("intro_hp"));
				dto.setCity(rs.getString("intro_city"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
				
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
	public void deleteIntro(String num) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from intro where intro_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//update_find
	public IntroDTO getData(String num){
		IntroDTO dto = new IntroDTO();
		Connection conn=db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from intro where intro_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("intro_num"));
				dto.setName(rs.getString("intro_name"));
				dto.setBlood(rs.getString("intro_blood"));
				dto.setHp(rs.getString("intro_hp"));
				dto.setCity(rs.getString("intro_city"));
				dto.setGaipday(rs.getTimestamp("gaipday"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//update
	public void updateIntro(IntroDTO dto) {
		Connection conn =db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="update intro set intro_name=?,intro_blood=?,intro_hp=?,intro_city=? where intro_num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getBlood());
			pstmt.setString(3, dto.getHp());
			pstmt.setString(4, dto.getCity());
			pstmt.setString(5, dto.getNum());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
}
