<%@ page import="reviewPage.ReviewDAO"%>
<%@ page import="reviewPage.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%> 
<%
String num = request.getParameter("num");  // 일련번호 받기 
String virtualNum = request.getParameter("virtualNum");  // 일련번호 받기 
ReviewDAO dao = new ReviewDAO(application);  // DAO 생성
ReviewDTO dto = dao.selectView(num);        // 게시물 가져오기 
String sessionId = session.getAttribute("Nik").toString(); // 로그인 ID 얻기 
String room = request.getParameter("room");
if (!sessionId.equals(dto.getNik())) {      // 본인인지 확인
    JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    return;
}
dao.close();  // DB 연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/Common/header.jsp" />
<title>리뷰 수정</title>


</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<body>
<div style="height: 200px;"></div>
<h2>리뷰 수정</h2>
<article>
	<form name="writeFrm" method="post" action="EditProcess.jsp"
	      onsubmit="return validateForm(this);">
	    <input type="hidden" name="room" value="<%= room %>" />
	    <input type="hidden" name="num" value="<%= dto.getNum() %>" /> 
	    <input type="hidden" name="virtualNum" value="<%= virtualNum %>" /> 
	    <table class= "table table-bordered" border="1" width="90%">
	        <tr>
	            <td>제목</td>
	            
	            <td>
	                <input type="text" name="title" style="width: 90%;" 
	                       value="<%= dto.getTitle() %>"/> 
	            </td>
	        </tr>
	        <tr>
	            <td>내용</td>
	            <td>
	                <textarea name="recontent" style="width: 90%; height: 100px;"><%= dto.getRecontent() %></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <button type="submit" onclick="location.href='review.jsp?room=<%= room %>';">작성 완료</button>
	                <button type="reset">다시 입력</button>
	                <button type="button" onclick="location.href='review.jsp?room=<%= room %>';">
	                    목록 보기</button>
	            </td>
	        </tr>
	    </table>
	</form>
</article>

<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
<script src="/Final1/js/review.js"></script>
</body>
</html>