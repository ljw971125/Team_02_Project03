<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/CSS/company.css">
<meta charset="utf-8"/>
<title>오시는길</title>
</head>

<body>

<div style="height: 200px;"></div>
<h1 align="center"> 오시는 길 </h1>
<div style="height: 30px;"></div>
<article style="margin-left: 200px;">
<div id="map-location">
<div id="map" style="width:1000px;height:800px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98b1aacce40bd2d6e395140352e317de"></script>
<script type="text/javascript" src="/Final/js/kMap.js"></script>
<br>
<p style="margin-left: 20px;">
    <span style= "font-size: larger;">주소</span>
    <span style="margin-left: 270px; font-size: larger;">서울특별시 중랑구 중화제1동 봉화산로 56 2F</span>
</p>
<p style="margin-left: 20px;">
    <span style= "font-size: larger;">자동차</span>
    <span style="margin-left: 250px; font-size: larger;">내비게이션으로 '대우직업능력개발원' 검색</span>
</p>
<p style="margin-left: 20px;">
    <span style= "font-size: larger;">대중교통</span>
    <span style="margin-left: 230px; font-size: larger;">지하철 - 7호선 2번 출구에서 나온후 신호등 건너 2분거리</span>
</p>
<p style="margin-left: 20px;">
    <span style= "font-size: larger;">!읽어주세요!</span>
    <span style="margin-left: 200px; font-size: larger;">주차공간이 협소합니다. 가능한 한 대중교통을 이용해주세요</span><br>
    <span style="margin-left: 315px; font-size: larger;">주차가 꼭 필요하신 경우는 하루 전에 연락해 주시기 바랍니다.</span><br>
    <span style="margin-left: 315px; font-size: larger;">문의 : 010-1234-5678</span><br>
</p>
</div>
</article>

<div style="height: 20px;"></div>
</body>
<footer>
	<jsp:include page="/Common/afooter.jsp" />
</footer>
</html>
