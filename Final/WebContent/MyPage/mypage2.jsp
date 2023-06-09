<%@page import="org.apache.tomcat.util.http.ConcurrentDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.List"%>
<%@page import="reservation.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Date"%>
<%@ page import="java.text.SimpleDateFormat"%>

<%@ page import="java.time.LocalDate"%>
<%@ page import="java.time.format.DateTimeFormatter"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.time.LocalDate"%>

<c:set var="currentDate" value="<%=LocalDate.now()%>" />

<!DOCTYPE html>

<html>
<head>
<link rel="stylesheet" href="../CSS/review.css" />
<link rel="stylesheet" type="text/css" href="../CSS/detail.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="../CSS/mypage.css">
<meta charset="UTF-8">
<title>마이페이지</title>
<script type="text/javascript">
	function test() {
		if (!confirm("정말 취소하시겠습니까?")) {
			alert("");
			history.back();

		} else {
			alert("취소되었습니다.");

		}
	}
</script>

</head>
<body class="mypage">
	<div style="height: 200px;"></div>
	<div class="container">
		<div class="infoWrap">
			<table class="myInfo">
				<tbody>
					<tr>
						<td>
							<p>
								<strong>
									<h2><%=session.getAttribute("UserNik")%>
										환영합니다.
									</h2>
								</strong>
							</p>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="infoDetail">
			<ul>
				<li class=" sizing "><strong class="title">리뷰</strong> <strong
					class="data use">${recount }</strong></li>
				<li class=" sizing "><strong class="title">예약</strong> <strong
					class="data use">${reservationCount }</strong></li>
				<c:forEach items="${memInfo}" var="v">
					<c:choose>
						<c:when test="${empty v.birth}">
							<li class=" sizing "><strong class="title">생년월일</strong> <strong
								class="data use"></strong></li>
						</c:when>
						<c:otherwise>
							<li class=" sizing "><strong class="title">생년월일</strong> <strong
								class="data use">${v.birth}</strong></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${empty v.jdate}">
							<li class=" sizing "><strong class="title">가입날짜</strong> <strong
								class="data use"></strong></li>
						</c:when>
						<c:otherwise>
							<li class=" sizing "><strong class="title">가입날짜</strong> <strong
								class="data use">${v.jdate}</strong></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${empty v.phone}">
							<li class=" sizing "><strong class="title">전화번호</strong> <strong
								class="data use"></strong></li>
						</c:when>
						<c:otherwise>
							<li class=" sizing "><strong class="title">전화번호</strong> <strong
								class="data use">${v.phone}</strong></li>
						</c:otherwise>
					</c:choose>
					<c:choose>
						<c:when test="${empty v.adr}">
							<li class=" sizing "><strong class="title">주소</strong> <strong
								class="data use"></strong></li>
						</c:when>
						<c:otherwise>
							<li class=" sizing "><strong class="title">주소</strong> <strong
								class="data use">${v.adr}</strong></li>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</ul>
		</div>

	</div>
	<br>
	<br>

	<div class="used_list_area">
		<c:forEach items="${reviewLists}" var="n">
			<ul class="used_list">
				<li class="card_item">
					<div class="card_header">
						<a href="../index.jsp" class="service_link">
							<div class="title">중화오피스</div>
							<div class="info_box">${n.rdate}|${n.rtime}</div>
						</a>
					</div>
					<div class="card_body">
						<div class="upper_box">
							<div class="review_area">
								<c:choose>
									<c:when test="${n.rdate lt currentDate}">
										<a href="../Review/Write.jsp?room=${n.num}"
											class="link_review_write?">리뷰 쓰기</a>
										<a href="../Detail/detail.jsp?room=${n.num}"
											class="re_reservation">다시 예약하기</a>
									</c:when>
									<c:when test="${n.rdate eq currentDate}"></c:when>
									<c:otherwise>
										<a href="../mvc2/cancel.do?rnum=${n.rnum}" onclick="test()"
											class="cancel_reservation">예약 취소</a>
									</c:otherwise>
								</c:choose>
							</div>
						</div>
						<a class="lower_box">
							<div class="book_room">${n.num}호</div>
							<div class="price">${n.price}원</div>
						</a>
					</div>
				</li>
			</ul>
			<br>
		</c:forEach>
	</div>
	<jsp:include page="../Common/afooter.jsp" />
</body>
</html>