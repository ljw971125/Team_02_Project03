<%@ page import="reviewPage.ReviewDAO"%>
<%@ page import="reviewPage.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%

// 폼값 받기
String title = request.getParameter("title");
String recontent = request.getParameter("recontent");
String rnum = request.getParameter("rnum");
Float rate = Float.parseFloat(request.getParameter("rate"));


// 폼값을 DTO 객체에 저장
ReviewDTO dto = new ReviewDTO();
dto.setTitle(title);
dto.setNik((String)session.getAttribute("Nik"));
dto.setRecontent(recontent);
dto.setRnum(rnum);
dto.setRate(rate);

// DAO 객체를 통해 DB에 DTO 저장
ReviewDAO dao = new ReviewDAO(application);
int iResult = dao.insertWrite(dto);
dao.close();

// 성공 or 실패? 
if (iResult == 1) {
    response.sendRedirect("review.jsp");
} else {
    JSFunction.alertBack("글쓰기에 실패하였습니다.", out);
}
%>