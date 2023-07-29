<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>

<!-- css 파일 -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/main/header.css?after">
<!-- 구글 폰트 -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500;700;900&family=Nunito:wght@200;300;400;600;700&display=swap" rel="stylesheet">
<!-- 아이콘 가져오기 -->
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.5.0/css/all.css" integrity="sha384-B4dIYHKNBt8Bc12p+WXckhzcICo0wtJAoU8YZTY5qE0Id1GSseTk6S+L3BlXeVIU" crossorigin="anonymous">
<!-- @media query 사용하기 위해 viewport 설정 -->
<meta name="viewport" content="width=device-width,initial-scale=1" />

</head>
<body>

	<!-- header section -->
	<div id="menu-bars" class="fas fa-bars"></div> <!-- 창이 작아지면 메뉴바 생김 -->

	<header>
		
		<div>
			<a href="main.do" class="logo"><img src="${pageContext.request.contextPath}/resources/img/logo.png" width="180" style="margin-bottom: 5px;"></a><br>
			<c:choose>
				<c:when test="${loginUser.user_grant == 'user'}">
				<!-- 좌석이용중 (평소에는 안뜨다가 입실(=예약)하자마자 (좌석이용중) 표시 띄우기) -->
				<a id="seat" onmouseover="mover()" onmouseout="mout()" href="#" style="font-size:20px; color:#badc58;">(좌석 이용중)</a>
				</c:when>
			</c:choose>
		</div>
		
		<nav class="navbar">
			<a href="main.do">home</a>
			<a href="#">지점찾기</a>
			<a href="#">소식</a>
			<a href="reviewListView.do">리뷰</a>
			<a href="#">이용권구매</a>
			<a href="#">예약</a>
		</nav>
		
		
		<div class="follow"> <!-- 아이콘 -->
		
		<c:choose>
				<c:when test="${loginUser.user_grant == 'user'}">
					<a href="userStudyChartView.do" id="user_page" class='fa fa-user'></a> <!-- 마이페이지 -->
					<a href="logout.do" id="logout" class='fas fa-user-slash'></a> <!-- 로그아웃 -->
				</c:when> 
				<c:when test="${loginUser.user_grant == 'admin'}">
					<a href="#" id="admin_page" class='fas fa-user-cog'></a> <!-- 관리자페이지 -->
					<a href="logout.do" id="logout" class='fas fa-user-slash'></a> <!-- 로그아웃 -->
				</c:when> 
				<c:otherwise> 
					<a href="loginPageView.do" id="login" class='fa fa-unlock'></a> <!-- 로그인 -->
				</c:otherwise>
		</c:choose>
		</div>
		
	</header>
	
	<script src="${pageContext.request.contextPath}/resources/js/main/header.js"></script>
	
	<script>
	
		// 입실&퇴실 마우스오버 이벤트
		function mover() {
			let m = document.getElementById('seat');
			m.innerText = "(퇴실하겠습니까?)";
			m.style.color = "#ff7979";
		}
		
		function mout() {
			let m = document.getElementById('seat');
			m.innerText = "(좌석 이용중)";
			m.style.color = "#badc58";
		}
	</script>
	
</body>
</html>