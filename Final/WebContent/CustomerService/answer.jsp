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
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<jsp:include page="/Common/header.jsp" />
<title>문의 게시판 답변</title>
</head>
<body>
<div style="height: 200px;"></div>
<h2><a href="<%=request.getContextPath() %>/CustomerService/InquiryMain.jsp" class="my_inquiry">문의 게시판</a> - 답변하기(Comment)</h2>
<article>
	<form name="writeFrm" method="post" action="answerProcess.jsp"
	      onsubmit="return validateForm(this);">
	    <input type="hidden" name="num" value="<%= dto.getNum() %>" /> 
	    <input type="hidden" name="virtualNum" value="<%= virtualNum %>"/>
	    <table class="table table-striped-columns table-success 
    				table-bordered border-dark table-hover" width="90%">
	        <tr>
	            <td>내용</td>
	            <td>
	                <textarea class="form-control" placeholder="내용을 입력해주세요." name="icomment" style="width: 90%; height: 100px;"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <button type="submit" class="btn btn-secondary btn-lg">작성 완료</button>
	                <button type="reset" class="btn btn-secondary btn-lg">다시 입력</button>
	                <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='InquiryMain.jsp';">
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
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>