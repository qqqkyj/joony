package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import Dto.MovieDto;
import mysql.db.DBConnect_2;

public class MovieDao {
   
   DBConnect_2 db=new DBConnect_2();
      
      //영화,포스터, 업로드 조회
      public List<MovieDto> getAllMovieInfo(){
         List<MovieDto> list=new ArrayList<MovieDto>();
         
         Connection conn=db.getConnection();
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         
         String sql="select mv_no,mv_title,mv_poster,mv_info from movie_table";
         
         try {
            pstmt=conn.prepareStatement(sql);
            rs=pstmt.executeQuery();
            
            while(rs.next()) {
               MovieDto dto=new MovieDto();
               
               dto.setMv_no(rs.getString(1));
               dto.setMv_title(rs.getString(2));
               dto.setMv_poster(rs.getString(3));
               dto.setMv_info(rs.getString(4));
               
               list.add(dto);
               
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }
         
         return list;
         
      };
      
      
      //mv_no에 해당하는 성인,청소년,아동의 티켓 가격
      public MovieDto getPrice(String no){
          MovieDto dto= new MovieDto();
          
          Connection conn=db.getConnection();
          PreparedStatement pstmt=null;
          ResultSet rs=null;
          
          String sql="select mv_adult,mv_teen,mv_child from movie_table where mv_no=?";
          
          try {
             pstmt=conn.prepareStatement(sql);
             pstmt.setString(1, no);
             rs=pstmt.executeQuery();
             
             if(rs.next()) {
                
                dto.setMv_adult(rs.getInt(1));
                dto.setMv_teen(rs.getInt(2));
                dto.setMv_child(rs.getInt(3));             
                
             }
          } catch (SQLException e) {
             // TODO Auto-generated catch block
             e.printStackTrace();
          }finally {
             db.dbClose(rs, pstmt, conn);
          }
          
          
          return dto;
       };
      
   

     
      //영화, 포스터, 영화 클릭시 info에 불러오기
      public MovieDto getData(String no){
         MovieDto mv_dto= new MovieDto();
         
         Connection conn=db.getConnection();
         PreparedStatement pstmt=null;
         ResultSet rs=null;
         
         String sql="select mv_no,mv_title,mv_poster,mv_info from movie_table where no=?";
         
         try {
            pstmt=conn.prepareStatement(sql);
            pstmt.setString(1, no);
            rs=pstmt.executeQuery();
            
            if(rs.next()) {
               
               mv_dto.setMv_no(rs.getString("mv_no"));
               mv_dto.setMv_title(rs.getString("mv_title"));
               mv_dto.setMv_poster(rs.getString("mv_poster"));
               mv_dto.setMv_info(rs.getString("mv_info"));
               
            }
         } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
         }finally {
            db.dbClose(rs, pstmt, conn);
         }
         
         
         return mv_dto;
      };
      
      
      //영화타이틀로 부터 시퀀스번호 받아오기
      public int getMvNum(String title) {
    	  int num=0;
    	  Connection conn = db.getConnection();
    	  PreparedStatement pstmt = null;
    	  ResultSet rs = null;
    	  
    	  String sql = "select mv_no from movie_table where mv_title=?";
    	  
    	  try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, title);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				num=rs.getInt(1);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
    	  
    	  return num;
      }
      
   };

 