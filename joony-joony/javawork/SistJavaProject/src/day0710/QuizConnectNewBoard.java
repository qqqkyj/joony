package day0710;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

public class QuizConnectNewBoard {

		//jdbc url, express버전은 port:1521
		static final String URL="jdbc:oracle:thin:@localhost:1521:xe";
				
	public void connecBoard() {
		
		Connection conn=null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select * from snsboard";
		
		try {
			conn=DriverManager.getConnection(URL, "joony", "a1234");
			System.out.println("디비연결 성공!!");
			
			System.out.println("번호\t 작성자\t 제목\t 내용\t\t 작성날짜");
			System.out.println("-----------------------------------------------------");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {
				int num = rs.getInt("b_num");
				String name = rs.getString("nick");
				String subject = rs.getString("subject");
				String content = rs.getString("content");
				Date date=rs.getDate("wday");
				
				System.out.println(num+"\t"
									+name+"\t"
									+subject+"\t"
									+content+"\t"
									+date);
			}
			
		} catch (SQLException e) {
			System.out.println("디비연결 실패!!"+e.getMessage());
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args) {
		QuizConnectNewBoard board = new QuizConnectNewBoard();
		board.connecBoard();
	}

}
