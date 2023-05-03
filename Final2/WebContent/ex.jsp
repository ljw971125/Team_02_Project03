<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <div id="map" style="width:1000px;height:700px;"></div>
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

// 마커를 생성합니다
var marker = new kakao.maps.Marker({
  position: position
});

// 마커를 지도에 표시합니다.
marker.setMap(map);

</script>
</body>
</html>