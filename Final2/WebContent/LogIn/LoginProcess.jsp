<%@ page import="membership.MemberDTO"%>
<%@ page import="membership.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// 로그인 폼으로부터 받은 아이디와 패스워드
String userId = request.getParameter("user_id"); 
String userPwd = request.getParameter("user_pw");  

// web.xml에서 가져온 데이터베이스 연결 정보
String oracleDriver = application.getInitParameter("OracleDriver");
String oracleURL = application.getInitParameter("OracleURL");
String oracleId = application.getInitParameter("OracleId");
String oraclePwd = application.getInitParameter("OraclePwd");

// 회원 테이블 DAO를 통해 회원 정보 DTO 획득
MemberDAO dao = new MemberDAO(oracleDriver, oracleURL, oracleId, oraclePwd);
MemberDTO memberDTO = dao.getMemberDTO(userId, userPwd);
dao.close();

//로그인 성공 여부에 따른 처리
if (memberDTO.getId() != null) {
 	// 로그인 성공(성공시 로그인 할 때의 페이지 상태로 돌아가기)
	session.setAttribute("UserId", memberDTO.getId()); //아이디
	session.setAttribute("UserName", memberDTO.getName()); //실명
	session.setAttribute("Nik", memberDTO.getNik()); //닉네임
	response.sendRedirect("main.jsp");
}
else {
 // 로그인 실패 (현재 페이지 유지 하면서 오류메시지만 출력하기)
	request.setAttribute("LoginErrMsg", "로그인 오류입니다.");
	request.getRequestDispatcher("main.jsp").forward(request, response);
}

%>