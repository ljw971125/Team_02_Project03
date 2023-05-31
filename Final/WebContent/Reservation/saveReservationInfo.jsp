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

	<%
		if (session.getAttribute("reservationComplete") != null) { // 만약 session에 저장된 "reservationComplete"의 값이 null 이 아니라면 아래 코드 실행
	%>
	
	<!-- 예약 성공 시 알림 메세지 및 마이페이지로 이동-->
	<script type="text/javascript">
		alert("예약이 완료되었습니다.");
		location.href = "/Final/mvc2/mypage.do";
	</script>
	<%
		session.removeAttribute("reservationComplete");
	%>
	<%
		} else if (session.getAttribute("reservationError") != null) { // 만약 session에 저장된 "reservationError"의 값이 null 이 아니라면 아래 코드 실행
	%>
	<!-- 예약 실패 시 알림 메세지 및 예약페이지로 이동-->
	<script type="text/javascript">
		alert("이미 예약된 시간입니다.");
		history.back();
	</script>
	<%
		session.removeAttribute("reservationError"); // 세션값 삭제
	%>
	<%
		}
	%>


</body>
</html>