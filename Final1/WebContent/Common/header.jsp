<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" type="text/css" href="/Final1/Style/header.css">
<header>
<h1><a href="/Final1/index.jsp">MUF</a></h1>

<nav>
<div>
    <table border="1">
        <tr>
            <td align="center">  
                <a href="#" class="menu-link" onclick="showMenu(event, 'company-menu')">회사소개</a>
                <ul id="company-menu" style="display: none;">
                    <a href="/Final1/CompanyIntro/about.jsp">회사소개</a>
                    <a href="/Final1/CompanyIntro/year.jsp">회사연혁</a>
                    <a href="/Final1/CompanyIntro/op.jsp">회사 목표 및 방침</a>
                    <a href="/Final1/CompanyIntro/howtocome.jsp">오시는 길</a>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'meeting-menu')">회의실</a>
                <ul id="meeting-menu" style="display: none;">
                    <a href="xx.jsp">회의실 예약</a>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'review-menu')">리뷰</a>
                <ul id="review-menu" style="display: none;">
                    <a href="/Final1/Review/review.jsp">회의실 리뷰</a></li>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'mypage-menu')">마이 페이지</a>
                <ul id="mypage-menu" style="display: none;">
                    <a href="/Final1/MyPage/mypage.jsp">회의실 이용 정보</a>
                </ul>

                <a href="#" class="menu-link" onclick="showMenu(event, 'cs-menu')">고객센터</a>
                <ul id="cs-menu" style="display: none;">
                    <a href="/Final1/CustomerService/InquiryMain.jsp">문의사항</a>
                </ul> 
            </td> 
        </tr> 
    </table> 
</div>
</nav>
</header>