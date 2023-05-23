<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*" %>
<%@ page import="membership.*" %>

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
	            <a href="<%=request.getContextPath() %>/mvc2/index.do" class="sitename">MUF</a>
	    </div>
	   	<div class="menu">
            <ul>
            	<c:if test="${empty UserId}">
				    <li><a href="<%=request.getContextPath() %>/Login.do">로그인</a></li>
				    <li><a href="<%=request.getContextPath() %>/register.do">회원가입</a></li> 
				</c:if>
				<c:if test="${not empty UserId}">
				    <li>${UserNik}</li>
				    <li><a href="/Final/mvc2/mypage.do" class="login">마이페이지</a></li>
				    <li><a href="/Final/Logout.do" class="logout">로그아웃</a></li> 
				    <li><a href="/Final/CustomerService/InquiryMain.jsp" class="my_inquiry">문의사항</a></li>
				</c:if>          	
            </ul>
        </div>
	</header>
</body>
</html>