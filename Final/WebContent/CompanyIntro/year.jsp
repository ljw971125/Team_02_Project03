<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    String content = "";
%>
<!DOCTYPE html>
<html>
<head>
<style>

</style>
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/company.css">
<meta charset="UTF-8">
<title>회사연혁</title>
</head>

<body>


<div style="height: 200px;"></div>

<article>
<div id="year-text">
<p style="font-size:300%" align="center"> 회 사 연 혁 </p>
</div>
</article>

<article>
    <div class="button-container">
        <div>
            <button type="button" onclick="showText()">2023.4.19</button>
            <p id="output1"></p>
        </div>
        <div>
            <button type="button" onclick="showText1()">2023.5.11</button>
            <p id="output2"></p>
        </div>
    </div>

<script>
    function showText() {
        document.getElementById("output1").innerHTML = "개발원에서 회의실 예약 홈페이지 계획 수립";
        document.getElementById("output2").innerHTML = "";
    }
    function showText1() {
        document.getElementById("output1").innerHTML = "";
        document.getElementById("output2").innerHTML = "MUF라는 임의의 회사 설립";
    }
</script>
</article>
<div style="height: 20px;"></div>
</body>
<footer>
	<jsp:include page="/Common/rfooter.jsp" />
</footer>
</html>