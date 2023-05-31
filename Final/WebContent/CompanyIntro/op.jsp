<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String content = "";
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/company.css">
<meta charset="UTF-8">
<title>회사의 목표 및 방침</title>
</head>

<body>

<div style="height: 40px;"></div>

<article>
<div id="op-text">
<h1 align="center"> 회사 목표 및 방침</h1>
<div style="height: 40px;"></div>
<p id="muf-2"> 1. 항상 고객을 위한 서비스로 </p>
<p id="muf-3"> > 고객에게 최고의 만족감을 줄 수 있도록 한다. </p>
<p id="muf-2"> 2. 최상의 환경으로 </p>
<p id="muf-3"> > 고객에게 방해가 되는 요소가 없도록 한다. </p>
<p id="muf-2"> 3. 깔끔한 공간으로 </p>
<p id="muf-3"> > 고객에게 항상 깔끔한 공간을 제공한다. </p>
<p id="muf-2"> 4. 최상의 시설장비로 </p>
<p id="muf-3"> > 고객이 이용할 수 있는 장비들을 매일 검토 및 청소한다. </p>
<p id="muf-2"> 5. 예약의 편리함으로 </p>
<p id="muf-3"> > 고객이 예약할 때 간편하고 편리하게 예약할 수 있게 유지보수를 한다. </p>
</div>
</article>

<div style="height: 20px;"></div>
</body>
<footer>
	<jsp:include page="/Common/rfooter.jsp" />
</footer>
</html>