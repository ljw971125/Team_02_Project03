<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="./showRate.jsp" %>
<%@ page import="room.*" %>
<%@ page import="reviewPage.*"%>
<%@ page import="java.util.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ReviewDAO dao3 = new ReviewDAO(application);
	float rate101 = dao3.getRate(101);
	
	ReviewDAO dao4 = new ReviewDAO(application);
	float rate102 = dao4.getRate(102);
	
	ReviewDAO dao5 = new ReviewDAO(application);
	float rate103 = dao5.getRate(103);
	
	// index.jsp에서 읽어온 방번호
    String room1 = request.getParameter("room");
	//out.print(room1); // 읽어온 방번호 값 출력해서 확인
	
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
<link rel="stylesheet" href="../css/review.css"/>
<link rel="stylesheet" type="text/css" href="/Final/CSS/detail.css">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<jsp:include page="/Common/header.jsp" />
<meta charset="UTF-8">
<title>상세보기</title>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>

<body>
<article>
	<div style="height: 100px;"></div>
	<%  if ("101".equals(room1)){
	%>
		<article>		
			<div class="image-container" style="float: left;">
		            <img src="/Final/Image/101호.jpg" width="900px" height="500px">
            </div>
            <div style="float: left;">
	    	<% for (RoomDTO room : roomList101) { %>
	            <p id="text-101">회의실 방번호 <%= room.getNum() %>호</p>
	            <p id="text-101">회의실 평수 : <%= room.getArea() %>대</p>
	            <p id="text-101">수용가능인원 : <%= room.getCapacity() %>명</p>
	            <p id="text-101">에어컨 갯수: <%= room.getAirConditioner() %>개</p>
	            <p id="text-101">컴퓨터 갯수: <%= room.getComputer() %>개</p>
	            <p id="text-101">화이트보드 갯수: <%= room.getWhiteboard() %>개</p>
	            <p id="text-101">wi-fi 유뮤 : <%= room.getWifi() %></p>
	            <p id="text-101">시간당 가격 : <%= room.getPrice()%>원</p>
				<button onclick="location.href='<%=request.getContextPath() %>/Reservation/MUFReservation.jsp'">101호 예약</button> 
				<button onclick="location.href='<%=request.getContextPath() %>/Review/review.jsp?room=101'">리뷰</button><br><br>          
	        <% } %>
	        </div>
	        <div style="clear: both;">
	        <div style="height: 30px;"></div>
				<ul class="bxslider">
					<li>
						<a href="#"><img src="/Final/Image/101호.jpg" alt="" title="101호" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/의자.jpg" alt="" title="101호" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/냉장고.jpg" alt="" title="101호" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/에어컨.jpg" alt="" title="102호" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/책상.jpg" alt="" title="103호" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/컴퓨터.jpg" alt="" title="103호" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/WB.jpg" alt="" title="103호" width="100px" height="100px"></a>
					</li>
				</ul>
	        </div>
	        <div style="height: 30px;"></div>
		    	<div style="width: 400px; margin-left: 50px">
					<canvas id="myChart"></canvas>
					<p>평균 평점(5점만점)</p>
					<p>101호 평점 : <%= getStars(rate101) %></p>
				</div>
					<script>
					
					let rate101 = <%= rate101 %>;
					let rate102 = <%= rate102 %>;
					let rate103 = <%= rate103 %>;
					
					// Chart.js의 원 그래프 형식에 맞게 데이터를 구성합니다.
					let data = {
					    labels: ['101호', '102호', '103호'],
					    datasets: [{
					        label: 'Rate Average',
					        data: [rate101, rate102, rate103 ],
					        backgroundColor: [
					            'rgba(255, 99, 132, 0.2)',
					            'rgba(54, 162, 235, 0.2)',
					            'rgba(192, 244, 52, 0.2)',
					        ],
					        borderColor: [
					            'rgba(255, 99, 132, 1)',
					            'rgba(54, 162, 235, 1)',
					            'rgba(192, 244, 52, 1)',
					        ],
					        borderWidth: 1
					    }]
					};
					
					// 차트를 생성합니다.
					let ctx = document.getElementById('myChart').getContext('2d');
					let myChart = new Chart(ctx, {
					    type: 'pie',
					    data: data
					});
					
					</script>
		</article>
	<% 
	}else if ("102".equals(room1)){
	%>
		<article>		
			<div class="image-container" style="float: left;">
		            <img src="/Final/Image/102호.jpg" width="900px" height="500px">
            </div>
            <div style="float: left;">
	    	<% for (RoomDTO room : roomList102) { %>
	            <p id="text-102">회의실 방번호 <%= room.getNum() %>호</p>
	            <p id="text-102">회의실 평수 : <%= room.getArea() %>대</p>
	            <p id="text-102">수용가능인원 : <%= room.getCapacity() %>명</p>
	            <p id="text-102">에어컨 갯수: <%= room.getAirConditioner() %>개</p>
	            <p id="text-102">컴퓨터 갯수: <%= room.getComputer() %>개</p>
	            <p id="text-102">화이트보드 갯수: <%= room.getWhiteboard() %>개</p>
	            <p id="text-102">wi-fi 유뮤 : <%= room.getWifi() %></p>
	            <p id="text-102">시간당 가격 : <%= room.getPrice()%>원</p>
				<button onclick="location.href='<%=request.getContextPath() %>/reservation'">102호 예약</button>     
				<button onclick="location.href='<%=request.getContextPath() %>/Review/review.jsp?room=102'">리뷰</button><br><br>              
	        <% } %>
	        </div>
	        <div style="clear: both;">
	        <div style="height: 30px;"></div>
				<ul class="bxslider">
					<li>
						<a href="#"><img src="/Final/Image/102호.jpg" alt="" title="102호" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/의자.jpg" alt="" title="의자" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/냉장고.jpg" alt="" title="냉장고" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/에어컨.jpg" alt="" title="에어컨" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/책상.jpg" alt="" title="책상" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/컴퓨터.jpg" alt="" title="컴퓨터" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/WB.jpg" alt="" title="화이트보드" width="100px" height="100px"></a>
					</li>
				</ul>
	        </div>
		        <div style="width: 400px; margin-left: 50px">
					<canvas id="myChart"></canvas>
					<p>평균 평점(5점만점)</p>
					<p>102호 평점 : <%= getStars(rate102) %></p>
				</div>
					<script>
					
					let rate101 = <%= rate101 %>;
					let rate102 = <%= rate102 %>;
					let rate103 = <%= rate103 %>;
					
					// Chart.js의 원 그래프 형식에 맞게 데이터를 구성합니다.
					let data = {
						labels: ['101호', '102호', '103호'],
					    datasets: [{
					        label: 'Rate Average',
					        data: [rate101, rate102, rate103 ],
					        backgroundColor: [
					            'rgba(255, 99, 132, 0.2)',
					            'rgba(54, 162, 235, 0.2)',
					            'rgba(192, 244, 52, 0.2)',
					        ],
					        borderColor: [
					            'rgba(255, 99, 132, 1)',
					            'rgba(54, 162, 235, 1)',
					            'rgba(192, 244, 52, 1)',
					        ],
					        borderWidth: 1
					    }]
					};
					
					// 차트를 생성합니다.
					let ctx = document.getElementById('myChart').getContext('2d');
					let myChart = new Chart(ctx, {
					    type: 'pie',
					    data: data
					});
					
					</script>
		</article>
	<%
	}else{
	%>
				<article>		
			<div class="image-container" style="float: left;">
		            <img src="/Final/Image/103호.jpg" width="900px" height="500px">
            </div>
            <div style="float: left;">
	    	<% for (RoomDTO room : roomList103) { %>
	            <p id="text-101">회의실 방번호 <%= room.getNum() %>호</p>
	            <p id="text-101">회의실 평수 : <%= room.getArea() %>대</p>
	            <p id="text-101">수용가능인원 : <%= room.getCapacity() %>명</p>
	            <p id="text-101">에어컨 갯수: <%= room.getAirConditioner() %>개</p>
	            <p id="text-101">컴퓨터 갯수: <%= room.getComputer() %>개</p>
	            <p id="text-101">화이트보드 갯수: <%= room.getWhiteboard() %>개</p>
	            <p id="text-101">wi-fi 유뮤 : <%= room.getWifi() %></p>
	            <p id="text-101">시간당 가격 : <%= room.getPrice()%>원</p>
				<button onclick="location.href='<%=request.getContextPath() %>/reservation'">103호 예약</button>        
				<button onclick="location.href='<%=request.getContextPath() %>/Review/review.jsp?room=103'">리뷰</button><br><br>            
	        <% } %>
	        </div>
	        <div style="clear: both;">
	        <div style="height: 30px;"></div>
				<ul class="bxslider">
					<li>
						<a href="#"><img src="/Final/Image/103호.jpg" alt="" title="103호" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/의자.jpg" alt="" title="의자" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/냉장고.jpg" alt="" title="냉장고" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/에어컨.jpg" alt="" title="에어컨" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/책상.jpg" alt="" title="책상" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/컴퓨터.jpg" alt="" title="컴퓨터" width="100px" height="100px"></a>
					</li>
					<li>
						<a href="#"><img src="/Final/Image/WB.jpg" alt="" title="화이트보드" width="100px" height="100px"></a>
					</li>
				</ul>
	        </div>
		        <div style="width: 400px; margin-left: 50px">
					<canvas id="myChart"></canvas>
					<p>평균 평점(5점만점)</p>
					<p>103호 평점 : <%= getStars(rate103) %></p>
				</div>
					<script>
					
					let rate101 = <%= rate101 %>;
					let rate102 = <%= rate102 %>;
					let rate103 = <%= rate103 %>;
					
					// Chart.js의 원 그래프 형식에 맞게 데이터를 구성합니다.
					let data = {
						labels: ['101호', '102호', '103호'],
					    datasets: [{
					        label: 'Rate Average',
					        data: [rate101, rate102, rate103 ],
					        backgroundColor: [
					            'rgba(255, 99, 132, 0.2)',
					            'rgba(54, 162, 235, 0.2)',
					            'rgba(192, 244, 52, 0.2)',
					        ],
					        borderColor: [
					            'rgba(255, 99, 132, 1)',
					            'rgba(54, 162, 235, 1)',
					            'rgba(192, 244, 52, 1)',
					        ],
					        borderWidth: 1
					    }]
					};
					
					// 차트를 생성합니다.
					let ctx = document.getElementById('myChart').getContext('2d');
					let myChart = new Chart(ctx, {
					    type: 'pie',
					    data: data
					});
					
					</script>
	
			
					
		</article>

	<%
		}
	%>
</article>
<br>
</br>
<c:forEach items="${DetailReview}" var="n">
	<div class="card" style="width: 50rem; border: 1px solid black; margin: 0 auto;">
	  <div class="card-body">
	    <h5 class="card-title">${ n.nik }</h5>
	    <h6 class="card-subtitle mb-2 text-muted">------------</h6>
	    <p class="card-text">${n.recontent}</p>
	  </div>
	</div>
	<br>
	</br>
</c:forEach>
<script src="/Final/js/main.js"></script> 
</body>
<footer>
	<jsp:include page="/Common/afooter.jsp" />
</footer> 
</html> 