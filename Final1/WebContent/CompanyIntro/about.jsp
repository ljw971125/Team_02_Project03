<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/Final1/Style/company.css">
<meta charset="UTF-8">
<title>회사소개</title>
</head>

<body>
<aside>
    <jsp:include page="/LogIn/LoginForm.jsp" />
</aside>
<div style="height: 200px;"></div>
<h1 align="center">"오르는 능률, 오르는 월급"</h1>
<div style="height: 30px;"></div>
<article>
	<div class="image-container">
		<img src="/Final1/Image/daewoo.jpg" width="600" height="300">
	</div>
	<div class="edit-container">
		<p id="muf-1"> MUF란? </p>
	    <p id="muf"> Meet : 여전히 회의 </p>
	    <p id="muf"> Up : 능률</p>
	    <p id="muf"> Flex : 유연성, 자유로움</p>
	    <p id="muf_i"> 위 세가지 의미를 합쳐서 온라인 및 오프라인의 회의</p>
	    <p id="muf_i"> 모두에게 편안하고 유연한 회의로 증가하는 능률의</p>
	    <p id="muf_i"> 경험을 제공할 수 있다 라는 메시지를 전달합니다.</p>
	</div>
</article>
<div style="height: 30px;"></div>
<article>
	<p id="muf-2"> MUF의 회의실은? </p>
</article>
<div style="height: 10px;"></div>
<article>
	<p id="muf-3"> MUF의 회의실은 깔끔한 시설 차분한 분위기로 </p>
	<p id="muf-3"> 시설은 방음처리가 모두 잘되어 있어 </p>
	<p id="muf-3"> 이용자가 집중할 수 있는 환경을 제공합니다 </p>
</article>
<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
</body>
</html>