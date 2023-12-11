package day0710;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class OracleConnectTest {

	//jdbc url, express버전은 port:1521
	static final String URL="jdbc:oracle:thin:@localhost:1521:xe";
	
	//sawon 디비를 가져올 메소드
	public void connectSawon() {
		
		Connection conn=null;//자바와 데이터베이스를 연결
		Statement stmt=null;//crud전체 sql문을 전달해 줌
		ResultSet rs=null;//글을 select할 때 필요(while문을 이용해서 읽어옴)
		
		String sql="select * from sawon order by name";
		
		try {
			conn=DriverManager.getConnection(URL, "joony", "a1234");
			System.out.println("클라우드 오라클 서버 연결성공!!");
			System.out.println("----------------------------------------");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			while(rs.next()) {//true값 반환, 데이터가 없으면 false값 반환
				//db로부터 데이터 가져오기
				int num = rs.getInt("num");//컬럼명 or 열번호
				String name= rs.getString("name");
				String gender= rs.getString("gender");
				String buseo= rs.getString("buseo");
				int pay=rs.getInt("pay");
				
				System.out.println(num+"\t"+name
										+"\t"+gender
										+"\t"+buseo
										+"\t"+pay);
				
			}
			
			
		} catch (SQLException e) {
			e.printStackTrace();
			System.out.println("오라클 서버 연결실패!!"+e.getMessage());
		}finally {
			try {
				if(rs!=null)rs.close();//api의 사용을 반납(자원을 반납)
				if(stmt!=null)stmt.close();
				if(conn!=null)conn.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		
	}
	
	
	public void connectBamin() {
		//주문번호 주문자 음식명 가격 상호명 가게위치 주문자주소
		Connection conn=null;
		Statement stmt = null;
		ResultSet rs = null;
		
		String sql = "select j.num , j.name , f.foodname , f.price ,f.shopname , f.loc , j.addr "
				+ "from food f, jumun j "
				+ "where f.fno=j.fno order by j.name";
		
		try {
			
			conn=DriverManager.getConnection(URL, "joony", "a1234");
			System.out.println("디비연결 성공!!");
			
			stmt = conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("-----------------------------------------------------");
			System.out.println("주문번호\t주문자명\t음식명\t가격\t상호명\t가게위치\t주문자위치");
			
			while(rs.next()) {
				int num=rs.getInt("num");//주문번호
				String name=rs.getString("name");//주문자명
				String food=rs.getString("foodname");//음식명
				int price=rs.getInt("price");//가격
				String shop=rs.getString("shopname");//상호명
				String loc=rs.getString("loc");//"가게위치"
				String orderLoc=rs.getString("addr");//주문자위치
				
				System.out.println(num+"\t"+
									name+"\t"+
									food+"\t"+
									price+"\t"+
									shop+"\t"+
									loc+"\t"+
									orderLoc+"\t");
			}
			
			
		} catch (SQLException e) {
			System.out.println("디비연결 실패!!"+e.getMessage());
			e.printStackTrace();
		}finally {
				try {
					if(rs!=null) rs.close();
					if(stmt!=null) stmt.close();
					if(conn!=null) conn.close();
					
				} catch (SQLException e) {
					e.printStackTrace();
				}
		}
	}
	
	
	public void connectSawonGroup() {
		
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		
		String sql = "select gender 성별,count(*) 인원수, to_char(avg(pay),'L999,999,999')||'원' 평균급여 from sawon group by gender";
		
		try {
			conn=DriverManager.getConnection(URL, "joony", "a1234");
			System.out.println("디비 연결성공!!");
			
			stmt=conn.createStatement();
			rs=stmt.executeQuery(sql);
			
			System.out.println("**성별 인원및 평균급여**");
			System.out.println("성별\t인원수\t\t평균급여");
			System.out.println("-------------------------------------");
			
			while(rs.next()) {
				
				String gender=rs.getString("성별");
				int cnt = rs.getInt("인원수");
				String avgpay = rs.getString("평균급여");
				
				System.out.println(gender+"\t"+cnt+"\t"+avgpay);
				
			}
			
			
		} catch (SQLException e) {
			System.out.println("디비 연결실패!!"+e.getMessage());
			e.printStackTrace();
		}finally {
			try {
				if(rs!=null) rs.close();
				if(stmt!=null) stmt.close();
				if(conn!=null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	
	
	public static void main(String[] args) {
		
		OracleConnectTest oc = new OracleConnectTest();
		//oc.connectSawon();
		//oc.connectBamin();
		oc.connectSawonGroup();
	}

}
