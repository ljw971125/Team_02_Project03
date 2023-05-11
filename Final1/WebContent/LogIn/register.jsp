<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/Final1/Style/joinform.css">
<title>회원가입</title>
</head>
<body>
<div style="height: 220px;"></div>

<article>
<form action="memberJoin.jsp" method="post" onsubmit="return validateForm()">
	
	<div class="form-group">
	<label for="name">이름</label>
	<input type="text" name="name" id="name">
	</div>
	
	<div class="form-group">
	<label for="id">ID</label>
	<input type="text" name="id" id="id">
	<button class="check-button" type="button" onclick="checkDuplicate()">중복체크</button>
	</div>
	
	<div class="form-group">
	<label for="pw">PASS</label>
	<input type="text" name="pw" id="pw">
	</div>
	
	<div class="form-group">
	<label for="nik">닉네임</label>
	<input type="text" name="nik" id="nik">
	<button class="check-button" type="button" onclick="checkDuplicate1()">중복체크</button>
	</div>
	
	
	<div class="form-group">
	<label for="birth">생년월일</label>
	<input type="date" name="birth" id="birth">
	</div>
	
	<div class="form-group">
	<label for="gender">성별</label>
	    <input type="radio" name="gender" id="gender_m" value="M" checked/>남자 
	    <input type="radio" name="gender" id="gender_f" value="F" />여자  
	</div>
	
	<div class="form-group">
	<label for="phone">핸드폰</label>
	<input type="text" name="phone" id="phone">
	</div>
	
	<div class="form-group">
	<label for="adr">주소</label>
	<input type="text" name="adr" id="adr">
	</div>
	
	<div class="form-group">
	<label for="jdate">가입날짜</label>
	<input type="date" name="jdate" id="jdate">
	</div>

    <div class="form-group">
    	<button type="button" class="back" onclick="location.href='/Final1/index.jsp'">돌아가기</button>
        <input type="submit" value="가입하기">
    </div>
</form>
</article>

<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/register.js"></script> 
<script src="/Final1/js/header.js"></script> 
</body>
</html>