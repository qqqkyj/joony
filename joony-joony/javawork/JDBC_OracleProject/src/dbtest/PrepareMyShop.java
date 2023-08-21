package dbtest;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;
import java.util.Scanner;

public class PrepareMyShop {
	
	DBConnect db = new DBConnect();
	Scanner sc = new Scanner(System.in);
	
	//insert
	public void insertMyshop() {
		//1.db connection
		Connection conn=db.getConnection();
		//preparedStatement
		PreparedStatement pstmt=null;
		
		System.out.println("상품명:");
		String sang=sc.nextLine();
		System.out.println("수량:");
		int su=Integer.parseInt(sc.nextLine());
		System.out.println("가격:");
		int dan = Integer.parseInt(sc.nextLine());
		
		//sql..preparedStatement는 미완의 sql문을 작성
		String sql = "insert into myshop values(seq1.nextval,?,?,?,sysdate)";
		
		try {
			pstmt=conn.prepareStatement(sql);
			
			//?를 순서대로 바인딩
			pstmt.setString(1, sang);//parameter index, 해당값
			pstmt.setInt(2, su);
			pstmt.setInt(3, dan);
			
			//업데이트
			int num = pstmt.executeUpdate();
			if(num==1) {
				System.out.println("insert 성공!!");
			}else {
				System.out.println("insert 실패!!");
			}
			
		} catch (SQLException e) {
			System.out.println("insertMyshop error:"+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	//select
	public void selectMyshop() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		String sql="select * from myshop order by shopnum";
		
		System.out.println("상품번호\t 상품이름\t 수량\t 가격\t 입고일자");
		
		try {
			pstmt=conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("shopnum");
				String sang = rs.getString("sangpum");
				int su=rs.getInt("su");
				int dan=rs.getInt("price");
				Date date = rs.getDate("ipgo");
				
				System.out.println(num+"\t"
									+sang+"\t"
									+su+"\t"
									+dan+"\t"
									+date);
			}
			
		} catch (SQLException e) {
			System.out.println("select error: "+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		
	}
	
	
	//isData_boolean(수정할 시퀀스의 존재여부 확인 메소드)
	public boolean isData(int num) {
		boolean flag=false;
		String sql="select * from myshop where shopnum=?";
		
		Connection conn = db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		try {
			pstmt=conn.prepareStatement(sql);
			//?바인딩
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {//해당 데이터가 존재하면 true
				return flag=true;
			}
			else {//존재하지 않으면 false
				return flag=false;
			}
			
		} catch (SQLException e) {
			System.out.println("isData error:"+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
		return flag;
	}
	
	
	//delete
	public void deleteMyshop() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("삭제할 상품번호 입력:");
		int num=Integer.parseInt(sc.nextLine());
		
		//해당 상품이 없다면 메서드 종료
		if(!this.isData(num)) {
			System.out.println("해당 상품은 존재하지 않습니다.");
			return;//메서드 종료
		}
		
		String sql="delete from myshop where shopnum="+num;
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.executeQuery();
			System.out.println(num+"번 상품이 삭제되었습니다.");
			
		} catch (SQLException e) {
			System.out.println("deleteMyshop error:"+e.getMessage() );
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
	}
	
	
	//update
	public void updateMyshop() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		
		System.out.println("수정할 상품의 번호를 입력:");
		int num=Integer.parseInt(sc.nextLine());
		
		//해당 상품이 없다면 메서드 종료
		if(!this.isData(num)) {
			System.out.println("해당 상품은 존재하지 않습니다.");
			return;// 메서드 종료
		}
		
		System.out.println("수정할 상품이름:");
		String sang = sc.nextLine();
		System.out.println("수정할 상품수량:");
		int su = Integer.parseInt(sc.nextLine());
		System.out.println("수정할 상품가격:");
		int dan=Integer.parseInt(sc.nextLine());
		
		String sql="update myshop set sangpum=?, su=?, price=? where shopnum=?";
		
		try {
			pstmt=conn.prepareStatement(sql);
			//?바인딩
			pstmt.setString(1, sang);
			pstmt.setInt(2, su);
			pstmt.setInt(3, dan);
			pstmt.setInt(4, num);
			
			int a=pstmt.executeUpdate();
			
			if(a==0) {
				System.out.println("수정에 실패하였습니다.");
			}else {
				System.out.println("수정에 성공하였습니다.");
			}
			
		} catch (SQLException e) {
			System.out.println("updateMyshop error: "+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(pstmt, conn);
		}
		
	}
	
	
	//search
	public void searchSangpum() {
		Connection conn=db.getConnection();
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		System.out.println("검색할 상품명:");
		String sang= sc.nextLine();
		
		String sql="select * from myshop where sangpum like ?";
		
		System.out.println("상품번호\t 상품이름\t 수량\t 가격\t 입고일자");
		
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, "%"+sang+"%");
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("shopnum");
				String sangpum = rs.getString("sangpum");
				int su=rs.getInt("su");
				int dan=rs.getInt("price");
				Date date = rs.getDate("ipgo");
				
				System.out.println(num+"\t"
									+sangpum+"\t"
									+su+"\t"
									+dan+"\t"
									+date);
			}
			
		} catch (SQLException e) {
			System.out.println("searchSangpum error:"+e.getMessage());
			e.printStackTrace();
		}finally {
			db.dbClose(rs, pstmt, conn);
		}
	}
	

	public static void main(String[] args) {
		
		PrepareMyShop shop = new PrepareMyShop();
		Scanner sc= new Scanner(System.in);
		int n;
		
		while(true) {
			
			try {
				
				System.out.println("**************************상품입고**************************");
				System.out.println("1.상품추가 2.상품삭제 3.상품수정 4.상품전체출력 5.검색 9.종료");
				n=Integer.parseInt(sc.nextLine());
				
				if(n==1) {
					shop.insertMyshop();
				}
				else if(n==2) {
					shop.deleteMyshop();
				}
				else if(n==3) {
					shop.updateMyshop();
				}
				else if(n==4) {
					shop.selectMyshop();
				}
				else if(n==5) {
					shop.searchSangpum();
				}
				else if(n==9) {
					System.out.println("종료!!");
					break;
				}
				else {
					System.out.println("번호를 잘못 입력하였습니다.");
				}
				
			} 
			
			catch (NumberFormatException e) {
				System.out.println("숫자를 입력해 주세요."+e.getMessage());
			}
			
		}
	}

}
