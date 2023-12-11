<%@page import="java.text.NumberFormat"%>
<%@page import="java.util.List"%>
<%@page import="data.dto.ShopDto"%>
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
img.photo{
	width: 230px;
	height: 270px;
	border: 0px solid gray;
	border-radius: 5px;
	margin-bottom: 10px;
}

tr{
	padding: 10px;
}
</style>
<script type="text/javascript">
$(function() {
		
		//이미지 누르면 shopnum 띄우기
		$("a.godetail").click(function(){
			var shopnum=$(this).attr("shopnum");
			//alert(shopnum);
			location.href="index.jsp?main=shop/detailpage.jsp?shopnum="+shopnum;
		});
		
});
</script>
</head>
<%
	ShopDao dao = new ShopDao();
	List<ShopDto> list = dao.getAllSangpums();
%>
<body>
	<div class="container mt-3">
	  <h2>상품목록</h2>
	  <br>
	  <!-- Nav tabs -->
	  <ul class="nav nav-tabs" role="tablist">
	    <li class="nav-item">
	      <a class="nav-link active" data-bs-toggle="tab" href="#tabs-1">전체</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-bs-toggle="tab" href="#tabs-2">아우터</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-bs-toggle="tab" href="#tabs-3">상의</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-bs-toggle="tab" href="tabs-4">하의</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-bs-toggle="tab" href="#tabs-5">악세서리</a>
	    </li>
	    <li class="nav-item">
	      <a class="nav-link" data-bs-toggle="tab" href="#tabs-6">신발</a>
	    </li>
	  </ul>
	
	  <!-- Tab panes -->
	  <div class="tab-content">
	    <div id="tabs-1" class="container tab-pane active"><br>
	      <p>
	      	<table class="table tale-bordered" style="width: 700px;">
	      		<caption align="top"><b>전체상품목록</b></caption>
	      		<tr>
	      			<%
	      				NumberFormat nf = NumberFormat.getCurrencyInstance();
	      				for(int i=0; i<list.size(); i++){
	      					ShopDto dto = list.get(i);
	      					String photo = dto.getPhoto();
	      					
	      					//20~50%까지 랜덤 할인
	      					int sale = (int)(Math.random()*31)+20;
	      				%>
	      				<td>
	      				<div style="width: 230px;">
	      					<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer; text-decoration: none; color: black" class="godetail"  >
	      					<img alt="" src="shopsave/<%=photo%>" class="photo"><br>
	      					<%=dto.getSangpum() %><br>
	      					<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
	      					<span style="float: right;">
	      						<div style="color: gray; font-size: 13px;">
	      							<%
	      								int price = (int)(dto.getPrice()*((100-sale)/100.0));
	      							%>
	      							<strike><%=nf.format(dto.getPrice()) %></strike>
	      						</div>
	      						<div style="color: black; font-size: 16px;">
	      							<%=nf.format(price) %>
	      						</div>
	      					</span>
	      					</a>
	      					</div>
	      				</td>
	      				<%
	      						if((i+1)%3==0){
	      							%>
	      							</tr>
	      							<tr>
	      							<%
	      						}
	      				}
	      			%>
	      		</tr>
	      	</table>
	      </p>
	    </div>
	    
	    <div id="tabs-2" class="container tab-pane"><br>
	      <p>
	      	<table class="table tale-bordered" style="width: 700px;">
	      		<caption align="top"><b>전체상품목록</b></caption>
	      		<tr>
	      			<%
	      				for(int i=0; i<list.size(); i++){
	      					ShopDto dto = list.get(i);
	      					
	      					if(dto.getCategory().equals("아우터")){
	      					String photo = dto.getPhoto();
	      					
	      					//20~50%까지 랜덤 할인
	      					int sale = (int)(Math.random()*31)+20;
	      				%>
	      				<td>
	      				<div style="width: 230px;">
	      					<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer; text-decoration: none; color: black" class="godetail">
	      					<img alt="" src="shopsave/<%=photo%>" class="photo"><br>
	      					<%=dto.getSangpum() %><br>
	      					<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
	      					<span style="float: right;">
	      						<div style="color: gray; font-size: 13px;">
	      							<%
	      								int price = (int)(dto.getPrice()*((100-sale)/100.0));
	      							%>
	      							<strike><%=nf.format(dto.getPrice()) %></strike>
	      						</div>
	      						<div style="color: black; font-size: 16px;">
	      							<%=nf.format(price) %>
	      						</div>
	      					</span>
	      					</a>
	      					</div>
	      				</td>
	      				<%
	      						if((i+1)%3==0){
	      							%>
	      							</tr>
	      							<tr>
	      							<%
	      						}
	      					}
	      				}
	      			%>
	      		</tr>
	      	</table>
	      </p>
	    </div>
	    
	    <div id="tabs-3" class="container tab-pane"><br>
	      <p>
	      	<table class="table tale-bordered" style="width: 700px;">
	      		<caption align="top"><b>전체상품목록</b></caption>
	      		<tr>
	      			<%
	      				for(int i=0; i<list.size(); i++){
	      					ShopDto dto = list.get(i);
	      					
	      					if(dto.getCategory().equals("상의")){
	      					String photo = dto.getPhoto();
	      					
	      					//20~50%까지 랜덤 할인
	      					int sale = (int)(Math.random()*31)+20;
	      				%>
	      				<td>
	      				<div style="width: 230px;">
	      					<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer; text-decoration: none; color: black" class="godetail">
	      					<img alt="" src="shopsave/<%=photo%>" class="photo"><br>
	      					<%=dto.getSangpum() %><br>
	      					<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
	      					<span style="float: right;">
	      						<div style="color: gray; font-size: 13px;">
	      							<%
	      								int price = (int)(dto.getPrice()*((100-sale)/100.0));
	      							%>
	      							<strike><%=nf.format(dto.getPrice()) %></strike>
	      						</div>
	      						<div style="color: black; font-size: 16px;">
	      							<%=nf.format(price) %>
	      						</div>
	      					</span>
	      					</a>
	      					</div>
	      				</td>
	      				<%
	      						if((i+1)%3==0){
	      							%>
	      							</tr>
	      							<tr>
	      							<%
	      						}
	      					}
	      				}
	      			%>
	      		</tr>
	      	</table>
	      </p>
	    </div>
	    
	    <div id="tabs-4" class="container tab-pane"><br>
	      <p>
	      	<table class="table tale-bordered" style="width: 700px;">
	      		<caption align="top"><b>전체상품목록</b></caption>
	      		<tr>
	      			<%
	      				for(int i=0; i<list.size(); i++){
	      					ShopDto dto = list.get(i);
	      					
	      					if(dto.getCategory().equals("하의")){
	      					String photo = dto.getPhoto();
	      					
	      					//20~50%까지 랜덤 할인
	      					int sale = (int)(Math.random()*31)+20;
	      				%>
	      				<td>
	      				<div style="width: 230px;">
	      					<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer; text-decoration: none; color: black" class="godetail">
	      					<img alt="" src="shopsave/<%=photo%>" class="photo"><br>
	      					<%=dto.getSangpum() %><br>
	      					<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
	      					<span style="float: right;">
	      						<div style="color: gray; font-size: 13px;">
	      							<%
	      								int price = (int)(dto.getPrice()*((100-sale)/100.0));
	      							%>
	      							<strike><%=nf.format(dto.getPrice()) %></strike>
	      						</div>
	      						<div style="color: black; font-size: 16px;">
	      							<%=nf.format(price) %>
	      						</div>
	      					</span>
	      					</a>
	      					</div>
	      				</td>
	      				<%
	      						if((i+1)%3==0){
	      							%>
	      							</tr>
	      							<tr>
	      							<%
	      						}
	      					}
	      				}
	      			%>
	      		</tr>
	      	</table>
	      </p>
	    </div>
	    
	    <div id="tabs-5" class="container tab-pane"><br>
	      <p>
	      	<table class="table tale-bordered" style="width: 700px;">
	      		<caption align="top"><b>전체상품목록</b></caption>
	      		<tr>
	      			<%
	      				for(int i=0; i<list.size(); i++){
	      					ShopDto dto = list.get(i);
	      					
	      					if(dto.getCategory().equals("악세서리")){
	      					String photo = dto.getPhoto();
	      					
	      					//20~50%까지 랜덤 할인
	      					int sale = (int)(Math.random()*31)+20;
	      				%>
	      				<td>
	      				<div style="width: 230px;">
	      					<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer; text-decoration: none; color: black" class="godetail">
	      					<img alt="" src="shopsave/<%=photo%>" class="photo"><br>
	      					<%=dto.getSangpum() %><br>
	      					<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
	      					<span style="float: right;">
	      						<div style="color: gray; font-size: 13px;">
	      							<%
	      								int price = (int)(dto.getPrice()*((100-sale)/100.0));
	      							%>
	      							<strike><%=nf.format(dto.getPrice()) %></strike>
	      						</div>
	      						<div style="color: black; font-size: 16px;">
	      							<%=nf.format(price) %>
	      						</div>
	      					</span>
	      					</a>
	      					</div>
	      				</td>
	      				<%
	      						if((i+1)%3==0){
	      							%>
	      							</tr>
	      							<tr>
	      							<%
	      						}
	      					}
	      				}
	      			%>
	      		</tr>
	      	</table>
	      </p>
	    </div>
	    
	    <div id="tabs-6" class="container tab-pane"><br>
	      <p>
	      	<table class="table tale-bordered" style="width: 700px;">
	      		<caption align="top"><b>전체상품목록</b></caption>
	      		<tr>
	      			<%
	      				for(int i=0; i<list.size(); i++){
	      					ShopDto dto = list.get(i);
	      					
	      					if(dto.getCategory().equals("신발")){
	      					String photo = dto.getPhoto();
	      					
	      					//20~50%까지 랜덤 할인
	      					int sale = (int)(Math.random()*31)+20;
	      				%>
	      				<td>
	      					<div style="width: 230px;">
	      					<a shopnum=<%=dto.getShopnum() %> style="cursor: pointer; text-decoration: none; color: black" class="godetail">
	      					<img alt="" src="shopsave/<%=photo%>" class="photo"><br>
	      					<%=dto.getSangpum() %><br>
	      					<b style="color: red; font-size: 1.2em;"><%=sale %>%</b>
	      					<span style="float: right;">
	      						<div style="color: gray; font-size: 13px;">
	      							<%
	      								int price = (int)(dto.getPrice()*((100-sale)/100.0));
	      							%>
	      							<strike><%=nf.format(dto.getPrice()) %></strike>
	      						</div>
	      						<div style="color: black; font-size: 16px;">
	      							<%=nf.format(price) %>
	      						</div>
	      					</span>
	      					</a>
	      					</div>
	      				</td>
	      				<%
	      						if((i+1)%3==0){
	      							%>
	      							</tr>
	      							<tr>
	      							<%
	      						}
	      					}
	      				}
	      			%>
	      		</tr>
	      	</table>
	      </p>
	    </div>
	</div>

</body>
</html>