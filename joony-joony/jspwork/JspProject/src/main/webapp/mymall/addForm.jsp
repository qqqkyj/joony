<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Open+Sans&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script>
		$(function(){//select에 선택한 값이 변경될 때 마다 사진의 출력이 변경됨
			//select된 선택값 얻기
			var srcImg = $("#photo").val();
			//select에 넣기
			$("#selphoto").attr("src",srcImg);
			
			$("#photo").change(function(){
				var s = $(this).val();
				$("#selphoto").attr("src",s);
			})
		})
	</script>
</head>
<body>
<form action="addAction.jsp" method="post">
	<table class="table table-bordered">
	<caption align="top"><h2>상품등록</h2></caption>
		<tr>
			<th>상품이름</th>
			<td><input type="text" placeholder="상품이름" name="sangpum" required="required"></td>
		</tr>
		<tr>
			<th>사진경로</th>
			<td>
				<select name="photo" id="photo">
					<option value="../image/쇼핑몰사진/20.jpg">시계</option>
					<option value="../image/쇼핑몰사진/25.jpg">원피스</option>
					<option value="../image/쇼핑몰사진/24.jpg">바지</option>
					<option value="../image/쇼핑몰사진/22.jpg">반지</option>
					<option value="../image/쇼핑몰사진/34.jpg">반바지</option>
				</select>
			</td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" placeholder="가격" name="price" required="required"></td>
		</tr>
		<tr>
			<th>입고일</th>
			<td><input type="date" name="ipgoday" required="required"></td>
		</tr>
		
		<tr>
			<td colspan="2" align="center">
				<input type="submit" value="상품저장">
			</td>
		</tr>
	</table>
</form>
	<img id="selphoto">
</body>
</html>