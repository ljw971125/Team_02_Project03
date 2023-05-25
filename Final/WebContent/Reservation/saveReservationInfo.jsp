<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="reservation.ReservationDAO"%>
<%@ page import="reservation.ReservationDTO"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회의실 예약</title>
</head>
<body>
<%if (session.getAttribute("reservationComplete") != null) {%>
<script type="text/javascript">
	alert("예약이 완료되었습니다.");
	location.href = "/Final/mvc2/mypage.do";
</script>
<% session.removeAttribute("reservationComplete"); %>
<%} else if (session.getAttribute("reservationError") != null) {%>
<script type="text/javascript">
	alert("이미 예약된 날짜입니다.");
	history.back();
</script>
<% session.removeAttribute("reservationError"); %>
<%} %>

	
</body>
</html>