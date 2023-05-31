<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<jsp:include page="/Common/header.jsp" />
<!-- 공통 헤더를 포함합니다. -->
<link href="../CSS/review.css" rel="stylesheet" type="text/css">
<!-- 리뷰 페이지에 대한 CSS 파일을 연결합니다. -->
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 사용하기 위해 -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>리뷰 작성하기</title>
<script>
	function validateForm() { // 폼 유효성 검사 함수
		var content = document.forms[0]["contentDetail"].value;
		var rating = document.querySelector('input[name="rating"]:checked');
		if (content == "" || rating == null) { // 내용이 비어있거나 별점이 선택되지 않았을 경우
			alert("내용과 별점을 입력해주세요."); // 경고창을 띄움
			return false;
		}
		return true;
	}
</script>
</head>
<body>
	<div style="height: 100px;"></div>
	<!-- 상단 여백 -->
	<form method="post"
		action="../mvc2/reWrite.do?room=${param.room }&num=${param.num}"
		onsubmit="return validateForm()">
		<!-- 폼 제출 시 유효성 검사 함수 실행 -->
		<div class="container">
			<div style="display: flex; justify-content: space-between;">
				<h2>${ param.room }호실리뷰작성하기</h2>
				<!-- 호실 번호 표시 -->
				<h2>
					닉네임:
					<%=session.getAttribute("UserNik")%></h2>
				<!-- 사용자 닉네임 표시 -->
			</div>
			<table class="table table-hover">
				<tbody>
					<tr>
						<td><textarea type="text" class="form-control"
								placeholder="리뷰 내용을 입력해주세요." name="contentDetail"
								maxlength="1024" style="height: 400px;"></textarea></td>
						<!-- 리뷰 내용 입력란 -->
					</tr>
					<tr>
						<td>
							<div class="star-rating">
								<!-- 별점 입력란 -->
								<input type="radio" id="5-stars" name="rating" value=5 /> <label
									for="5-stars" class="star">★</label> <input type="radio"
									id="4-stars" name="rating" value=4 /> <label for="4-stars"
									class="star">★</label> <input type="radio" id="3-stars"
									name="rating" value=3 /> <label for="3-stars" class="star">★</label>
								<input type="radio" id="2-stars" name="rating" value=2 /> <label
									for="2-stars" class="star">★</label> <input type="radio"
									id="1-star" name="rating" value=1 /> <label for=1-star
									" class="star">★</label>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
			<input type="submit" class="btn btn-primary pull-right" value="글쓰기">
			<!-- 글쓰기 버튼 -->
		</div>
	</form>
</body>
<div style="height: 280px;"></div>
<!-- 하단 여백 -->
<footer> <jsp:include page="/Common/afooter.jsp" /> <!-- 공통 푸터를 포함합니다. -->
</footer>
</html>
