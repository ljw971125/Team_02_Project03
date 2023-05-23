<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/Final/CSS/register.css">
<title>회원가입</title>
</head>
<body>
<div style="height: 100px;"></div>

<article>
<form action="/Final/LogIn/memberJoin.jsp" method="post">
    <div class="container">
	    <div class="insert">
	    	<table>
			    <caption><h2>회원가입</h2></caption>
			    <tr>
			        <td class="col1">이름</td>
			        <td class="col2"><input type="text" name="name" id="name" maxlength="5"></td>
			    </tr>
			    <tr>
			        <td class="col1">아이디</td>
			        <td class="col2">
			            <input type="text" name="id" id="id" maxlength="10">
			            <input class='but1' type="button" value="중복확인" onclick="checkDuplicate()">
			        </td>
			    </tr>
			    <tr>
			        <td class="col1">비밀번호</td>
			        <td class="col2">
			            <input type="password" name="pw" id="pw" maxlength="16">
			        </td>
			    </tr>
			    <tr>
			        <td class="col1">닉네임</td>
			        <td class="col2">
			        	<input type="text" name="nik" id="nik" maxlength="5">
			        	<input class='but1' type="button" value="중복확인" onclick="checkDuplicate1()">
			        </td>
			    </tr>
			    <tr>
			        <td class="col1">생년월일</td>
			        <td class="col2">
			            <input type="date" name="birth" id="birth">
			        </td>
			    </tr>
			    <tr>
			        <td class="col1">성별</td>
			        <td class="col2">
			        	<input type="radio" name="gender" id="gender_m" value="M" checked/>남자 
				    	<input type="radio" name="gender" id="gender_f" value="F" />여자 
			        </td>
			    </tr>
			    <tr>
			        <td class="col1">핸드폰</td>
			        <td class="col2">
			        	<input type="text" name="phone" id="phone">
			        </td>
			    </tr>
			    <tr>
			        <td class="col1">주소</td>
			        <td class="col2">
						<input type="text" name="adr" id="adr">
			        </td>
			    </tr>
	    </table>
	  </div>
	 
	  <div class="create">
	        <input class="but3" type="button" value="돌아가기" onclick="location.href='/Final/Login.do'">
	        <input class="but4" type="submit" value="가입하기" onclick="return validateForm()">
	  </div>
  </div>
  </form>
</article>

<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final/js/register.js"></script> 
</body>
</html>