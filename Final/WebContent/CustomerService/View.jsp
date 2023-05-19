<%@ page import="customerInquiryBoard.InquiryDAO"%>
<%@ page import="customerInquiryBoard.InquiryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
String num = request.getParameter("num");  // 일련번호 받기 
String virtualNum = request.getParameter("virtualNum"); //게시글번호받기

InquiryDAO dao = new InquiryDAO(application);  // DAO 생성 
InquiryDTO dto = dao.selectView(num);        // 게시물 가져오기 
dao.close();                               // DB 연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<jsp:include page="/Common/header.jsp" />
<title>문의 게시판</title>
</head>
<body>
<div style="height: 200px;"></div>
<h2><a href="<%=request.getContextPath() %>/CustomerService/InquiryMain.jsp" class="my_inquiry">문의 게시판</a> - <%=dto.getTitle()%></h2>
<article>
	<form name="writeFrm">
	    <input type="hidden" name="num" value="<%= num %>" />  <!-- 공통 링크 -->
	
	    <table class="table table-striped-columns table-success 
    				table-bordered border-dark table-hover" width="90%">
	        <tr>
	            <td>번호</td>
	            <td><%= virtualNum %></td>
	            <td>작성자</td>
	            <td><%= dto.getNik() %></td>
	        </tr>
	        <tr>
	            <td>제목</td>
	            <td colspan="3"><%= dto.getTitle() %></td>
	        </tr>
	        <tr>
	            <td>내용</td>
	            <td colspan="3" height="100">
	                <%= dto.getIcontent().replace("\r\n", "<br/>") %></td> 
	        </tr>
	        <tr>
	        <% if (dto.getIcomment() != null){;%>
	            <td>답변</td>
	            <td colspan="3" height="100">
	                <%= dto.getIcomment().replace("\r\n", "<br/>") %></td> 
	        </tr>
	        <% }%>
	        <tr>
	            <td colspan="4" align="center">
	            <%
	            if (session.getAttribute("Nik") != null
	                && session.getAttribute("Nik").toString().equals(dto.getNik()) 
	            	&& dto.getIcomment() == null){
	            %>
	                <button type="button" class="btn btn-secondary btn-lg"
	                        onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>&virtualNum=<%= virtualNum %>';">
	                    수정하기</button>
	                <button type="button" class="btn btn-secondary btn-lg" onclick="deletePost();">삭제하기</button> 
	            <%
	            }
	            %>
	            <% 
	            if (session.getAttribute("Nik") != null
	            	&& session.getAttribute("Nik").toString().equals("admin")
	            	&& dto.getIcomment() == null){
	            %>
	            	<button type="button" class="btn btn-secondary btn-lg"
	                        onclick="location.href='answer.jsp?num=<%= dto.getNum() %>&virtualNum=<%= virtualNum %>';">
	                    답변하기</button>
	                    
	                <button type="button" class="btn btn-secondary btn-lg" onclick="deletePost();">삭제하기</button> 
	            <%	
	            	}
	            if (session.getAttribute("Nik") != null
	                && session.getAttribute("Nik").toString().equals("admin")
	                && dto.getIcomment() != null){
	            %>
	            	<button type="button" class="btn btn-secondary btn-lg" onclick="deletePost();">삭제하기</button>
	            	<button type="button" class="btn btn-secondary btn-lg"
	                        onclick="location.href='answerEdit.jsp?num=<%= dto.getNum() %>&virtualNum=<%= virtualNum %>';">
	                    답변수정하기</button>
	            <%
	            }
	            %>
	                <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='InquiryMain.jsp';">
	                    목록 보기
	                </button>
	            </td>
	        </tr>
	    </table>
	</form>
</article>
<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
<script src="/Final1/js/CS.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>
