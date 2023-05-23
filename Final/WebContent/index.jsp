<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="room.*" %>
<%@ page import="java.util.*" %>

<%
	// index.jsp에서 읽어온 방번호
    String room1 = request.getParameter("room");
	//out.print(room1); // 읽어온 방번호 값 출력해서 확인
	
	String drv = application.getInitParameter("OracleDriver");
	String url = application.getInitParameter("OracleURL");
	String id = application.getInitParameter("OracleId");
	String pw = application.getInitParameter("OraclePwd");
	
    RoomDAO dao = new RoomDAO(drv, url, id, pw);
    ArrayList<RoomDTO> roomList101 = dao.getList(101);
    ArrayList<RoomDTO> roomList102 = dao.getList(102);
    ArrayList<RoomDTO> roomList103 = dao.getList(103);
%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="/Common/header.jsp" />
<link rel="stylesheet" type="text/css" href="/Final/CSS/main.css">
<meta charset="UTF-8">
<title>메인</title>
</head>
<body>
<div style="height: 100px;"></div>
<article>
	<a href="#"><img src="Image/main.png" alt="" title="101호" width=100% height="10%"></a>
</article>
<article>
	<div class="container">
   			<div class="image-container">
	           	<img src="/Final/Image/101호.jpg" width="500px" height="400px">
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
						<button onclick="location.href='<%=request.getContextPath() %>/Detail/detail.jsp?room=101'">101호상세</button><br><br>

			        <% } %>
		        </div>
		    </div>
   			<div class="image-container">
	           	<img src="/Final/Image/102호.jpg" width="500px" height="400px">
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
						<button onclick="location.href='<%=request.getContextPath() %>/Detail/detail.jsp?room=102'">102호상세</button><br><br>                
			        <% } %>
			    </div>
			</div>
   			<div class="image-container">
	           	<img src="/Final/Image/103호.jpg" width="500px" height="400px">
			    <div class="edit-container">
				<% for (RoomDTO room : roomList103) { %>
			            <p id="text-103">회의실 방번호 <%= room.getNum() %>호</p>
			            <p id="text-103">회의실 평수 : <%= room.getArea() %>대</p>
			            <p id="text-103">수용가능인원 : <%= room.getCapacity() %>명</p>
			            <p id="text-103">에어컨 갯수: <%= room.getAirConditioner() %>개</p>
			            <p id="text-103">컴퓨터 갯수: <%= room.getComputer() %>개</p>
			            <p id="text-103">화이트보드 갯수: <%= room.getWhiteboard() %>개</p>
			            <p id="text-103">wi-fi 유뮤 : <%= room.getWifi() %></p>
			            <p id="text-103">시간당 가격 : <%= room.getPrice()%>원</p>
						<button onclick="location.href='<%=request.getContextPath() %>/Detail/detail.jsp?room=103'">103호상세</button><br><br>                      
			        <% } %>
			    </div>
			</div>
	</div>
</article>
<div style="height: 30px;"></div>
<%
	dao.close();
%>
</body>
<footer>
	<jsp:include page="/Common/afooter.jsp" />
</footer>
</html>