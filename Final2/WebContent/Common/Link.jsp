<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="../Style/Link.css">
<%
String pageName = request.getRequestURI();
String[] parts = pageName.split("/");
String folderName = parts[2];

if (folderName.equals("LogIn")) {
%>
<header>
<h1><a href="/Final2/LogIn/main.jsp">회의실 예약시스템</a></h1>
</header>

<nav>
<div>
    <table border="1">
        <tr>
            <td align="center">  
                <a href="#" class="menu-link" onclick="showMenu(event, 'company-menu')">회사소개</a>
                <ul id="company-menu" style="display: none;">
                    <a href="../CompanyIntro/about.jsp">회사소개</a>
                    <a href="../CompanyIntro/year.jsp">회사연혁</a>
                    <a href="../CompanyIntro/op.jsp">회사 목표 및 방침</a>
                    <a href="../CompanyIntro/howtocome.jsp">오시는 길</a>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'meeting-menu')">회의실</a>
                <ul id="meeting-menu" style="display: none;">
                    <a href="xx.jsp">회의실 예약</a>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'review-menu')">리뷰</a>
                <ul id="review-menu" style="display: none;">
                    <a href="../Review/review.jsp">회의실 리뷰</a></li>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'mypage-menu')">마이 페이지</a>
                <ul id="mypage-menu" style="display: none;">
                    <a href="4.jsp">회의실 이용 정보</a><br>
                    <a href="../MyPage/mypage.jsp">회의실 이용 정보</a>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'cs-menu')">고객센터</a>
                <ul id="cs-menu" style="display: none;">
                    <a href="00.jsp">공지사항</a><br>
                    <a href="../CustomerService/CustomerInquiry.jsp">고객 문의 사항</a>
                    <ul id="cs-question" style="display: none;">
                        <li><a href="5.jsp">고객 문의</a></li><br>
                        <li><a href="xxxxx.jsp">자주 묻는 질문</a></li>
                    </ul>
                </ul> 
            </td> 
        </tr> 
    </table> 
</div>
</nav>
<%
}
else
{
%>
<header>
<h1><a href="../LogIn/main.jsp">회의실 예약시스템</a></h1>
</header>

<nav>
<div>
    <table border="1">
        <tr>
            <td align="center">  
                <a href="#" class="menu-link" onclick="showMenu(event, 'company-menu')">회사소개</a>
                <ul id="company-menu" style="display: none;">
                    <a href="../CompanyIntro/about.jsp">회사소개</a>
                    <a href="../CompanyIntro/year.jsp">회사연혁</a>
                    <a href="../CompanyIntro/op.jsp">회사 목표 및 방침</a>
                    <a href="../CompanyIntro/howtocome.jsp">오시는 길</a>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'meeting-menu')">회의실</a>
                <ul id="meeting-menu" style="display: none;">
                    <a href="xx.jsp">회의실 예약</a>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'review-menu')">리뷰</a>
                <ul id="review-menu" style="display: none;">
                    <a href="../Review/review.jsp">회의실 리뷰</a></li>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'mypage-menu')">마이 페이지</a>
                <ul id="mypage-menu" style="display: none;">
                    <a href="4.jsp">회의실 이용 정보</a><br>
                    <a href="../MyPage/mypage.jsp">회의실 이용 정보</a>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'cs-menu')">고객센터</a>
                <ul id="cs-menu" style="display: none;">
                    <a href="00.jsp">공지사항</a><br>
                    <a href="#">고객 문의 사항</a>
                    <ul id="cs-question" style="display: none;">
                        <li><a href="5.jsp">고객 문의</a></li><br>
                        <li><a href="xxxxx.jsp">자주 묻는 질문</a></li>
                    </ul>
                </ul> 
            </td> 
        </tr> 
    </table> 
</div>
</nav>
<%
}
%>
