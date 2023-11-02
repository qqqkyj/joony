package Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;

import Dto.MovieBookDto;
import mysql.db.DBConnect_2;

public class MovieBookDao {
	DBConnect_2 db=new DBConnect_2();
	
	//insert
	
	public void insertMovieBook(MovieBookDto dto) {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		String sql="insert into movie_book(bo_no,bo_seat,mv_poster,mv_city,mv_date,";
		
	}
}
