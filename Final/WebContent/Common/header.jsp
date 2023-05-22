<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 세션값 받아오기
	String userId = (String)session.getAttribute("UserId");
	String userNik = (String)session.getAttribute("Nik");
%>    
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/CSS/header.css">

<link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
/>
<meta charset="UTF-8">
</head>
<body>
	<header class="headerBox">
		<div class="top-bar text-align-center line-height-0-ch-only">
			<i class="fas fa-stream" id="menu_box_img"></i>
			<nav class="menu-box inline-block">
				<ul class="row">
					<li class="name">회사소개
						<ul class="innerMenu">
							<li><a href="<%=request.getContextPath() %>/about.do">회사소개</a></li>
							<li><a href="<%=request.getContextPath() %>/year.do">회사연도</a></li>
							<li><a href="<%=request.getContextPath() %>/op.do">방침 및 목표</a></li>
							<li><a href="<%=request.getContextPath() %>/howtocome.do">오시는길</a></li>
						</ul>
					</li>
					<li class="name">
						회의실 예약
						<ul class="innerMenu">
							<li><a href="<%=request.getContextPath() %>/detail.do?room=101">101호</a></li>
							<li><a href="<%=request.getContextPath() %>/detail.do?room=102">102호</a></li>
							<li><a href="<%=request.getContextPath() %>/detail.do?room=103">103호</a></li>
						</ul>
					</li>
	 				<li class="name">
					 	고객센터
					 	<ul class="innerMenu">
					 		<li>공지사항</li>
					 		<li>문의사항</li>
					 	</ul>
					 </li>
				</ul>
			</nav>
			<div class="menu-box-bg"></div>
			<div class="sub-menu-bar-bg"></div>
		</div>
		<div class="MUF-logo">
	            <a href="<%=request.getContextPath() %>/index.do" class="sitename">MUF</a>
	    </div>
	   	<div class="menu">
	            <ul>
	            	<!-- 세션값으로 로그인 상태를 판단해 '헤더 메뉴' 클릭 시 로그인 or 마이 페이지 or 관리자 페이지 이동 작업 -->
	            	<!-- 1> 회원/관리자 로그인 X ==> 메뉴 : 로그인/회원가입/예약확인
	            	 	 2> 회원 O ==> 메뉴 : 마이페이지/로그아웃/예약확인
	            	 	 3> 관리자 X ==> 메뉴 : 관리자페이지/로그아웃
	            	 -->
	            	<%
	            		if(userId != null) {   // 회원 로그인 O
	                %>
	                		<li><%=userNik%>님</li>
	                		<li><a href="<%=request.getContextPath() %>/mvc2/mypage.do" class="login">마이페이지</a></li>
	                		<li><a href="<%=request.getContextPath() %>/Logout.do" class="logout">로그아웃</a></li> 
	                		<li><a href="<%=request.getContextPath() %>/CustomerService/InquiryMain.jsp" class="my_inquiry">문의사항</a></li>
	                <%
	            		}
	            		else{
	                %>
	                 		<li><a href="<%=request.getContextPath() %>/Login.do">로그인</a></li>
	               			<li><a href="<%=request.getContextPath() %>/register.do">회원가입</a></li> 
	               	<%
	            		}
	               	%>
	            </ul>
	        </div>
	</header>
</body>
</html>