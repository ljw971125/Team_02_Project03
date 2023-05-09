<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%> <!--로그인 확인-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../Common/Link.jsp" />
<title>회원제 게시판</title>
<script type="text/javascript">
function validateForm(form) {
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.recontent.value == "") {
        alert("내용을 입력하세요.");
        form.recontent.focus();
        return false;
    }

/*     if (form.rnum.value == "") {
        alert("방 번호를 체크해주세요.");
        form.rnum.focus();
        return false;
    } */
}
</script>
</head>
<body>

<div style="height: 200px;"></div>
<h2>회원제 게시판 - 글쓰기(Write)</h2>
<form name="writeFrm" method="post" action="WriteProcess.jsp"
      onsubmit="return validateForm(this);">
    <table border="1" width="90%">
        <tr>
            <td>제목</td>
            <td>
                <input type="text" name="title" style="width: 90%;" />
            </td>
        </tr>
        <tr>
            <td>내용</td>
            <td>
                <textarea name="recontent" style="width: 90%; height: 100px;"></textarea>
            </td>
        </tr>
        <tr>
        	<td>회의실 번호</td>
        	<td>
        		<label><input type="radio" name="rnum" value="101">101호 회의실</label>
        		<label><input type="radio" name="rnum" value="102">102호 회의실</label>
        		<label><input type="radio" name="rnum" value="103">103호 회의실</label>
        	</td>
        </tr>
        <tr>
        	<td>평점</td>
        	<td>
		        <label><input type="radio" name="rate" value="1">★</label>
		        <label><input type="radio" name="rate" value="2">★★</label>
		        <label><input type="radio" name="rate" value="3">★★★</label>
		        <label><input type="radio" name="rate" value="4">★★★★</label>
		        <label><input type="radio" name="rate" value="5">★★★★★</label>
        	</td>
        </tr>
        <tr>
            <td colspan="2" align="center">
                <button type="submit">작성 완료</button>
                <button type="reset">다시 입력</button>
                <button type="button" onclick="location.href='review.jsp';">
                    목록 보기</button>
            </td>
        </tr>
    </table>
    <script src="../Common/link.js"></script>
</form>
</body>
</html>