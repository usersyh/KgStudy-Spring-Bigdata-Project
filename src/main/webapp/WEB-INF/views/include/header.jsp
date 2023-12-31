

<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>


	<!-- header section -->
	<div id="menu-bars" class="fas fa-bars"></div> <!-- 창이 작아지면 메뉴바 생김 -->

	<header>
		
		<div>
			
			
	
			<a href="/kgstudy/main.do" class="logo"><img src="${pageContext.request.contextPath}/resources/img/logo.png" width="180" style="margin-bottom: 5px;"></a><br>
			<c:choose>
				<c:when test="${loginUser.user_grant == 'user' && checkIn != null}">
				<!-- 좌석이용중 (평소에는 안뜨다가 입실(=예약)하자마자 (좌석이용중) 표시 띄우기) -->
				
				<a id="seat" onclick="checkout()" onmouseover="mover()" onmouseout="mout()" style="font-size:20px; color:#badc58;">(좌석 이용중)</a>
				</c:when>
			</c:choose>
		</div>
		
		<nav class="navbar">
			<a href="/kgstudy/main.do">home</a>
			<a href="/kgstudy/store/find.do">지점찾기</a>
			<a href="/kgstudy/board/list.do">소식</a>
			<a href="/kgstudy/reviewListView.do">리뷰</a>
			<a href="/kgstudy/order/passOrder.do">이용권구매</a>
			<a href="/kgstudy/seat/seat.do">예약</a>
			<a href="/kgstudy/chat/getAllChatRoom">공개 스터디</a>
			<a href="/kgstudy/calendar/calendar.do">캘린더</a>
		</nav>
		
		
		<div class="follow"> <!-- 아이콘 -->
		
		<c:choose>
			<c:when test="${loginUser.user_grant == 'user'}">
					<a href="/kgstudy/userStudyChartView.do" id="user_page" class='fa fa-user'></a> <!-- 마이페이지 -->
					<a href="/kgstudy/logout.do" id="logout" class='fas fa-user-slash'></a> <!-- 로그아웃 -->
					<!-- <a href="#" id="ask" class='fas fa-headphones-alt'></a> 고객센터(문의) -->
				</c:when> 
				<c:when test="${loginUser.user_grant == 'admin'}">
					<a href="/kgstudy/admin/getMemberList.do" id="admin_page" class='fas fa-user-cog'></a> <!-- 관리자페이지 -->
					<a href="/kgstudy/userStudyChartView.do" id="user_page" class='fa fa-user'></a> <!-- 마이페이지 -->
					<a href="/kgstudy/logout.do" id="logout" class='fas fa-user-slash'></a> <!-- 로그아웃 -->
					<!-- <a href="#" id="ask" class='fas fa-headphones-alt'></a> 고객센터(문의) -->
				</c:when> 
				<c:otherwise> 
					<a href="/kgstudy/loginPageView.do" id="login" class='fa fa-unlock'></a> <!-- 로그인 -->
				</c:otherwise>
		</c:choose>
		</div>
		
	</header>
	
	<script>

	var reservId = "${reservId}";
	console.log(reservId);
	function checkout() {

		
		if (confirm("퇴실하시겠습니까?")) {

			

			

			var reqUrl = "/kgstudy/seat/seatCheckOut.do?reservationId=" + reservId;


			$.ajax({
				url: reqUrl,
				type: "POST",


				success: function (data) {

					console.log(data);
					let msg = data;
					if (msg) {

						if (msg === "success") {

							alert("퇴실완료");
							location.reload();


						}


					}
				}

			})


		}

	}
	</script>
