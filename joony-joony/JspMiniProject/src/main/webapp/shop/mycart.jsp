<%@page import="data.dao.MemberDao"%>
<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.List"%>
<%@page import="data.dao.ShopDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR:wght@300&family=Noto+Serif+KR&display=swap" rel="stylesheet">  
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"></script>
 <style type="text/css">
 	div.sangpum{
 		cursor: pointer;
 	}
 	
 	div img{
 		width: 120px;
 		height: 120px;
 		border-radius: 5px;
 	}
 </style>
</head>
<%
	//로그인id
	String id = (String)session.getAttribute("myid");
	ShopDao dao = new ShopDao();
	//장바구니 목록
	List<HashMap<String, String>> list = dao.getCartList(id);
	
	MemberDao mdao = new MemberDao();
	String name = mdao.getName(id);
%>
<body>
	<h4 class="alert alert-warning" style="width: 1000px;"><%=name %>님의 장바구니 목록</h4>
	<table class="table table-striped" style="width: 1000px;">
		<tr>
			<th style="width: 30px;"><input type="checkbox" id="allcheck"></th>
			<th style="width: 200px;">상품정보</th>
			<th style="width: 200px;">상품명</th>
			<th style="width: 200px;">상품개수</th>
			<th style="width: 200px;">상품금액</th>
			<th style="width: 200px;">총금액</th>
			<th style="width: 200px;">날짜</th>
		</tr>
		
		<%	int allmoney=0;
			NumberFormat nf = NumberFormat.getCurrencyInstance();
			for(int i=0; i<list.size(); i++){
				HashMap<String, String> map = list.get(i);
				
				//사진
				String photo = map.get("photo");
				%>
				<tr>
					<td>
						<input type="checkbox" idx="<%=map.get("idx")%>" class="idx"><br><br><br>
						<i class="bi bi-trash3 delcheck" idx="<%=map.get("idx")%>" style="cursor: pointer; font-size: 1.1em;"></i>
					</td>
					<td>
						<div class="sangpum" shopnum="<%=map.get("shopnum")%>">
							<img src="shopsave/<%=photo%>">
						</div>
					</td>
					<td><%=map.get("sangpum") %></td>
					<td><%=map.get("cnt") %>개</td>
					<td>
						<%	
							int price =Integer.parseInt(map.get("price"));
							int cnt=Integer.parseInt(map.get("cnt"));
							int total = price*cnt;
							allmoney+=total;
						%>
						<%=nf.format(price)%>
					</td>
					<td><%=nf.format(total) %></td>
					<td><%=map.get("cartday") %></td>
				</tr>
				<%
			}
		%>
		<tr>
			<td colspan="6" align="right">
				총 주문금액: <b><%=nf.format(allmoney) %></b>&nbsp;&nbsp;&nbsp;
				<input type="button" value="구매" class="btn btn-outline-success" style="width: 100px;">&nbsp;
				<input type="button" value="전체삭제" class="btn btn-outline-danger" id="btncartdel" style="width: 100px;">
			</td>
		</tr>
	</table>
	
<script type="text/javascript">
		//전체선택시 체크박스 선택해제
		$("#allcheck").click(function(){
			var chk = $(this).is(":checked");
			console.log(chk);
			
			//전체 체크값을 글앞의 체크에 일괄전달
			$(".idx").prop("checked",chk);
		});
		
		//상품클릭시 디테일로
		$("div.sangpum").click(function(){
			var shopnum = $(this).attr("shopnum");
			location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
		});
		
		//개별삭제
		$("i.delcheck").click(function() {
			var idx = $(this).parent().find(".idx").attr("idx");
			
			var a = confirm("정말 삭제하시겠습니까?");
			if(a){
				//삭제파일로 전송
				location.href="shop/cartdelete.jsp?idxs="+idx;
			}
			
		});
		
		//체크한 상품모두 삭제
		$("#btncartdel").click(function(){
			//체크한 개수
			var cnt =$(".idx:checked").length;
			//alert(cnt);
			if(cnt==0){
				alert("삭제할 상품을 먼저 선택해 주세요.");
			}else{
				var a = confirm(cnt+"개의 글을 삭제하려면 [확인]을 눌러주세요.");
				
				if(a){
					
					//체크된 곳의 value값 얻기(num)
					var n="";
					$(".idx:checked").each(function(idx){
						n+=$(this).attr("idx")+",";
					});
					
					//마지막 ,(컴마) 제거
					n=n.substring(0,n.length-1);
					
					console.log(n);
					
					//삭제파일로 전송
					location.href="shop/cartdelete.jsp?idxs="+n;
				}
			}
 		
 		});
		
</script>
	
</body>
</html>