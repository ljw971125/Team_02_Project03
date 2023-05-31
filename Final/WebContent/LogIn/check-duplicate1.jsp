<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="signUp.SignUpDAO"%>
<%@ page import="signUp.SignUpDTO"%>
<%
	// check-duplicate.jsp

// URL의 "name" 매개 변수의 값을 가져옵니다.
String nik = request.getParameter("nik");

// SignUpDAO 객체를 생성합니다.
SignUpDAO dao = new SignUpDAO(getServletContext());

// 데이터베이스에서 이름이 있는지 확인하는 메서드를 호출합니다.
boolean exists = dao.checkNikExists(nik);

// JSON 응답을 반환합니다.
response.setContentType("application/json");
out.println("{\"exists\": " + exists + "}");
%>