/**
 * 
 */

$(document).ready(function (){
	$('.bxslider').bxSlider({
		slideWidth: 300,
		slideMargin: 20,
		minSlides: 1,
		maxSlides: 4,
		auto: true, // 자동으로 애니메이션 시작
		speed: 500, // 애니메이션 속도
		pause: 10000, // 애니메이션 유지시간 (1000은 1초)
		mode:'horizontal', // 슬라이드 모드('fade','horizontal','vertical')
		pager: true, // 페이지 표시 보여짐
		captions: true, //이미지 위에 텍스트를 넣을 수 있음  
		preventDefaultSwipeX: false,
		touchEnabled: false,
		onSlideAfter: function($slideElement, oldIndex, newIndex) {
      		var src = $slideElement.find('img').attr('src');
      		$('.image-container img').attr('src', src);
    	}
	});
});