<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/Final1/Style/find_id_pw.css">
<title>ID/PW찾기</title>
<body>
<div style="height: 200px;"></div>

<article id="IDform">
  <form>
    <h2>아이디 찾기 폼</h2>
	<br><br><br>
    <div class="form-group">
      <label for="user_name"">이름</label>
      <input type="text" name="user_name" id="uid_name"><br>
    </div>
    <div class="form-group">
      <label for="user_birth">생년월일</label>
      <input type="date" name="user_birth" id="uid_birth"><br>
    </div>
   	<div class="form-group">
		<label for="user_gender">성별</label>
	    <input type="radio" name="user_gender" id="uid_gender_m" value="M" checked/>남자 
	    <input type="radio" name="user_gender" id="uid_gender_f" value="F" />여자  
	</div>
    <div class="form-group1">
      <button type="button" class="back" onclick="location.href='/Final1/index.jsp'">돌아가기</button>
      <button class="findId_button" type="button" onclick="findID()">아이디찾기</button>
    </div>
  </form>
</article>

<article id="PWform">
	<h2>비밀번호 찾기 폼</h2>
	<br><br><br>
	<form>
		<div class="form-group">
			<label for="name">이름</label>
			<input type="text" name="user1_name" id="upw_name"><br>
		</div>
		<div class="form-group">
			<label for="birth">생년월일</label>
			<input type="date" name="user1_birth" id="upw_birth"><br>
		</div>
		<div class="form-group">
			<label for="gender">성별</label>
			<input type="radio" name="user1_gender" id="upw_gender_m" value="M" checked/>남자 
			<input type="radio" name="user1_gender" id="upw_gender_f" value="F" />여자  
		</div>
		<div class="form-group">
			<label for="id">아이디</label>
			<input type="text" name="user1_id" id="upw_id"><br>
		</div>
		<div class="form-group1">
			<button type="button" class="back" onclick="location.href='/Final1/index.jsp'">돌아가기</button>
			<button class="findPw_button" type="button" onclick="findPW()">비밀번호찾기</button>
		</div>
	</form>
</article>
<div style="height: 200px;"></div>
<div style="height: 200px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
<script src="/Final1/js/findID.js"></script>
</body>
</html>