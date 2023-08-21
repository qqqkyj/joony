<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Nanum+Pen+Script&family=Noto+Sans+KR&family=Noto+Serif+KR&family=Open+Sans&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
</head>
<body>
   <!-- f1~f20.png 4행5열로 출력, 2중 for문으로 출력 -->
   <table class="table table-bordered" style="width: 650px">
      <%
         int n=0;
      
         for(int row=1; row<=4; row++){//4행
            %>
            <tr>
               <%
                  for(int col=1; col<=5; col++){//5열
                     %>
                        <td>
                           <img src="../image/flower_ani/f<%=n+1%>.png">
                        </td>
                     <%
                     n++;
                  }
               %>
            </tr>
            <%
         }
      %>
   </table>
</body>
</html>