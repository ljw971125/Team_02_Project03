<%@page import="room.RoomDTO"%>
<%@page import="room.RoomDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="reservation.ReservationDTO"%>
<%@ page import="reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/Final/CSS/reservation.css">

<meta charset="UTF-8">
<%
	String room = (String) request.getParameter("room");
int price = Integer.parseInt(request.getParameter("price"));
%>
<title>회의실 예약</title>
<jsp:include page="../Common/header.jsp" />
</head>
<script type="text/javascript">



var today = new Date();
var startTime = 9;
var endTime = 18;
var selectedTimes = [];
var clickedCell = null; // 클릭한 셀을 저장할 변수

function buildCalendar() {
	  var row = null;
	  var cnt = 0;
	  var calendarTable = document.getElementById("calendar");
	  var calendarTableTitle = document.getElementById("calendarTitle");
	  calendarTableTitle.innerHTML = today.getFullYear() + "년 " + (today.getMonth() + 1) + "월";

	  var firstDate = new Date(today.getFullYear(), today.getMonth(), 1);
	  var lastDate = new Date(today.getFullYear(), today.getMonth() + 1, 0);
	  var currentDate = new Date(); // 현재 날짜 가져오기
	  while (calendarTable.rows.length > 2) {
	    calendarTable.deleteRow(calendarTable.rows.length - 1);
	  }

	  row = calendarTable.insertRow();
	  for (var i = 0; i < firstDate.getDay(); i++) {
	    var cell = row.insertCell();
	    cnt += 1;
	  }
	  
	  var clickedCell = null; // 클릭한 셀을 저장할 변수

	  function resetCellColor() {
	    if (clickedCell) {
	      clickedCell.style.backgroundColor = ""; // 클릭한 셀의 색상 초기화
	    }
	  }

	  function changeCellColor(cell) {
	    resetCellColor(); // 다른 셀 클릭 시 변경된 셀의 색상 초기화
	    cell.style.backgroundColor = "rainbow"; // 클릭한 셀의 색상 변경
	    clickedCell = cell; // 클릭한 셀 저장
	  }

	  



	  for (var i = 1; i <= lastDate.getDate(); i++) {
	    var cell = row.insertCell();
	    cnt += 1;

	    cell.setAttribute("id", i);
	    cell.innerHTML = i;
	    cell.align = "center";

	    if (
	      (currentDate.getFullYear() > today.getFullYear()) ||
	      (currentDate.getFullYear() === today.getFullYear() && currentDate.getMonth() > today.getMonth()) ||
	      (currentDate.getFullYear() === today.getFullYear() && currentDate.getMonth() === today.getMonth() && i <= currentDate.getDate())
	    ) {
	      cell.style.pointerEvents = "none"; // 현재 날짜 이전은 선택할 수 없도록 이벤트 비활성화
	      cell.style.color = "gray"; // 현재 날짜 이전은 색상을 회색으로 변경
	    } else {
	      cell.onclick = function () {
	        var clickedYear = today.getFullYear();
	        var clickedMonth = 1 + today.getMonth();
	        var clickedDate = this.getAttribute("id");

	        clickedDate = clickedDate >= 10 ? clickedDate : "0" + clickedDate;
	        clickedMonth = clickedMonth >= 10 ? clickedMonth : "0" + clickedMonth;
	        var clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

	        document.getElementById("date").value = clickedYMD;
	        changeCellColor(this);

	      };

	      cell.addEventListener("mouseenter", function () {
	    	  if (this !== clickedCell) {
	              this.style.backgroundColor = "yellow"; // 마우스가 들어올 때 배경색을 노란색으로 변경합니다.
	            }
	      });
	      cell.addEventListener("mouseleave", function () {
	    	  if (this !== clickedCell) {
	              this.style.backgroundColor = ""; // 마우스가 벗어날 때 배경색을 초기화합니다.
	            }
	      });
	    }

	    if (cnt % 7 === 1) {
	      cell.innerHTML = "<font color=#F79DC2>" + i + "</font>";
	    }

	    if (cnt % 7 === 0) {
	      cell.innerHTML = "<font color=skyblue>" + i + "</font>";
	      row = calendarTable.insertRow();
	    }
	  }

	  if (cnt % 7 !== 0) {
	    for (var i = 0; i < 7 - (cnt % 7); i++) {
	      var cell = row.insertCell();
	    }
	  }
	}
	

function prevCalendar(){
    today = new Date(today.getFullYear(), today.getMonth()-1, today.getDate());
    buildCalendar();
}

function nextCalendar() {
    today = new Date(today.getFullYear(), today.getMonth() + 1, today.getDate());
    buildCalendar();
}




function timeTableMaker() {
	  var row = null;
	  var timeTable = document.getElementById("timeTable");
	  var selectedTimes = []; // 선택한 셀의 시간 배열

	  // 테이블 초기화
	  while (timeTable.rows.length > 0) {
	    timeTable.deleteRow(timeTable.rows.length - 1);
	  }

	  for (var i = 0; i < endTime - startTime; i++) {
	    // 곱해서 숫자 타입으로 변환
	    var cellTime = startTime * 1 + i;

	    var cellStartTimeText = formatTime(cellTime) + ":00";
	    var cellEndTimeText = formatTime(cellTime + 1) + ":00";
	    var inputCellText = cellStartTimeText + " ~ " + cellEndTimeText;

	    // 셀 입력을 위해 테이블 개행
	    row = timeTable.insertRow();

	    // 해당 row의 셀 생성
	    (function (time) {
	      var cell = row.insertCell();
	      // cell에 id 부여
	      cell.setAttribute("id", "time" + time);
	      // 셀에 입력
	      cell.innerHTML = inputCellText;

	      // 셀 클릭 이벤트 추가
	      cell.addEventListener("click", function () {
	        var index = selectedTimes.indexOf(time);
	        if (index > -1) {
	          selectedTimes.splice(index, 1);
	        } else {
	          selectedTimes.push(time);
	        }

	        // 선택한 구간 전체 시간 강조
	        for (var j = startTime; j <= endTime; j++) {
	          var cell = document.getElementById("time" + j);
	          if (cell) {
	            if (j >= Math.min(...selectedTimes) && j <= Math.max(...selectedTimes)) {
	              cell.style.backgroundColor = "lightblue";
	            } else {
	              cell.style.backgroundColor = "";
	            }
	          }
	        }

	        // 선택된 시간 표시
	        if (selectedTimes.length >= 1) {
	          var startCellTime = Math.min(...selectedTimes);
	          var endCellTime = Math.max(...selectedTimes);
	          document.getElementById("selectedTimes").value =
	            formatTime(startCellTime) + ":00~" + formatTime(endCellTime + 1) + ":00";

	          // 가격 계산 및 표시
	          var cellCount = endCellTime - startCellTime + 1;
	          var pricePerCell = parseInt(document.getElementById("price2").value);
	          var totalPrice = cellCount * pricePerCell;
	          document.getElementById("price").value = totalPrice;
	        } else {
	          document.getElementById("selectedTimes").value = "";
	          document.getElementById("price").value = "";
	        }
	      });
	    })(cellTime);
	  }
	}

	// 시간을 2자리 숫자 형식으로 변환하는 함수
	function formatTime(time) {
	  return time < 10 ? "0" + time : time;
	}

window.onload = function() {
    buildCalendar();
    timeTableMaker();
};

function resetTimeTable() {
    var timeTable = document.getElementById("timeTable");
    var selectedTimesInput = document.getElementById("selectedTimes");
    var priceInput = document.getElementById("price");
    var dateInput = document.getElementById("date");

    // 모든 셀의 배경 초기화
    var cells = timeTable.getElementsByTagName("td");
    for (var i = 0; i < cells.length; i++) {
        cells[i].style.backgroundColor = "";
    }
    var calendarTable = document.getElementById("calendar");
    var cells = calendarTable.getElementsByTagName("td");
    for (var i = 0; i < cells.length; i++) {
        cells[i].style.backgroundColor = "";
    }

    // 선택된 시간, 가격, 날짜 초기화
    selectedTimesInput.value = "";
    priceInput.value = "";
    dateInput.value = "";
}

function makeReservation() {
	  var dateInput = document.getElementById("date");
	  var timeInput = document.getElementById("selectedTimes");

	  var date = dateInput.value.trim();
	  var time = timeInput.value.trim();

	  if (date === "") {
	    alert("예약 날짜를 선택해주세요.");
	    return false; // 폼 제출을 중단하기 위해 false를 반환합니다.
	  }

	  if (time === "") {
	    alert("예약 시간을 선택해주세요.");
	    return false; // 폼 제출을 중단하기 위해 false를 반환합니다.
	  }
	  return true; // 폼을 제출합니다.
	}
</script>
<body>
	<jsp:include page="/LogIn/IsLoggedIn.jsp" />
	<div style="height: 100px;"></div>
	<form action="../saveReservationInfo.do?" method="post"
		id="reservationForm" onsubmit="return makeReservation()">


		<aside></aside>

		<section>
			<div class="container">
				<table id="calendar"
					style="display: inline-block; padding: 10px; vertical-align: top;">
					<tr>
						<td align="center" style="padding: 20px;"><label
							onclick="prevCalendar()"> ◀ </label></td>
						<td colspan="5" align="center" id="calendarTitle"
							style="font-size: 20px;">yyyy년 m월</td>
						<td align="center" style="padding: 20px;"><label
							onclick="nextCalendar()"> ▶ </label></td>
					</tr>
					<tr>
						<td align="center" style="padding: 10px;"><font
							color="#F79DC2">일</td>
						<td align="center" style="padding: 10px;">월</td>
						<td align="center" style="padding: 10px;">화</td>
						<td align="center" style="padding: 10px;">수</td>
						<td align="center" style="padding: 10px;">목</td>
						<td align="center" style="padding: 10px;">금</td>
						<td align="center" style="padding: 10px;"><font
							color="skyblue">토</td>
					</tr>
					<tr></tr>
				</table>

				<table id="timeTable"></table>

				<div>
					<div class="form-group">
						<label for="date">예약 날짜</label> <input type="text" id="date"
							name="rdate" readonly>
					</div>
					<div class="form-group">
						<label for="selectedTimes">예약 시간</label> <input type="text"
							id="selectedTimes" name="rtime" readonly>
					</div>
					<div class="form-group">
						<label for="price">가격</label> <input type="text" id="price"
							name="price" readonly>
					</div>
					<input type="hidden" name="room" value="<%=room%>"> <input
						type="hidden" id="price2" name="price2" value="<%=price%>">
					<div>
						<input type="button" value="초기화" onclick="resetTimeTable()">
						<input type="submit" value="예약하기" onclick="resertCheck()">
					</div>
				</div>
			</div>
			<div class="notice-wrapper">
				<div class="notice-box">
					<h2>이용 시 유의사항</h2>
					<ul>
						<li>예약한 시간에 맞춰 정시에 입실해 주세요.</li>
						<li>예약된 시간 내에 이용을 완료해야 하며, 시간 연장은 추가 비용이 발생합니다.</li>
						<li>회의실 내부 물품 및 시설물은 소중히 사용해 주세요. 파손 시 추가 비용이 발생할 수 있습니다.</li>
						<li>흡연은 금지되어 있습니다.</li>
						<li>다른 고객들의 이용을 방해할 수 있는 행위는 자제해 주세요.</li>
					</ul>
				</div>
			</div>
		</section>

	</form>
	<jsp:include page="/Common/af.jsp" />
</body>
</html>