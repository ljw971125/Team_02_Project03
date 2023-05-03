<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Common/Link.jsp" />
<link rel="stylesheet" type="text/css" href="../Style/main.css">
<meta charset="UTF-8">
<title>회의실 예약시스템</title>
</head>

<body>

<div style="height: 200px;"></div>

<div class="image-container">
    <a href="../Conference/meeting.jsp?room=201">
        <img src="../Image/201호.jpg" width="600" height="300">
    </a>
</div>
<div class="edit-container">
    <p id="text-201">- 201호 -</p>
    <p id="text-201">에어컨 : 2대</p>
    <p id="text-201">의자 : 10개</p>
    <p id="text-201">냉장고 : o</p>
    <button id="edit-201">수정</button>
</div>

<div style="height: 20px;"></div>

<div class="image-container">
    <a href="../Conference/meeting.jsp?room=202">
        <img src="../Image/202호.jpg" width="600" height="300">
    </a>
</div>
<div class="edit-container">
    <p id="text-202">- 202호 -</p>
    <p id="text-202">에어컨 : 1대</p>
    <p id="text-202">의자 : 8개</p>
    <p id="text-202">냉장고 : o</p>
    <button id="edit-202">수정</button>
</div>

<div style="height: 20px;"></div>

<div class="image-container">
    <a href="../Conference/meeting.jsp?room=203">
        <img src="../Image/203호.jpg" width="600" height="300">
    </a>
</div>
<div class="edit-container">
    <p id="text-203">- 203호 -</p>
    <p id="text-203">에어컨 : 2대</p>
    <p id="text-203">의자 : 7개</p>
    <p id="text-203">냉장고 : o</p>
    <button id="edit-203">수정</button>
</div>

<div style="height: 20px;"></div>

<footer>
    담당자 : 장기헌<br>
    팀원 : 김민수 이지운 장윤종 전장현
    대표 연락처 : 010-1234-5678<br>
    (주)프로젝트2팀
  
</footer>
<script src="../Common/ex.js"></script>
</body>
</html> 