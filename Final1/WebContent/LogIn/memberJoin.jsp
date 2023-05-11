<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="signUp.*" %>
<%
String name = request.getParameter("name");
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String nik = request.getParameter("nik");
String birth = request.getParameter("birth");
String gender = request.getParameter("gender");
String phone = request.getParameter("phone");
String adr = request.getParameter("adr");
String jdate = request.getParameter("jdate");

SignUpDTO dto = new SignUpDTO();

dto.setId(id);
dto.setPw(pw);
dto.setNik(nik);
dto.setName(name);
dto.setBirth(birth);
dto.setGender(gender);
dto.setAdr(adr);
dto.setPhone(phone);
dto.setJdate(jdate);
dto.setMoney(0);

SignUpDAO dao = new SignUpDAO(application);
int isResult = dao.insert_member(dto);

response.sendRedirect("/Final1/index.jsp");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body></body>
</html>