<%@page import="reservation.ReservationDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	int room = Integer.parseInt(request.getParameter("room"));
ReservationDAO dao = new ReservationDAO();
dao.reservationList();
//boolean isChecked = dao.checkDuplicateReservation(dto);
%>
<title>회의실 예약</title>
<jsp:include page="../Common/header.jsp" />
</head>
<script type="text/javascript">
var today = new Date();
var startTime = 9;
var endTime = 18;
var selectedTimes = [];

function buildCalendar() {
	  var row = null;
	  var cnt = 0;
	  var calendarTable = document.getElementById("calendar");
	  var calendarTableTitle = document.getElementById("calendarTitle");
	  calendarTableTitle.innerHTML =
	    today.getFullYear() + "년" + (today.getMonth() + 1) + "월";

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

	  for (var i = 1; i <= lastDate.getDate(); i++) {
	    var cell = row.insertCell();
	    cnt += 1;

	    cell.setAttribute("id", i);
	    cell.innerHTML = i;
	    cell.align = "center";

	    if (
	      currentDate.getFullYear() === today.getFullYear() &&
	      currentDate.getMonth() === today.getMonth() &&
	      i < currentDate.getDate()
	    ) {
	      cell.style.pointerEvents = "none"; // 현재 날짜 이전은 선택할 수 없도록 이벤트 비활성화
	      cell.style.color = "gray"; // 현재 날짜 이전은 색상을 회색으로 변경
	    } else {
	      cell.onclick = function () {
	        clickedYear = today.getFullYear();
	        clickedMonth = 1 + today.getMonth();
	        clickedDate = this.getAttribute("id");

	        clickedDate = clickedDate >= 10 ? clickedDate : "0" + clickedDate;
	        clickedMonth = clickedMonth >= 10 ? clickedMonth : "0" + clickedMonth;
	        clickedYMD = clickedYear + "-" + clickedMonth + "-" + clickedDate;

	        document.getElementById("date").value = clickedYMD;
	      };
	      cell.addEventListener("mouseenter", function () {
	        this.style.backgroundColor = "yellow"; // 마우스가 들어올 때 배경색을 노란색으로 변경합니다.
	      });
	      cell.addEventListener("mouseleave", function () {
	        this.style.backgroundColor = ""; // 마우스가 벗어날 때 배경색을 초기화합니다.
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
    selectedTimes = []; // 선택한 셀의 시간 배열

    // 테이블 초기화
    while (timeTable.rows.length > 0) {
        timeTable.deleteRow(timeTable.rows.length - 1);
    }

    for (var i = 0; i < endTime - startTime; i++) {
        // 곱해서 숫자타입으로 변환
        var cellTime = startTime * 1 + i;

        var cellStartTimeText = cellTime + ":00";
        var cellEndTimeText = cellTime + 1 + ":00";
        var inputCellText = cellStartTimeText + " ~ " + cellEndTimeText;

        // 셀 입력을 위해 테이블 개행
        row = timeTable.insertRow();
        // 해당 row의 셀 생성
        (function(time) {
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
                        startCellTime + ":00~" + (endCellTime + 1) + ":00";

                    // 가격 계산 및 표시
                    var cellCount = endCellTime - startCellTime + 1;
                    var pricePerCell = 5000;
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

    // 선택된 시간, 가격, 날짜 초기화
    selectedTimesInput.value = "";
    priceInput.value = "";
    dateInput.value = "";
}


</script>
<body>
	<jsp:include page="/LogIn/IsLoggedIn.jsp" />
	<h1><%=room%>호 예약
	</h1>



	<form action="saveReservationInfo.jsp" method="post">

		<section style="text-align: center;">
			<div style="display: inline-block; padding: 10px;">
				<table id="calendar"
					style="display: inline-block; padding: 10px; vertical-align: top;">
					<tr>
						<td align="center"><label onclick="prevCalendar()"> ◀
						</label></td>
						<td colspan="5" align="center" id="calendarTitle">yyyy년 m월</td>
						<td align="center"><label onclick="nextCalendar()"> ▶
						</label></td>
					</tr>
					<tr>
						<td align="center"><font color="#F79DC2">일</td>
						<td align="center">월</td>
						<td align="center">화</td>
						<td align="center">수</td>
						<td align="center">목</td>
						<td align="center">금</td>
						<td align="center"><font color="skyblue">토</td>
					</tr>
					<tr></tr>
				</table>

				<table id="timeTable" style="display: inline-block; padding: 10px;"></table>

				<div style="text-align: left; padding: 10px;">
					예약 날짜: <input type="text" id="date" name="rdate" readonly><br>
					선택된 시간: <input type="text" id="selectedTimes" name="rtime" readonly><br>
					가격: <input type="text" id="price" name="price" readonly><br>
					<input type="hidden" name="room" value="<%=room%>">
					<div style="align: center">
						<input type="button" value="초기화" onclick="resetTimeTable()">
						<input type="submit" value="예약하기">
					</div>
				</div>
			</div>
		</section>

	</form>
	<jsp:include page="../Common/afooter.jsp" />
</body>
</html>