<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Final1/Style/main.css">
<jsp:include page="Common/header.jsp" />
<meta charset="UTF-8">
</head>

<body>

<aside>
    <jsp:include page="/LogIn/LoginForm.jsp" />
</aside>

<div style="height: 200px;"></div>

<article>
    <div class="image-container">
        <a href="/Final1/Conference/meeting.jsp?room=101">
            <img src="/Final1/Image/101호.jpg" width="600" height="300">
        </a>
    </div>
    <div class="edit-container">
        <p id="text-101">- 101호 -</p>
        <p id="text-101">에어컨 : 2대</p>
        <p id="text-101">의자 : 10개</p>
        <p id="text-101">냉장고 : o</p>
        <button id="edit-101">수정</button>
    </div>
</article>

<div style="height: 20px;"></div>

<article>
    <div class="image-container">
        <a href="/Final1/Conference/meeting.jsp?room=102">
            <img src="Image/102호.jpg" width="600" height="300">
        </a>
    </div>
    <div class="edit-container">
        <p id="text-102">- 102호 -</p>
        <p id="text-102">에어컨 : 1대</p>
        <p id="text-102">의자 : 8개</p>
        <p id="text-102">냉장고 : o</p>
        <button id="edit-102">수정</button>
    </div>
</article>

<div style="height: 20px;"></div>

<article>
    <div class="image-container">
        <a href="/Final1/Conference/meeting.jsp?room=103">
            <img src="/Final1/Image/103호.jpg" width="600" height="300">
        </a>
    </div>
    <div class="edit-container">
        <p id="text-103">- 103호 -</p>
        <p id="text-103">에어컨 : 2대</p>
        <p id="text-103">의자 : 7개</p>
        <p id="text-103">냉장고 : o</p>
        <button id="edit-103">수정</button>
    </div>
</article>

<div style="height: 20px;"></div>

<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/Common/about_text.js"></script>
<script src="/Final1/Common/link.js"></script> 
</body> 
</html> 