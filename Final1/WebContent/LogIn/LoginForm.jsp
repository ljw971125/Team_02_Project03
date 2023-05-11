<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Final1/Style/LoginForm.css">
<title>로그인폼</title>
<div id="login-form">
<span style="color: red; font-size: 1.2em;"> 
        <%= request.getAttribute("LoginErrMsg") == null ?
                "" : request.getAttribute("LoginErrMsg") %>
</span>
 <%
 if (session.getAttribute("UserId") == null) {  // 로그인 상태 확인
     // 로그아웃 상태
 %>
 <script>
 function validateForm(form) {
     if (!form.user_id.value) {
         alert("아이디를 입력하세요.");
         return false;
     }
     if (form.user_pw.value == "") {
         alert("패스워드를 입력하세요.");
         return false;
     }
 }
 </script>
 <div>
<form action="/Final1/LogIn/LoginProcess.jsp" method="post" name="loginFrm" onsubmit="return validateForm(this);">
   <input type="text" name="user_id" id="user_id" placeholder="아이디"><br>
   <input type="password" name="user_pw" id="user_pw" placeholder="비밀번호"><br>
   <input type="submit" value="로그인">
</form>
</div>
<div>
<a href="/Final1/LogIn/register.jsp">회원가입</a> | <a href="/Final1/LogIn/find_id_pw.jsp">id/pw찾기</a>
</div>
<%
} else { // 로그인된 상태
%>
    <%= session.getAttribute("UserName") %> 회원님, 로그인하셨습니다.<br />
    <a href="/Final1/LogIn/Logout.jsp">[로그아웃]</a>
<%
}
%>
</div>
</head>
<body>
</body>
</html>