<%@ page import="customerInquiryBoard.InquiryDAO"%>
<%@ page import="customerInquiryBoard.InquiryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%> 
<%
String num = request.getParameter("num");  // 일련번호 받기 
String virtualNum = request.getParameter("virtualNum"); // 게시글 가상번호 받기
InquiryDAO dao = new InquiryDAO(application);  // DAO 생성
InquiryDTO dto = dao.selectView(num);        // 게시물 가져오기 
String sessionNik = session.getAttribute("Nik").toString(); // 닉네임 얻기 
if (!sessionNik.equals("admin")) {      // admin인지 확인
    JSFunction.alertBack("admin만 답변할 수 있습니다.", out);
    return;
}
dao.close();  // DB 연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/Common/header.jsp" />
<title>문의 게시판 답변</title>
</head>
<body>
<div style="height: 200px;"></div>
<h2>문의 게시판 - 답변하기(Comment)</h2>
<article>
	<form name="writeFrm" method="post" action="answerProcess.jsp"
	      onsubmit="return validateForm(this);">
	    <input type="hidden" name="num" value="<%= dto.getNum() %>" /> 
	    <input type="hidden" name="virtualNum" value="<%= virtualNum %>"/>
	    <table border="1" width="90%">
	        <tr>
	            <td>내용</td>
	            <td>
	                <textarea name="icomment" style="width: 90%; height: 100px;"></textarea>
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
<script src="/Final1/js/CS_answer.js"></script>  
</body>
</html>