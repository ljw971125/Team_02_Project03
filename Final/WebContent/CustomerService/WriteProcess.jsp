<%@ page import="customerInquiryBoard.InquiryDAO"%>
<%@ page import="customerInquiryBoard.InquiryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
// 폼값 받기
String title = request.getParameter("title");
String icontent = request.getParameter("icontent");

// 폼값을 DTO 객체에 저장
InquiryDTO dto = new InquiryDTO();
dto.setTitle(title);
dto.setIcontent(icontent);
dto.setNik(session.getAttribute("Nik").toString());

// DAO 객체를 통해 DB에 DTO 저장
InquiryDAO dao = new InquiryDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

// 성공 or 실패? 
if (iResult == 1) {
    response.sendRedirect("InquiryMain.jsp");
} else {
    JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>