<%@page import="java.util.StringTokenizer"%>
<%@page import="data.dao.MemberDao"%>
<%@page import="data.dto.MemberDto"%>
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
 <script type="text/javascript">
 	$(function() {
		
		//이메일
		$("#selemail").change(function(){
			var email2 = $(this).val();
			
			if(email2=="-"){
				$("#email2").val("");
				$("#email2").focus();
			}else{
				$("#email2").val(email2);
			}
        });
		
		
	})
	
	function check(f) {
		if(f.pass.value!=f.pass2.value){
			alert("비밀번호가 일치하지 않습니다.");
			f.pass.value="";
			f.pass2.value="";
			
			return false;//action이 호출되지 않음
		}
	}
	
 </script>
</head>
<%
	//num
	String num = request.getParameter("num");
	//dao
	MemberDao dao = new MemberDao();
	//dto
	MemberDto dto = dao.getMember(num);
	
	//이메일 구분하기(@기준으로)
	/*int idx=dto.getEmail().indexOf('@');
	String email1 = dto.getEmail().substring(0,idx);//0~(idx-1)
	String email2 = dto.getEmail().substring(idx+1);//idx+1번지부터 끝까지*/
	
	//@을 구분자로 분리
	StringTokenizer st = new StringTokenizer(dto.getEmail(),"@");
	String email1 = st.nextToken();
	String email2 = st.nextToken();
	
%>
<body>
<form action="member/updateproc.jsp" method="post" onsubmit="return check(this)">
	<table class="table table-bordered" style="width: 500px;">
		<caption align="top"><b>회원정보수정</b></caption>
		<input type="hidden" name="num" value="<%=num%>">
			<tr>
				<th style="width: 100px; background-color: #aaa">아이디</th>
				<td>
					<b><%=dto.getId() %></b>
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">비밀번호</th>
				<td>
					<input type="password" name="pass" class="form-group"
					required="required" style="width: 120px">
					<input type="password" name="pass2" class="form-group"
					required="required" style="width: 120px;" placeholder="비밀번호확인">
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">회원명</th>
				<td>
					<input type="text" name="name" class="form-group"
					required="required" style="width: 120px;" value=<%=dto.getName() %>>
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">핸드폰</th>
				<td>
					<input type="text" name="hp" class="form-group"
					required="required" style="width: 200px;" value=<%=dto.getHp() %>>
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">주소</th>
				<td>
					<input type="text" name="addr" class="form-group"
					required="required" style="width: 350px;" value=<%=dto.getAddr() %>>
				</td>
			</tr>
			
			<tr>
				<th style="width: 100px; background-color: #aaa;">이메일</th>
				<td>
					<input type="text" name="email1" class="form-group"
					required="required" style="width: 120px;" value="<%=email1%>">
					<b>@</b>
					<input type="text" name="email2" id="email2" class="form-group"
					required="required" style="width: 120px;" value="<%=email2%>">
						<select id="selemail" class="form-group">
							<option value="-">직접입력</option>
							<option value="naver.com">네이버</option>
							<option value="gmail.com">구글</option>
							<option value="hanmail.com">다음</option>
							<option value="nate.com">네이트</option>
						</select>
				</td>
			</tr>
			
			<tr>
				<td colspan="2" align="center">
					<button type="submit" class="btn btn-outline-success" style="width: 100px;">회원수정</button>
					<button type="reset" class="btn btn-outline-success" style="width: 100px;">초기화</button>
				</td>
			</tr>
			
	</table>
</form>
</body>
</html>