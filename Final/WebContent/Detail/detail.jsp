<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="./showRate.jsp"%>
<%@ page import="room.*"%>
<%@ page import="reviewPage.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.lang.*"%>]\
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>



<%
	ReviewDAO dao1 = new ReviewDAO(application);
float rate101 = dao1.getRate(101);
float rate102 = dao1.getRate(102);
float rate103 = dao1.getRate(103);

ReviewDAO dao2 = new ReviewDAO(application);
int rate101_1 = dao2.getRate5(101, 1);
int rate101_2 = dao2.getRate5(101, 2);
int rate101_3 = dao2.getRate5(101, 3);
int rate101_4 = dao2.getRate5(101, 4);
int rate101_5 = dao2.getRate5(101, 5);

int rate102_1 = dao2.getRate5(102, 1);
int rate102_2 = dao2.getRate5(102, 2);
int rate102_3 = dao2.getRate5(102, 3);
int rate102_4 = dao2.getRate5(102, 4);
int rate102_5 = dao2.getRate5(102, 5);

int rate103_1 = dao2.getRate5(103, 1);
int rate103_2 = dao2.getRate5(103, 2);
int rate103_3 = dao2.getRate5(103, 3);
int rate103_4 = dao2.getRate5(103, 4);
int rate103_5 = dao2.getRate5(103, 5);

//int room2 = Integer.parseInt(request.getParameter("room"));

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

String roomParam = request.getParameter("room");
int room2 = 0;
if (roomParam != null) {
	room2 = Integer.parseInt(roomParam);
} else {
}
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Final/CSS/detail.css">
<link rel="stylesheet" type="text/css" href="/Final/CSS/review.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<jsp:include page="/Common/header.jsp" />
<meta charset="UTF-8">
<title><%=room1%>호 상세보기</title>
<script src="https://cdn.jsdelivr.net/npm/chart.js@2"></script>


</head>

<body>
	<article>

		<div style="height: 100px;"></div>

		<%
			if ("101".equals(room1)) {
		%>
		<article>
			<div class="image-container" style="float: left;">
				<img src="/Final/Image/101.jpg" width="900px" height="500px">
			</div>
			<div style="float: left;">
				<p class="sub_text_tit_type01" style="font-weight: 700;">시설안내</p>
				<%
					for (RoomDTO room : roomList101) {
				%>
				<p id="text-101">
					회의실 방번호
					<%=room.getNum()%>호
				</p>
				<p id="text-101">
					회의실 평수 :
					<%=room.getArea()%>대
				</p>
				<p id="text-101">
					수용가능인원 :
					<%=room.getCapacity()%>명
				</p>
				<p id="text-101">
					에어컨 갯수:
					<%=room.getAirConditioner()%>개
				</p>
				<p id="text-101">
					컴퓨터 갯수:
					<%=room.getComputer()%>개
				</p>
				<p id="text-101">
					화이트보드 갯수:
					<%=room.getWhiteboard()%>개
				</p>
				<p id="text-101">
					wi-fi 유뮤 :
					<%=room.getWifi()%></p>
				<p id="text-101">
					시간당 가격 :
					<%=room.getPrice()%>원
				</p>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Reservation/MUFReservation.jsp?room=101&price=15000'">101호
					예약</button>
				<br> <br>
				<%
					}
				%>
			</div>
			<div style="clear: both;">
				<div style="height: 30px;"></div>
				<ul class="bxslider">
					<li><a href="#"><img src="/Final/Image/101.jpg" alt=""
							title="101호" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/chair.jpg" alt=""
							title="101호" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/refri.jpg" alt=""
							title="101호" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/aircon.jpg" alt=""
							title="102호" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/chair.jpg" alt=""
							title="103호" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/com.jpg" alt=""
							title="103호" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/WB.jpg" alt=""
							title="103호" width="100px" height="100px"></a></li>
				</ul>
			</div>
			<div style="text-align: center;">
				<p class="sub_text_tit_type01" style="font-weight: 700;">평점</p>
			</div>

			<div style="height: 30px; display: flex; text-align: center;">
			    	<div style="width: 800px; margin-left: 50px; height:600px; ">
						<canvas id="myChart" style="margin-bottom: 40px;"></canvas>
						<p>평균 평점(5점만점)</p>
						<p>101호 평점 : <%= getStars(rate101) %>(<%= String.format("%.1f", rate101) %>)</p>
					</div>
					<script>
					
					let rate101 = <%= rate101 %>;
					let rate102 = <%= rate102 %>;
					let rate103 = <%= rate103 %>;
					
					let total = rate101 + rate102 + rate103;
								

					// 데이터를 백분율로 변환하고 소수점 둘째 자리까지 나타냅니다.
					let percent101 = Math.round(((rate101 / total) * 100) * 100) / 100;
					let percent102 = Math.round(((rate102 / total) * 100) * 100) / 100;
					let percent103 = Math.round(((rate103 / total) * 100) * 100) / 100;

					// Chart.js의 원 그래프 형식에 맞게 데이터를 구성합니다.
					let data = {
					    labels: ['101호', '102호', '103호'],
					    datasets: [{
					        label: 'Rate Average',
					        data: [percent101, percent102, percent103 ],
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
					    data: data,
					    options: {
					        tooltips: {
					            callbacks: {
					                label: function(tooltipItem, data) {
					                    let label = data.labels[tooltipItem.index];
					                    let value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					                    return label + ': ' + value + '%';
					                }
					            }
					        },
					        layout:{
					        	padding:{
					        		top: 30
					        	}
					        },
					    }
					});
					
					</script>
					<div style="width: 1000px; margin-left: 50px;">
						<canvas id="myChart1"></canvas>
					</div>		
					<script>
					var ctx1 = document.getElementById('myChart1').getContext('2d');
					var myChart1 = new Chart(ctx1, {
					    type: 'horizontalBar',
					    data: {
					        labels: ['5', '4', '3', '2', '1'],
					        datasets: [{
					            label: ['5','4','3','2','1'],
					            data: [<%= rate101_5 %>, <%= rate101_4 %>, <%= rate101_3 %>, <%= rate101_2 %>, <%= rate101_1 %>],
					            backgroundColor: [
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)'
					            ],
					            borderColor: [
					                'rgba(255, 99, 132, 1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)'
					            ],          
					            borderWidth: 0
					        }]
					    },
					    options: {
					    	layout:{
					        	padding:{
					        		top: 100
					        	}
					        },
					    	legend: {
					    		labels:{
					    		generateLabels: function(chart) {
					                var data = chart.data;
					                if (data.labels.length && data.datasets.length) {
					                    return data.labels.map(function(label, i) {
					                        var meta = chart.getDatasetMeta(0);
					                        var style = meta.controller.getStyle(i);

					                        return {
					                            text: label+'점',
					                            fillStyle: style.backgroundColor,
					                            strokeStyle: style.borderColor,
					                            lineWidth: style.borderWidth,
					                            hidden: isNaN(data.datasets[0].data[i]) || meta.data[i].hidden,

					                            // Extra data used for toggling the correct item
					                            index: i
					                        };
					                    });
					                }
					                return [];
					            }
					    		},
					    	    onClick: function(e) {
					    	        e.stopPropagation();
					    	    }
					    	},
					        animation: {
					            onComplete: function() {
					                var chartInstance = this.chart;
					                var ctx = chartInstance.ctx;
					                ctx.textAlign = 'center';
					                ctx.textBaseline = 'bottom';
					                this.data.datasets.forEach(function(dataset, i) {
					                    var meta = chartInstance.controller.getDatasetMeta(i);
					                    meta.data.forEach(function(bar, index) {
					                        var data = dataset.data[index];
					                        ctx.fillText(data, bar._model.x+5, bar._model.y+10);
					                    });
					                });
					            }
					        },
					        scales: {
					            xAxes: [{
					                gridLines: {
					                    display: false
					                },
					                ticks: {
					                	
					                   	display: false,
					                   	max: Math.max(...[<%= rate101_5 %>, <%= rate101_4 %>, <%= rate101_3 %>, <%= rate101_2 %>, <%= rate101_1 %>]) + 5
					                }   
					            }],
					            yAxes: [{
					                gridLines: {
					                    display: false
					                },
					                ticks: {
					                	padding: 30,
					                    beginAtZero: true
					                }
					            }]
					        }
					    }
					});
				</script>
			</div>
		</article>
		<%
			} else if ("102".equals(room1)) {
		%>
		<article>
			<div class="image-container" style="float: left;">
				<img src="/Final/Image/102.jpg" width="900px" height="500px">
			</div>
			<div style="float: left;">
				<%
					for (RoomDTO room : roomList102) {
				%>
				<p id="text-102">
					회의실 방번호
					<%=room.getNum()%>호
				</p>
				<p id="text-102">
					회의실 평수 :
					<%=room.getArea()%>대
				</p>
				<p id="text-102">
					수용가능인원 :
					<%=room.getCapacity()%>명
				</p>
				<p id="text-102">
					에어컨 갯수:
					<%=room.getAirConditioner()%>개
				</p>
				<p id="text-102">
					컴퓨터 갯수:
					<%=room.getComputer()%>개
				</p>
				<p id="text-102">
					화이트보드 갯수:
					<%=room.getWhiteboard()%>개
				</p>
				<p id="text-102">
					wi-fi 유뮤 :
					<%=room.getWifi()%></p>
				<p id="text-102">
					시간당 가격 :
					<%=room.getPrice()%>원
				</p>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Reservation/MUFReservation.jsp?room=102&price=20000'">102호
					예약</button>
				<br> <br>
				<%
					}
				%>
			</div>
			<div style="clear: both;">
				<div style="height: 30px;"></div>
				<ul class="bxslider">
					<li><a href="#"><img src="/Final/Image/102.jpg" alt=""
							title="102호" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/chair.jpg" alt=""
							title="의자" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/refri.jpg" alt=""
							title="냉장고" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/aircon.jpg" alt=""
							title="에어컨" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/desk.jpg" alt=""
							title="책상" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/com.jpg" alt=""
							title="컴퓨터" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/WB.jpg" alt=""
							title="화이트보드" width="100px" height="100px"></a></li>
				</ul>
			</div>
			<div style="text-align: center;">
				<p class="sub_text_tit_type01" style="font-weight: 700;">평점</p>
			</div>
			<div style="height: 30px; display: flex; text-align: center;">
				<div style="width: 800px; margin-left: 50px">
					<canvas id="myChart" style="margin-bottom: 40px;"></canvas>
					<p>평균 평점(5점만점)</p>
					<p>102호 평점 : <%= getStars(rate102) %>(<%= String.format("%.1f", rate102) %>)</p>
				</div>
				<script>
					
					let rate101 = <%= rate101 %>;
					let rate102 = <%= rate102 %>;
					let rate103 = <%= rate103 %>;
					
					let total = rate101 + rate102 + rate103;
								

					// 데이터를 백분율로 변환하고 소수점 둘째 자리까지 나타냅니다.
					let percent101 = Math.round(((rate101 / total) * 100) * 100) / 100;
					let percent102 = Math.round(((rate102 / total) * 100) * 100) / 100;
					let percent103 = Math.round(((rate103 / total) * 100) * 100) / 100;

					// Chart.js의 원 그래프 형식에 맞게 데이터를 구성합니다.
					let data = {
					    labels: ['101호', '102호', '103호'],
					    datasets: [{
					        label: 'Rate Average',
					        data: [percent101, percent102, percent103 ],
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
					    data: data,
					    options: {
					        tooltips: {
					            callbacks: {
					                label: function(tooltipItem, data) {
					                    let label = data.labels[tooltipItem.index];
					                    let value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					                    return label + ': ' + value + '%';
					                }
					            }
					        },
					        layout:{
					        	padding:{
					        		top: 30
					        	}
					        },
					    }
					});
					
					</script>
					<div style="width: 1000px; margin-left: 50px;">
						<canvas id="myChart1"></canvas>
					</div>		
					<script>
					var ctx1 = document.getElementById('myChart1').getContext('2d');
					var myChart1 = new Chart(ctx1, {
					    type: 'horizontalBar',
					    data: {
					        labels: ['5', '4', '3', '2', '1'],
					        datasets: [{
					            label: ['5','4','3','2','1'],
					            data: [<%= rate102_5 %>, <%= rate102_4 %>, <%= rate102_3 %>, <%= rate102_2 %>, <%= rate102_1 %>],
					            backgroundColor: [
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)'
					            ],
					            borderColor: [
					                'rgba(255, 99, 132, 1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)'
					            ],          
					            borderWidth: 0
					        }]
					    },
					    options: {
					    	layout:{
					        	padding:{
					        		top: 100
					        	}
					        },
					    	legend: {
					    		labels:{
					    		generateLabels: function(chart) {
					                var data = chart.data;
					                if (data.labels.length && data.datasets.length) {
					                    return data.labels.map(function(label, i) {
					                        var meta = chart.getDatasetMeta(0);
					                        var style = meta.controller.getStyle(i);

					                        return {
					                            text: label+'점',
					                            fillStyle: style.backgroundColor,
					                            strokeStyle: style.borderColor,
					                            lineWidth: style.borderWidth,
					                            hidden: isNaN(data.datasets[0].data[i]) || meta.data[i].hidden,

					                            // Extra data used for toggling the correct item
					                            index: i
					                        };
					                    });
					                }
					                return [];
					            }
					    		},
					    	    onClick: function(e) {
					    	        e.stopPropagation();
					    	    }
					    	},
					        animation: {
					            onComplete: function() {
					                var chartInstance = this.chart;
					                var ctx = chartInstance.ctx;
					                ctx.textAlign = 'center';
					                ctx.textBaseline = 'bottom';
					                this.data.datasets.forEach(function(dataset, i) {
					                    var meta = chartInstance.controller.getDatasetMeta(i);
					                    meta.data.forEach(function(bar, index) {
					                        var data = dataset.data[index];
					                        ctx.fillText(data, bar._model.x+5, bar._model.y+10);
					                    });
					                });
					            }
					        },
					        scales: {
					            xAxes: [{
					                gridLines: {
					                    display: false
					                },
					                ticks: {
					                	
					                   	display: false,
					                   	max: Math.max(...[<%= rate102_5 %>, <%= rate102_4 %>, <%= rate102_3 %>, <%= rate102_2 %>, <%= rate102_1 %>]) + 5
					                }   
					            }],
					            yAxes: [{
					                gridLines: {
					                    display: false
					                },
					                ticks: {
					                	padding: 30,
					                    beginAtZero: true
					                }
					            }]
					        }
					    }
					});
				</script>
			</div>
		</article>
		<%
			} else {
		%>
		<article>
			<div class="image-container" style="float: left;">
				<img src="/Final/Image/103.jpg" width="900px" height="500px">
			</div>
			<div style="float: left;">
				<%
					for (RoomDTO room : roomList103) {
				%>
				<p id="text-103">
					회의실 방번호
					<%=room.getNum()%>호
				</p>
				<p id="text-103">
					회의실 평수 :
					<%=room.getArea()%>대
				</p>
				<p id="text-103">
					수용가능인원 :
					<%=room.getCapacity()%>명
				</p>
				<p id="text-103">
					에어컨 갯수:
					<%=room.getAirConditioner()%>개
				</p>
				<p id="text-103">
					컴퓨터 갯수:
					<%=room.getComputer()%>개
				</p>
				<p id="text-103">
					화이트보드 갯수:
					<%=room.getWhiteboard()%>개
				</p>
				<p id="text-103">
					wi-fi 유뮤 :
					<%=room.getWifi()%></p>
				<p id="text-103">
					시간당 가격 :
					<%=room.getPrice()%>원
				</p>
				<button
					onclick="location.href='<%=request.getContextPath()%>/Reservation/MUFReservation.jsp?room=103&price=17000'">103호
					예약</button>
				<br> <br>
				<%
					}
				%>
			</div>
			<div style="clear: both;">
				<div style="height: 30px;"></div>
				<ul class="bxslider">
					<li><a href="#"><img src="/Final/Image/103.jpg" alt=""
							title="103호" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/chair.jpg" alt=""
							title="의자" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/refri.jpg" alt=""
							title="냉장고" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/aircon.jpg" alt=""
							title="에어컨" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/desk.jpg" alt=""
							title="책상" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/com.jpg" alt=""
							title="컴퓨터" width="100px" height="100px"></a></li>
					<li><a href="#"><img src="/Final/Image/WB.jpg" alt=""
							title="화이트보드" width="100px" height="100px"></a></li>
				</ul>
			</div>
			<div style="text-align: center;">
				<p class="sub_text_tit_type01" style="font-weight: 700;">평점</p>
			</div>
			<div style="height: 30px; display: flex; text-align: center;">
				<div style="width: 800px; margin-left: 50px">
					<canvas id="myChart" style="margin-bottom: 40px;"></canvas>
					<p>평균 평점(5점만점)</p>
					<p>103호 평점 : <%= getStars(rate103) %>(<%= String.format("%.1f", rate103) %>)</p>
				</div>
				<script>
					
					let rate101 = <%= rate101 %>;
					let rate102 = <%= rate102 %>;
					let rate103 = <%= rate103 %>;
					
					let total = rate101 + rate102 + rate103;
								

					// 데이터를 백분율로 변환하고 소수점 둘째 자리까지 나타냅니다.
					let percent101 = Math.round(((rate101 / total) * 100) * 100) / 100;
					let percent102 = Math.round(((rate102 / total) * 100) * 100) / 100;
					let percent103 = Math.round(((rate103 / total) * 100) * 100) / 100;

					// Chart.js의 원 그래프 형식에 맞게 데이터를 구성합니다.
					let data = {
					    labels: ['101호', '102호', '103호'],
					    datasets: [{
					        label: 'Rate Average',
					        data: [percent101, percent102, percent103 ],
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
					    data: data,
					    options: {
					        tooltips: {
					            callbacks: {
					                label: function(tooltipItem, data) {
					                    let label = data.labels[tooltipItem.index];
					                    let value = data.datasets[tooltipItem.datasetIndex].data[tooltipItem.index];
					                    return label + ': ' + value + '%';
					                }
					            }
					        },
					        layout:{
					        	padding:{
					        		top: 30
					        	}
					        },
					    }
					});
					
					</script>
					<div style="width: 1000px; margin-left: 50px;">
						<canvas id="myChart1"></canvas>
					</div>		
					<script>
					var ctx1 = document.getElementById('myChart1').getContext('2d');
					var myChart1 = new Chart(ctx1, {
					    type: 'horizontalBar',
					    data: {
					        labels: ['5', '4', '3', '2', '1'],
					        datasets: [{
					            label: ['5','4','3','2','1'],
					            data: [<%= rate103_5 %>, <%= rate103_4 %>, <%= rate103_3 %>, <%= rate103_2 %>, <%= rate103_1 %>],
					            backgroundColor: [
					                'rgba(255, 99, 132, 0.2)',
					                'rgba(54, 162, 235, 0.2)',
					                'rgba(255, 206, 86, 0.2)',
					                'rgba(75, 192, 192, 0.2)',
					                'rgba(153, 102, 255, 0.2)'
					            ],
					            borderColor: [
					                'rgba(255, 99, 132, 1)',
					                'rgba(54, 162, 235, 1)',
					                'rgba(255, 206, 86, 1)',
					                'rgba(75, 192, 192, 1)',
					                'rgba(153, 102, 255, 1)'
					            ],          
					            borderWidth: 0
					        }]
					    },
					    options: {
					    	layout:{
					        	padding:{
					        		top: 100
					        	}
					        },
					    	legend: {
					    		labels:{
					    		generateLabels: function(chart) {
					                var data = chart.data;
					                if (data.labels.length && data.datasets.length) {
					                    return data.labels.map(function(label, i) {
					                        var meta = chart.getDatasetMeta(0);
					                        var style = meta.controller.getStyle(i);

					                        return {
					                            text: label+'점',
					                            fillStyle: style.backgroundColor,
					                            strokeStyle: style.borderColor,
					                            lineWidth: style.borderWidth,
					                            hidden: isNaN(data.datasets[0].data[i]) || meta.data[i].hidden,

					                            // Extra data used for toggling the correct item
					                            index: i
					                        };
					                    });
					                }
					                return [];
					            }
					    		},
					    	    onClick: function(e) {
					    	        e.stopPropagation();
					    	    }
					    	},
					        animation: {
					            onComplete: function() {
					                var chartInstance = this.chart;
					                var ctx = chartInstance.ctx;
					                ctx.textAlign = 'center';
					                ctx.textBaseline = 'bottom';
					                this.data.datasets.forEach(function(dataset, i) {
					                    var meta = chartInstance.controller.getDatasetMeta(i);
					                    meta.data.forEach(function(bar, index) {
					                        var data = dataset.data[index];
					                        ctx.fillText(data, bar._model.x+5, bar._model.y+10);
					                    });
					                });
					            }
					        },
					        scales: {
					            xAxes: [{
					                gridLines: {
					                    display: false
					                },
					                ticks: {
					                	
					                   	display: false,
					                   	max: Math.max(...[<%= rate103_5 %>, <%= rate103_4 %>, <%= rate103_3 %>, <%= rate103_2 %>, <%= rate103_1 %>]) + 5
					                }   
					            }],
					            yAxes: [{
					                gridLines: {
					                    display: false
					                },
					                ticks: {
					                	padding: 30,
					                    beginAtZero: true
					                }
					            }]
					        }
					    }
					});
				</script>
			</div>
		</article>
		<%
			}
		%>
	</article>

	<%
		dao.close();
	dao1.close();
	dao2.close();
	%>

	<div style="height: 500px;"></div>
	<br>
	</br>
	<article>
<!-- 리뷰 출력 -->
		<c:forEach items="${DetailReview}" var="n">
			<div class="card"
				style="width: 50rem; border: 1px solid black; margin: 0 auto;">
				<div class="card-body" style="padding-bottom: 70px;">
					<div
						style="display: flex; justify-content: space-between; align-items: center;">
						<h2 class="card-title" style="margin-left: 10px;">${ n.nik }</h2>
						<div class="star-ratings">
							<h4 class="card-rate" style="margin-right: 10px;">
								평점:
								<c:forEach begin="1" end="${n.rate}" step="1">
									<span class="star">★</span>
								</c:forEach>
							</h4>

						</div>
					</div>
					<hr class="card-subtitle mb-2 text-muted"></hr>
					<div class="d-flex justify-content-between flex-wrap">
						<h4 class="card-text"
							style="font-size: 20px; margin-left: 10px; flex: 1;">${n.recontent}</h4>
						<h2 align="right" style="font-size: 14px;">작성일:${ n.redate }</h2>
					</div>

				</div>
				<c:choose>
					<c:when test="${ sessionScope.UserNik == n.nik }">
						<button type="button"
							class="w-auto p-3 h-auto position-absolute bottom-0 start-0 btn btn-outline-primary"
							style="bottom: 10px;"
							onclick="location.href='../Review/reWrite.jsp?room=${param.room }&num=${n.num }'">수정하기</button>
						<button type="button"
							class="w-auto p-3 h-auto position-absolute bottom-0 end-0 btn btn-outline-danger"
							onclick="if(confirm('정말 삭제하겠습니까?')) location.href='../mvc2/redelete.do?room=${param.room}&num=${n.num}'">삭제하기</button>

					</c:when>
				</c:choose>
				<c:choose>
					<c:when test="${ sessionScope.UserNik == 'admin' }">
						<button type="button"
							class="w-auto p-3 h-auto position-absolute bottom-0 end-0 btn btn-outline-danger"
							onclick="if(confirm('정말 삭제하겠습니까?')) location.href='../mvc2/redelete.do?room=${param.room}&num=${n.num}'">삭제하기</button>

					</c:when>
				</c:choose>
				<%-- type = "button" onclick="location.href='../mvc2/reedit.do?num=${ param.num }';" --%>
			</div>
			</div>
			<br></br>
		</c:forEach>
	</article>
	<script src="/Final/js/detail.js"></script>
</body>
<footer>
	<jsp:include page="/Common/afooter.jsp" />
</footer>
</html>
