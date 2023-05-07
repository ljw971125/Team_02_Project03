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
<title>문의 게시판</title>
<script>
function deletePost() {
    var confirmed = confirm("정말로 삭제하겠습니까?"); 
    if (confirmed) {
        var form = document.writeFrm;       // 이름(name)이 "writeFrm"인 폼 선택
        form.method = "post";               // 전송 방식 
        form.action = "DeleteProcess.jsp";  // 전송 경로
        form.submit();                      // 폼값 전송
    }
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>문의 게시판 - <%=dto.getTitle()%></h2>
<form name="writeFrm">
    <input type="hidden" name="num" value="<%= num %>" />  <!-- 공통 링크 -->

    <table border="1" width="90%">
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
                <button type="button"
                        onclick="location.href='Edit.jsp?num=<%= dto.getNum() %>&virtualNum=<%= virtualNum %>';">
                    수정하기</button>
                <button type="button" onclick="deletePost();">삭제하기</button> 
            <%
            }
            %>
            <% 
            if (session.getAttribute("Nik") != null
            	&& session.getAttribute("Nik").toString().equals("admin")
            	&& dto.getIcomment() == null){
            %>
            	<button type="button"
                        onclick="location.href='answer.jsp?num=<%= dto.getNum() %>&virtualNum=<%= virtualNum %>';">
                    답변하기</button>
                    
                <button type="button" onclick="deletePost();">삭제하기</button> 
            <%	
            	}
            if (session.getAttribute("Nik") != null
                && session.getAttribute("Nik").toString().equals("admin")
                && dto.getIcomment() != null){
            %>
            	<button type="button" onclick="deletePost();">삭제하기</button>
            	<button type="button"
                        onclick="location.href='answerEdit.jsp?num=<%= dto.getNum() %>&virtualNum=<%= virtualNum %>';">
                    답변수정하기</button>
            <%
            }
            %>
                <button type="button" onclick="location.href='InquiryMain.jsp';">
                    목록 보기
                </button>
            </td>
        </tr>
    </table>
</form>
</body>
</html>
