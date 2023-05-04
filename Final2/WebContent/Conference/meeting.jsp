<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar" %>
<%@ page import="java.util.GregorianCalendar" %>
<%
    Calendar cal = new GregorianCalendar();
    int year = cal.get(Calendar.YEAR);
    int month = cal.get(Calendar.MONTH);
    int day = cal.get(Calendar.DAY_OF_MONTH);
    cal.set(year, month, 1);
    int startDay = cal.get(Calendar.DAY_OF_WEEK);
    int daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Calendar</title>
<style>
    .calendar {
        display: none;
    }
    .calendar.active {
        display: block;
    }
    .timetable {
        display: none;
    }
    .timetable.active {
        display: block;
    }
</style>
<script>
    let currentMonth = <%= month %>;
    let currentDate = '<%= year %>년 <%= month + 1 %>월 <%= day %>일';
    function showCalendar(month) {
        document.querySelector('.calendar.active').classList.remove('active');
        document.querySelector('#calendar-' + month).classList.add('active');
        currentMonth = month;
    }
    function prevMonth() {
        if (currentMonth > 0) {
            showCalendar(currentMonth - 1);
        }
    }
    function nextMonth() {
        if (currentMonth < 11) {
            showCalendar(currentMonth + 1);
        }
    }
    function selectDate(date) {
        document.querySelector('#timetable-' + currentDate).classList.remove('active');
        document.querySelector('#timetable-' + date).classList.add('active');
        currentDate = date;
    }
</script>
</head>
<body>
    <button onclick="prevMonth()">&lt;</button>
    <button onclick="nextMonth()">&gt;</button>
    <% for (int m = 0; m < 12; m++) { %>
        <div class="calendar<%= m == month ? " active" : "" %>" id="calendar-<%= m %>">
            <%
                cal.set(year, m, 1);
                startDay = cal.get(Calendar.DAY_OF_WEEK);
                daysInMonth = cal.getActualMaximum(Calendar.DAY_OF_MONTH);
            %>
            <table border="1">
                <tr>
                    <th colspan="7"><%= year %>년 <%= m + 1 %>월</th>
                </tr>
                <tr>
                    <th>일</th>
                    <th>월</th>
                    <th>화</th>
                    <th>수</th>
                    <th>목</th>
                    <th>금</th>
                    <th>토</th>
                </tr>
                <% 
                    for (int i = 1; i <= daysInMonth; i++) {
                        if (i == 1) {
                            %><tr><%
                            for (int j = 1; j < startDay; j++) {
                                %><td></td><%
                            }
                        }
                        %><td onclick="selectDate('<%= year %>년 <%= m + 1 %>월 <%= i %>일')"><%= i %></td><%
                        if ((i + startDay - 1) % 7 == 0) {
                            %></tr><%
                        }
                    }
                %>
            </table>
        </div>
    <% } %>

    <% for (int h = 0; h < 24; h++) { %>
        <div class="timetable<%= h == 0 ? " active" : "" %>" id="timetable-<%= year %>년 <%= month + 1 %>월 <%= day %>일 <%= h %>시">
            <%= year %>년 <%= month + 1 %>월 <%= day %>일 <%= h %>시 ~ <%= h + 1 %>시
        </div>
    <% } %>

</body>
</html>