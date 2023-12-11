<%@page import="data.dto.smartDto"%>
<%@page import="data.dao.smartDao"%>
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
 
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://code.jquery.com/jquery-3.5.0.js"></script> -->
<%
	String num = request.getParameter("num");
	String currentPage = request.getParameter("currentPage");
	smartDao dao = new smartDao();
	smartDto dto = dao.getData(num);
	//프로젝트의 경로
	String root=request.getContextPath();
%>
<!-- se2 폴더에서 js 파일 가져오기 -->
<script type="text/javascript" src="<%=root%>/se2/js/HuskyEZCreator.js"
	charset="utf-8"></script>

<script type="text/javascript" src="<%=root%>/se2/photo_uploader/plugin/hp_SE2M_AttachQuickPhoto.js"
	charset="utf-8"></script>	
</head>
<body>
<form action="board/updateaction.jsp" method="post">
<input type="hidden" name="num" value="<%=num%>">
<input type="hidden" name="currentPage" value="<%=currentPage%>">
	<table class="table table-bordered" style="width: 800px;margin-left: 100px;">
		<caption><h3>스마트 포토 게시판</h3></caption>
		<tr>
			<th bgcolor="orange" width="100">작성자</th>
			<td>
				<input type="text" name="writer" class="form-control"
					required="required" style="width: 130px;" value="<%=dto.getWriter()%>">
			</td>
		</tr>
		<tr>
			<th bgcolor="orange" width="100">제  목</th>
			<td>
				<input type="text" name="subject" class="form-control"
					required="required" style="width: 500px;" value="<%=dto.getSubject()%>">
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<textarea name="content" id="content"		
					required="required"			
					style="width: 100%;height: 300px;display: none;"><%=dto.getContent()!=null? dto.getContent().replace("\n", "<br>"):"" %></textarea>		
			
			</td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button type="button" class="btn btn-outline-warning"
					style="width: 120px;"
					onclick="submitContents(this)">DB수정</button>
				
				<button type="button" class="btn btn-outline-info"
					style="width: 120px;"
					onclick="location.href='index.jsp?main=board/boardlist.jsp'">목록</button>
			</td>
		</tr>
		
	</table>   
</form>

<!-- 스마트게시판에 대한 스크립트 코드 넣기 -->
<script type="text/javascript">
var oEditors = [];

nhn.husky.EZCreator.createInIFrame({

    oAppRef: oEditors,

    elPlaceHolder: "content",

    sSkinURI: "<%=request.getContextPath()%>/se2/SmartEditor2Skin.html",

    fCreator: "createSEditor2"

}); 

//‘저장’ 버튼을 누르는 등 저장을 위한 액션을 했을 때 submitContents가 호출된다고 가정한다.

function submitContents(elClickedObj) {

    // 에디터의 내용이 textarea에 적용된다.

    oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [ ]);

 

    // 에디터의 내용에 대한 값 검증은 이곳에서

    // document.getElementById("textAreaContent").value를 이용해서 처리한다.
    try {
        elClickedObj.form.submit();
    } catch(e) { 

    }

}

// textArea에 이미지 첨부

function pasteHTML(filepath){
    var sHTML = '<img src="<%=request.getContextPath()%>/save/'+filepath+'">';
    oEditors.getById["content"].exec("PASTE_HTML", [sHTML]); 

}
</script>

</body>
</html>






















