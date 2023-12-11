<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=VT323&display=swap"
	rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.7.0.js"></script>
<title>Insert title here</title>
<%
//절대경로잡기
String root = request.getContextPath();
%>	
<style type="text/css">
body{
	background-color: black;
}

li {	
    list-style: none;
}

a:link {
	color: white;
	text-decoration: none;
}

a:visited {
	color: white;
	text-decoration: none;
}

a:hover {
	color: #F28A8A; /* 흰색 글씨로 변경 */
	text-decoration: none; /* 밑줄 제거 */
}

.header_content {
    width: 100%;
    height: 120px;
    background-color: black;
}

.header_content ul li {
	list-style: none;
	float: left;
	/* border: 1px solid black; */
}

.header_content span {
	font-size: 10pt;
	color: white;
}

.inline-grid>* {
	font-size: 1rem;
	display: inline-block;
	vertical-align: top;
	box-sizing: border-box;
}

.menu-bar__menu-box-1>ul>li {
	width: calc(100%/ 7); /* 메뉴가 7개이니 전체 너비를 7로 나눈다 */
}

.menu_hover1 {
	width: 99.9999%;
	font-size: 14pt;
}

.menu_hover1:hover {
	color: #E58484;
}

.menu_hover2 {
	background-color: black;
	border-top: 1px solid silver;
	display: flex;
    overflow: hidden;
    position: relative;
    z-index: 2;
}

.menu_column {
    flex: 1; /* 열의 크기를 동일하게 설정 */
    padding: 0 15px; /* 열 사이의 간격 설정 */
}

.menu_hover2 li {
	margin-bottom: 10px;
	font-size: 12pt;
}

.menu_hover2 div {
	margin-top: 20px;
}

.menu_hover2_font {
	font-size: 0.9em;
	color: silver;
}

.navborder {
	border: 5px groove black;
}

span {
	position: absolute;
	top: 16%;
}

span:hover {
	color: #E58484;
}

.navbar-expand .navbar-nav .nav-link:hover {
	color: #E58484;
}
</style>
</head>
<body>
	<!-- 메인 헤더 -->
	<div class="header_content">
		<div class="contents" align="center">
			<ul class="memberInfo_wrap">
				<li><a
					href="<%=root %>index.jsp"><img alt=""
						src="<%=root%>/logoimg/logo.gif"
						style="width: 16.5%; height: 9%; position: absolute; left: 41.2%; top:3.3%"></a></li>
				<li><a
					href="<%=root%>/index.jsp?main=member/memberloginform.jsp"><img
						src="<%=root%>/logoimg/1.png" alt=""
						style="width: 20px; height: 20px; position: absolute; left: 80%; top: 6%;" /><br>
					<span style="left: 79.65%; top: 10%;">로그인</span></a></li>
				<li><a
					href="<%=root%>/index.jsp?main=member/memberaddform.jsp"><img
						src="<%=root%>/logoimg/2.png" alt=""
						style="width: 20px; height: 20px; position: absolute; left: 84.1%; top: 6%;" /><br>
					<span style="left: 83.5%; top: 10%;">회원가입</span></a></li>
				<li><a
					href="<%=root%>/index.jsp?main=member/memebermypage.jsp"><img
						src="<%=root%>/logoimg/3.png" alt=""
						style="width: 20px; height: 20px; position: absolute; left: 88.35%; top: 6%;" /><br>
					<span style="left: 87.5%; top: 10%;">MY INFO</span></a></li>
				<li><a href=""><img
						src="<%=root%>/logoimg/4.png" alt=""
						style="width: 20px; height: 20px; color: white; position: absolute; left: 92.2%; top: 6%;" /><br>
					<span style="left: 91.7%; top: 10%;">고객센터</span></a></li>
			</ul>
		</div>
	</div>

	<div class="menu_hover1" style="width: 100%;">
		<!-- 메뉴바 -->
		<nav class="navbar navbar-expand navbar-#E58484 bg-black"
			id="navborder" style="width: 100%; height: 40px;">
			<a class="navbar-brand" href="#"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarsExample02" aria-controls="navbarsExample02"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarsExample02" style="width: 100%">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active" style="position: absolute; left: 34%; top: 10%;">
					<a href="#"><b>영화</b></a></li>
					
					<li class="nav-item"><a  href="#"
						style="position: absolute; left: 40%; top: 10%"><b>극장</b></a></li>
						
					<li class="nav-item"><a  href="<%=root %>/index.jsp?main=Movie_reserve/movielist.jsp"
						style="position: absolute; left: 46%; top: 10%"><b>예매</b></a></li>
						
					<li class="nav-item"><a  href="#"
						style="position: absolute; left: 51.7%; top: 10%"><b>스토어</b></a></li>
						
					<li class="nav-item"><a  href="#"
						style="position: absolute; left: 58%; top: 10%"><b>이벤트</b></a></li>
						
					<li class="nav-item"><a  href="#"
						style="position: absolute; left: 64%; top: 10%"><b>혜택</b></a></li>
					
					<li class="nav-item">
						<form class="form-inline my-2 my-md-0">
							<input class="form-control" type="text"
								style="position:absolute; width: 10.2%; height: 60%; right: 10.5%; top: 13.5%;">
						</form>
					</li>
					<li class="nav-item"><a href=""><img
							src="<%=root%>/logoimg/search1.png" alt=""
							style="position:absolute; width: 1.4%; height: 55%; right:9%; top: 12.5%;"/></a>
					</li>
				</ul>
			</div>
		</nav>
		<!-- 메뉴 마우스 호버시 출력할 공간 -->
		<div class="menu_hover2">

			<div style="width: 14%; height: 300px; border-right: 1px solid silver;" class="menu_column">
				<ul>
					<li><a href=""><b>영화</b></a></li>
					<li><a href="" class="menu_hover2_font">무비차트</a></li>
					<li><a href="" class="menu_hover2_font">아트하우스</a></li>
					<li><a href="" class="menu_hover2_font">icecon</a></li>
				</ul>
			</div>

			<div style="float: left; width: 14%; height: 300px; border-right: 1px solid silver;" class="menu_column">
				<ul>
					<li><a href=""><b>극장</b></a></li>
					<li><a href="" class="menu_hover2_font">CINE 극장</a></li>
					<li><a href="" class="menu_hover2_font">특별관</a></li>
				</ul>
			</div>

			<div style="float: left; width: 14%; height: 300px; border-right: 1px solid silver;" class="menu_column">
				<ul>
					<li><a href=""><b>예매</b></a></li>
					<li><a href="" class="menu_hover2_font">빠른예매</a></li>
					<li><a href="" class="menu_hover2_font">상영스케줄</a></li>
					<li><a href="" class="menu_hover2_font">English Ticketing</a></li>
					<li><a href="" class="menu_hover2_font">English Schedule</a></li>
				</ul>
			</div>

			<div style="float: left; width: 14%; height: 300px; border-right: 1px solid silver; margin-bottom: 20px;" class="menu_column">
				<ul>
					<li><a href=""><b>스토어</b></a></li>
					<li><a href="" class="menu_hover2_font">패키지</a></li>
					<li><a href="" class="menu_hover2_font">영화관람권</a></li>
					<li><a href="" class="menu_hover2_font">기프트카드</a></li>
					<li><a href="" class="menu_hover2_font">콤보</a></li>
					<li><a href="" class="menu_hover2_font">팝콘</a></li>
					<li><a href="" class="menu_hover2_font">음료</a></li>
					<li><a href="" class="menu_hover2_font">스낵</a></li>
				</ul>
			</div>

			<div style="float: left; width: 14%; height: 300px; border-right: 1px solid silver;" class="menu_column">
				<ul>
					<li><a href=""><b>이벤트</b></a></li>
					<li><a href="" class="menu_hover2_font">SPECIAL</a></li>
					<li><a href="" class="menu_hover2_font">영화/예매</a></li>
					<li><a href="" class="menu_hover2_font">멤버쉽/CLUB</a></li>
					<li><a href="" class="menu_hover2_font">CINE 극장별</a></li>
					<li><a href="" class="menu_hover2_font">제휴할인</a></li>
					<li><a href="" class="menu_hover2_font">당첨자 발표</a></li>
					<li><a href="" class="menu_hover2_font">종료된 이벤트</a></li>
				</ul>
			</div>

			<div style="float: left; width: 14%; height: 300px;" class="menu_column">
				<ul>
					<li><a href=""><b>혜택</b></a></li>
					<li><a href="" class="menu_hover2_font">CINE 할인정보</a></li>
					<li><a href="" class="menu_hover2_font">CLUB 서비스</a></li>
					<li><a href="" class="menu_hover2_font">VIP 라운지</a></li>
				</ul>
			</div>

		</div>
	</div>

	<script>
		
		    
		$(document).ready(function() {
		    

	    $(".memberInfo_wrap>li:gt(0)").hover(function() {
	        $(this).find("img").css("transform", "rotatey(180deg)").css("transition", "0.7s");
	    }, function() {
	        $(this).find("img").css("transform", "");
	    });

		    // 메뉴 호버 이벤트
		    $(".menu_hover2").hide();

		    // 메뉴 호버1의 <a> 태그에 호버 시 메뉴 호버2 div를 펼치기
		    $(".menu_hover1 a").mouseenter(function() {
		        $(".menu_hover2").stop().slideDown(800); // stop() 메서드 추가
		    });

		    // 메뉴 호버1과 메뉴 호버2 영역에 마우스가 있을 때 메뉴 호버2 div를 유지
		    $(".menu_hover1, .menu_hover2").mouseenter(function() {
		        $(".menu_hover2").stop(); // 애니메이션 정지
		    });

		    // 메뉴 호버1과 메뉴 호버2 영역을 벗어났을 때 메뉴 호버2 div를 숨기기
		    $(".menu_hover1, .menu_hover2").mouseleave(function() {
		        $(".menu_hover2").slideUp(800);
		    });
		});
		</script>
</body>
</html>