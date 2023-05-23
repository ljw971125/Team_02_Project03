/**
 * 
 */

$(document).ready(function (){
	$('.bxslider').bxSlider({
		minSlides: 1,
		maxSlides: 1,
		auto: true, // 자동으로 애니메이션 시작
		speed: 500, // 애니메이션 속도
		pause: 5000, // 애니메이션 유지시간 (1000은 1초)
		mode:'horizontal', // 슬라이드 모드('fade','horizontal','vertical')
		pager: true, // 페이지 표시 보여짐
		controls: false,	// 좌 우 버튼 표시여부
		captions: true, //이미지 위에 텍스트를 넣을 수 있음  
		preventDefaultSwipeX: false,
		touchEnabled: false,
	});
});