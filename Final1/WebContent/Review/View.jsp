<%@ page import="reviewPage.ReviewDTO"%>
<%@ page import="reviewPage.ReviewDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");  // 일련번호 받기 
String virtualNum = request.getParameter("virtualNum");
String room = (String)request.getParameter("room");
ReviewDAO dao = new ReviewDAO(application);  // DAO 생성 
ReviewDTO dto = dao.selectView(num);        // 게시물 가져오기 
dao.close();                               // DB 연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/Common/header.jsp" />
<title>리뷰 상세보기</title>


</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<body>

<div style="height: 200px;"></div>
<h2>리뷰 게시판 - 상세 보기</h2>

<article>
<form name="writeFrm">
    <input type="hidden" name="num" value="<%= num %>" />  <!-- 공통 링크 -->

    <table class = "table table-bordered" border="1" width="90%">
        <tr>
            <td>번호</td>
            <td><%= virtualNum %></td>
            <td>작성자</td>
            <td><%= dto.getNik() %></td>
        </tr>
        <tr>
            <td>작성일</td>
            <td><%= dto.getRedate() %></td>
            <td>방번호</td>
            <td><%= dto.getRnum() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><%= dto.getTitle() %></td>
        </tr>
        <tr>
            <td>내용</td>
            <td colspan="3" height="100">
                <%= dto.getRecontent().replace("\r\n", "<br/>") %></td> 
        </tr>
        <tr>
            <td colspan="4" align="center">
            <%
            if (session.getAttribute("Nik") != null
                && session.getAttribute("Nik").toString().equals(dto.getNik())) {
            %>
                <button type="button"
                        onclick="location.href='Edit.jsp?num=<%= num%>&virtualNum=<%=virtualNum%>&room=<%= dto.getRnum() %>';">수정하기
                        </button>
                <button type="button" onclick="location.href='DeleteProcess.jsp?room=<%= dto.getRnum() %>&num=<%= num %>';">삭제하기</button>


            <%
            }
            %>
                <button type="button" onclick="location.href='review.jsp?room=<%= room %>&num=<%= num %>';">목록보기</button>

                
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
