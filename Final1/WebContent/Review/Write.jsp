<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="reviewPage.*"%>
<%@ include file="./IsLoggedIn.jsp"%> <!--로그인 확인-->
<%
String room = request.getParameter("room");
System.out.println(room);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/Common/header.jsp" />
<title>리뷰 등록</title>

</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<body>

<div style="height: 200px;"></div>
<div align = "right">
<h2>회원제 게시판 - 글쓰기(Write)</h2>
</div>
<article>
<form name="writeFrm" method="post" action="WriteProcess.jsp?room=<%= request.getParameter("room")%>"
      onsubmit="return validateForm(this);">
      
 <table class = "table table-bordered" border="1" width="90%" style="margin-left: auto; margin-right: 0;">
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