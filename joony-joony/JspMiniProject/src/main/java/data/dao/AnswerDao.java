package data.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import data.dto.AnswerDto;
import mysql.db.DBConnect_2;

public class AnswerDao {
	
	DBConnect_2 db = new DBConnect_2();
	
	//insert
	public void insertAnswer(AnswerDto dto) {
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		
		String sql = "insert into answer (num, myid,content,writeday) values(?,?,?,now())";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, dto.getNum());
			pstmt.setString(2, dto.getMyid());
			pstmt.setString(3, dto.getContent());
			
			pstmt.execute();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	//list
	public List<AnswerDto> getAllAnswers(String num){
		List<AnswerDto> list = new ArrayList<>();
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from answer where num=? order by idx";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			pstmt.setString(1, num);
			
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				AnswerDto dto = new AnswerDto();
				dto.setIdx(rs.getString("idx"));
				dto.setNum(rs.getString("num"));
				dto.setMyid(rs.getString("myid"));
				dto.setContent(rs.getString("content"));
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
	
	
	//댓글삭제
		public void deleteAnswer(String idx) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "delete from answer where idx=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, idx);
				
				pstmt.execute();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//댓글 수정
		public void updateAnswer(String idx, String content) {
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			
			String sql = "update answer set content=? where idx=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, content);
				pstmt.setString(2, idx);
				
				pstmt.execute();
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(pstmt, conn);
			}
		}
		
		//댓글 수정시 내용가져오기
		public String getContent(String idx) {
			String content="";
			
			Connection conn = db.getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select content from answer where idx=?";
			
			try {
				pstmt=conn.prepareStatement(sql);
				
				pstmt.setString(1, idx);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					content = rs.getString("content");
				}
				
			} catch (SQLException e) {
				e.printStackTrace();
			}finally {
				db.dbClose(rs, pstmt, conn);
			}
			
			return content;
		}
		

}
