<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../Style/company.css">
<jsp:include page="../Common/Link.jsp" />

<meta charset="utf-8"/>
<title>Kakao 지도 시작하기</title>
</head>

<body>

<aside>
    <jsp:include page="../LogIn/LoginForm.jsp" />
</aside>

<div style="height: 200px;"></div>

<article style="margin-left: 200px;">
<div id="map-location">
<div id="map" style="width:800px;height:800px;"></div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=98b1aacce40bd2d6e395140352e317de"></script>
<script>
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	    mapOption = { 
	        center: new kakao.maps.LatLng(37.6015, 127.0806), // 지도의 중심좌표
	        level: 3 // 지도의 확대 레벨
	    };
	var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
	// 마커를 표시할 위치입니다 
	var position =  new kakao.maps.LatLng(37.6015, 127.0806);
	// 마커 이미지의 이미지 주소입니다
	var imageSrc = "marker.png";    
	// 마커 이미지의 이미지 크기 입니다
	var imageSize = new kakao.maps.Size(64, 69); 
	// 마커 이미지를 생성합니다    
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize);     
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: position,
	    image: markerImage // 마커 이미지 
	});
	// 마커를 지도에 표시합니다.
	marker.setMap(map);	
</script>
</div>
</article>
<div style="height: 20px;"></div>
<jsp:include page="../Common/rfooter.jsp" />
<script src="../Common/link.js"></script>
</body>
</html>
