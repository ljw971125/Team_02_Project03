
window.onload = function() {
    // 여기에 JavaScript 코드를 작성하세요.
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
}