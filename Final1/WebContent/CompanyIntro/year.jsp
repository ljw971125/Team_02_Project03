<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String content = "";
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/Final1/Style/company.css">
<meta charset="UTF-8">
<title>회사연혁</title>
</head>

<body>

<aside>
    <jsp:include page="/LogIn/LoginForm.jsp" />
</aside>

<div style="height: 200px;"></div>

<article>
<div id="year-text">
<p style="font-size:300%" align="center"> 회 사 연 혁 </p>
</div>
</article>

<article>
<img src="/Final1/Image/year.jpg" width=60% height="300" style="display: block; margin: auto;" >
</article>

<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
</body>
</html>