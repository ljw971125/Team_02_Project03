<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%> <!--로그인 확인-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/Common/header.jsp" />
<title>문의 게시판</title>
</head>
<body>

<div style="height: 200px;"></div>

<h2>문의 게시판 - 글쓰기(Write)</h2>
<article>
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
	                <textarea name="icontent" style="width: 90%; height: 100px;"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <button type="submit">작성 완료</button>
	                <button type="reset">다시 입력</button>
	                <button type="button" onclick="location.href='InquiryMain.jsp';">
	                    목록 보기</button>
	            </td>
	        </tr>
	    </table>
	</form>
</article>
<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
<script src="/Final1/js/CS.js"></script> 
</body>
</html>