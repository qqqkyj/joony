package model.sinsang;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;

import oracle.db.DBConnect_2;

public class SinsangDAO {
	
	DBConnect_2 db = new DBConnect_2();
	
	//insert
	public void insertSinsang(SinsangDTO dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into sinsang values(seq_1.nextval,?,?,sysdate) ";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//?
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			
			//query실행
			pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	//select
	//Vector, ArrayList는 가변적 but list는 인스턴스 이므로 생성은 안됨
	public Vector<SinsangDTO> getAllDatas(){
		Vector<SinsangDTO> list = new Vector<SinsangDTO>();
		
		Connection conn=db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from sinsang order by num";
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			//여러개의 데이터를 얻을 경우
			while(rs.next()) {
				//dto선언.. 반드시 while안에서
				SinsangDTO dto = new SinsangDTO();
				
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));
				
				//벡터에 추가
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
	public void deleteSinsang(String num) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="delete from sinsang where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//?
			pstmt.setString(1, num);
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//하나의 데이터 조회
	public SinsangDTO getData(String num) {
		
		SinsangDTO dto = new SinsangDTO();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from sinsang where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, num);
			rs=pstmt.executeQuery();
			
			//하나의 데이터 조회시 if
			if(rs.next())
			{
				dto.setNum(rs.getString("num"));
				dto.setName(rs.getString("name"));
				dto.setAddr(rs.getString("addr"));
				dto.setSdate(rs.getTimestamp("sdate"));
				
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
		return dto;
	}
	
	//수정.. 이름 주소 수정
	public void updateSinsang(SinsangDTO dto) {
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql ="update sinsang set name=?, addr=? where num=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//?
			pstmt.setString(1, dto.getName());
			pstmt.setString(2, dto.getAddr());
			pstmt.setString(3, dto.getNum());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
				
	}

}
