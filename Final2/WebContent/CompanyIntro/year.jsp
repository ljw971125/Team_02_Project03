<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String content = "";
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Common/Link.jsp" />
<link rel="stylesheet" type="text/css" href="../Style/company.css">
<meta charset="UTF-8">
<title>회의실 예약시스템</title>
</head>

<body>

<aside>
    <jsp:include page="../LogIn/LoginForm.jsp" />
</aside>

<article>
<div style="height: 100px;"></div>
<div id="year-text">
<p style="font-size:300%" align="center"> 회 사 연 혁 </p>
</div>
</article>
<article>
<img src="year.jpg" width=60% height="300" style="display: block; margin: auto;" >
</article>
<jsp:include page="../Common/rfooter.jsp" />
<script src="../Common/link.js"></script>
</body>
</html>