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
if (!sessionNik.equals(dto.getNik())) {      // 본인인지 확인
    JSFunction.alertBack("작성자 본인만 수정할 수 있습니다.", out);
    return;
}
dao.close();  // DB 연결 해제
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의 게시판</title>
<script type="text/javascript">
function validateForm(form) {  // 폼 내용 검증 
    if (form.title.value == "") {
        alert("제목을 입력하세요.");
        form.title.focus();
        return false;
    }
    if (form.icontent.value == "") {
        alert("내용을 입력하세요.");
        form.icontent.focus();
        return false;
    }
}
</script>
</head>
<body>
<jsp:include page="../Common/Link.jsp" />
<h2>문의 게시판 - 수정하기(Edit)</h2>
<form name="writeFrm" method="post" action="EditProcess.jsp"
      onsubmit="return validateForm(this);">
    <input type="hidden" name="num" value="<%= dto.getNum() %>" /> 
    <input type="hidden" name="virtualNum" value="<%= virtualNum %>"/>
    <table border="1" width="90%">
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
                <textarea name="content" style="width: 90%; height: 100px;"><%= dto.getIcontent() %></textarea>
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
</body>
</html>