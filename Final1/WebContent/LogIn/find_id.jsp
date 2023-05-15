<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" href="/Final/CSS/find_IDPW.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div style="height: 100px;"></div>
<article>
<div class="topArea">
		<div class="topInner">
			<h1 class="idSearch_title">아이디 찾기</h1>
		</div>
	</div>
	
	<div class="idPwdSearch_inner">
		<form>
			<ul class="login_form" style="display: flex;">
				<li class="idPwdSearch_on">
				<a href="<%=request.getContextPath() %>/LogIn/find_id.jsp">아이디 찾기</a>
				</li>
				<li class="idPwdSearch_off">
				<a href="<%=request.getContextPath() %>/LogIn/find_pw.jsp">비밀번호 찾기</a>
				</li>
			</ul>
			
			<div class="loginBox">
				<div class="userLogin">
					<p class="id_form">
						<label class="hidden">
							이름
						</label>
						<input type="text" name="user_name" id="uid_name"><br>
					</p>
					<p class="id_form">
						<label class="hidden">
							생년월일
						</label>
						<input type="date" name="user_birth" id="uid_birth"><br>
					</p>
					<p class="id_form1">
					    <label class="hidden">
					        성별
					    </label>
					    <span class="gender-container">
					        남자 <input type="radio" name="user_gender" id="uid_gender_m" value="M" checked/>
					        여자 <input type="radio" name="user_gender" id="uid_gender_f" value="F" />
					    </span>
					</p>
					<button class="findId_button" type="button" onclick="findID()">아이디찾기</button>
				</div>
			</div>
		</form>
	</div>
</article>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/findID.js"></script>
</body>
</html>