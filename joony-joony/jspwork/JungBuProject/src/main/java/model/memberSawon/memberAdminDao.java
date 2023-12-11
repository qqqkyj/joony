package model.memberSawon;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.db.DBConnect_2;

public class memberAdminDao{
	
	DBConnect_2 db = new DBConnect_2();
	
	//로그인 아이디, 패스워드체크
	public boolean loginCheck(String id, String pass) {
		boolean flag = false;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql="select * from member_sawon where id=? and pass=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			pstmt.setString(2, pass);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				flag=true;
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(null, pstmt, conn);
		}
		
		return flag;
	}
	
	//select
	public Vector<memberAdminDto> selectMember(){
		Vector<memberAdminDto> list = new Vector<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member_sawon order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				memberAdminDto dto = new memberAdminDto();
				dto.setNum(rs.getString("num"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setName(rs.getString("name"));
				dto.setPosition(rs.getString("position"));
				dto.setDepartment(rs.getString("department"));
				dto.setAddr(rs.getString("addr"));
				dto.setHp(rs.getString("hp"));
				dto.setHiredate(rs.getTimestamp("hiredate"));
				dto.setFiredate(rs.getTimestamp("firedate"));
				
				list.add(dto);
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return list;
	}
	
	//getdata
	public memberAdminDto getDate(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from member_sawon where num=?";
		
		memberAdminDto dto = new memberAdminDto();
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setId(rs.getString("id"));
				dto.setPass(rs.getString("pass"));
				dto.setDepartment(rs.getString("department"));
				dto.setPosition(rs.getString("position"));
				dto.setHp(rs.getString("hp"));
				dto.setAddr(rs.getString("addr"));
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//update
	public void updateMember(memberAdminDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "update member_sawon set name=?, pass=?, position=?, department=?, addr=?, hp=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getPass());
			pstmt.setString(3, dto.getPosition());
			pstmt.setString(4, dto.getDepartment());
			pstmt.setString(5, dto.getAddr());
			pstmt.setString(6, dto.getHp());
			pstmt.setString(7, dto.getNum());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//delete
	public void deleteMember(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql ="delete from member_sawon where num=?";
		
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
	
	//getName
	public String getName(String id) {
		String name=null;
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select name from member_sawon where id=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, id);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				name=rs.getString("name");
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return name;
	}

}
