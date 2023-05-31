<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="signUp.SignUpDAO" %>
<%@ page import="signUp.SignUpDTO" %>

<%
  // 클라이언트 측 JavaScript 코드에서 전송한 파라미터 가져오기
  String userName = request.getParameter("name");
  String userBirth = request.getParameter("birth");
  String userGender = request.getParameter("gender");
  String userId = request.getParameter("id");

  // SignUpDAO 객체 생성
  SignUpDAO dao = new SignUpDAO(application);

  // SignUpDAO 객체의 findID 메서드 호출
  String pw = dao.findPW(userName, userBirth, userGender, userId);

  // 호출한 메서드의 반환 값을 JSON 형식으로 변환
  String json = "{\"pw\": \"" + pw + "\"}";

  // JSON 데이터 출력
  out.print(json);
%>