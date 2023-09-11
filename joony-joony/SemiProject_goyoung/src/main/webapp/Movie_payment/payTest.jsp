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
    <script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<script type="text/javascript">
$(function() {
	$("#kaobtn").click(function (){
        /**
         * 결제 버튼 클릭 시
         * 이름 / 배송지 등등.. 필수정보 입력 유효성 체크
         * 여기서는 생략
         */

        /**
         * @ data 화면에서 입력받을 수 있는 기본 결제 정보만 넘겨주기 (나머지는 뒤에서 처리)
         * @ return 카카오톡 결제요청 페이지
         */

        $.ajax({
            type:'get',
            url:'/pay/ready',
            data:{
                item_name : "아이폰 14 pro",
                quantity : "1",
                total_amount : "1400000",
                tax_free_amount : "0"
            },
            success:function(res){
                location.href = res.next_redirect_mobile_url;
            }
        })
    })
});
</script>
</head>
<body>

<button id="kaobtn" style="background: #fee500; color:#000; border-radius: 12px; padding: 10px 20px;">
                        카카오페이</button>
                        
</body>
</html>