<%@ page import="reviewPage.ReviewDAO"%>
<%@ page import="reviewPage.ReviewDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%>
<%
// 수정 내용 얻기

String virtualNum = request.getParameter("virtualNum"); 
String num = request.getParameter("num"); 
String title = request.getParameter("title");
String recontent = request.getParameter("recontent");
String room = (String)request.getParameter("room");
// DTO에 저장
ReviewDTO dto = new ReviewDTO();
dto.setNum(num);
dto.setTitle(title);
dto.setRecontent(recontent); 

// DB에 반영
ReviewDAO dao = new ReviewDAO(application); 
int affected = dao.updateEdit(dto); 
dao.close();

// 성공/실패 처리
if (affected == 1) { 
    // 성공 시 상세 보기 페이지로 이동
	response.sendRedirect("View.jsp?num=" + dto.getNum() +"&virtualNum="+ virtualNum + "&room=" + room);
    System.out.println(dto.getNum());
} 
else {
    // 실패 시 이전 페이지로 이동
    JSFunction.alertBack("수정하기에 실패하였습니다.", out);
}
%>
