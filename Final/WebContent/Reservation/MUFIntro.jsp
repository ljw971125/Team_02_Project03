<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ page import="room.*" %>
<%@ page import="java.util.*" %>
<%
	String drv = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pw = application.getInitParameter("OraclePwd");
    RoomDAO dao = new RoomDAO(drv, url, id, pw);
    ArrayList<RoomDTO> roomList101 = dao.getList(101);
    
    RoomDAO dao1 = new RoomDAO(drv, url, id, pw);
    ArrayList<RoomDTO> roomList102 = dao1.getList(102);
    
    RoomDAO dao2 = new RoomDAO(drv, url, id, pw);
    ArrayList<RoomDTO> roomList103 = dao2.getList(103);
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Final1/Style/main.css">
<jsp:include page="../Common/header.jsp" />
<meta charset="UTF-8">
<title>회의실 예약</title>
</head>

<body>

<div style="height: 230px;"></div>

<article>
    <div class="image-container">
        <a href="/Final1/Reservation/MUFReservation.jsp?room=101">
            <img src="/Final1/Image/101호.jpg" width="600" height="300">
        </a>
    </div>
    <div class="edit-container">
    	<% for (RoomDTO room : roomList101) { %>
            <p id="text-101">회의실 방번호 <%= room.getNum() %>호</p>
            <p id="text-101">회의실 평수 : <%= room.getArea() %>대</p>
            <p id="text-101">수용가능인원 : <%= room.getCapacity() %>명</p>
            <p id="text-101">에어컨 갯수: <%= room.getAirConditioner() %>개</p>
            <p id="text-101">컴퓨터 갯수: <%= room.getComputer() %>개</p>
            <p id="text-101">화이트보드 갯수: <%= room.getWhiteboard() %>개</p>
            <p id="text-101">wi-fi 유뮤 : <%= room.getWifi() %></p>
            <p id="text-101">시간당 가격 : <%= room.getPrice()%>원</p>
            
        <% } %>
    </div>
</article>

<div style="height: 20px;"></div>

<article>
    <div class="image-container">
        <a href="/Final1/Reservation/MUFReservation.jsp?room=102">
            <img src="/Final1/Image/102호.jpg" width="600" height="300">
        </a>
    </div>
    <div class="edit-container">
        <% for (RoomDTO room : roomList102) { %>
            <p id="text-102">회의실 방번호 <%= room.getNum() %>호</p>
            <p id="text-102">회의실 평수 : <%= room.getArea() %>대</p>
            <p id="text-102">수용가능인원 : <%= room.getCapacity() %>명</p>
            <p id="text-102">에어컨 갯수: <%= room.getAirConditioner() %>개</p>
            <p id="text-102">컴퓨터 갯수: <%= room.getComputer() %>개</p>
            <p id="text-102">화이트보드 갯수: <%= room.getWhiteboard() %>개</p>
            <p id="text-102">wi-fi 유뮤 : <%= room.getWifi() %></p>
            <p id="text-102">시간당 가격 : <%= room.getPrice()%>원</p>      
        <% } %>
    </div>
</article>

<div style="height: 20px;"></div>

<article>
    <div class="image-container">
        <a href="//Final1/Reservation/MUFReservation.jsp?room=103">
            <img src="/Final1/Image/103호.jpg" width="600" height="300">
        </a>
    </div>
    <div class="edit-container">
	<% for (RoomDTO room2 : roomList103) { %>
            <p id="text-103">회의실 방번호 <%= room2.getNum() %>호</p>
            <p id="text-103">회의실 평수 : <%= room2.getArea() %>대</p>
            <p id="text-103">수용가능인원 : <%= room2.getCapacity() %>명</p>
            <p id="text-103">에어컨 갯수: <%= room2.getAirConditioner() %>개</p>
            <p id="text-103">컴퓨터 갯수: <%= room2.getComputer() %>개</p>
            <p id="text-103">화이트보드 갯수: <%= room2.getWhiteboard() %>개</p>
            <p id="text-103">wi-fi 유뮤 : <%= room2.getWifi() %></p>
            <p id="text-103">시간당 가격 : <%= room2.getPrice()%>원</p>          
        <% } %>
    </div>
</article>

<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
</body> 
</html> 