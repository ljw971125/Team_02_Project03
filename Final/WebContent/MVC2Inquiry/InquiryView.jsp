<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="mvc2InquiryBoard.InquiryDAO"%>
<%@ page import="mvc2InquiryBoard.InquiryDTO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<jsp:include page="IsLoggedIn.jsp" />
  <title>문의 사항</title>

  <style>
    body {
      margin: 0;
      padding: 0;
      
      font-family: Arial, sans-serif;
    }
    header {
      background-color: #333;
      color: #fff;
      padding: 20px;
      height: 100px;
    }
    nav {
      display: flex;
      justify-content: center;
      gap: 20px;
    }
    main {
      display: flex;
      flex-wrap: wrap;
      gap: 20px;
      padding: 20px;
    }
    section {
      flex: 1 1 60%;
    }
    aside {
      flex: 1 1 1%;
    }
    footer {
      background-color: #333;
      color: #fff;
      padding: 20px;
      text-align: center;
    }
  </style>
</head>
<body>
<header>
    <nav>
<jsp:include page="/Common/header.jsp" />  <!-- 공통 링크 -->
    </nav>
  </header>
  <main>
  <aside>
  </aside>
  <section>
  <article>
  
<table class="table table-striped-columns table-success 
    				table-bordered border-dark table-hover" >
    <colgroup>
        <col width="15%"/> <col width="35%"/>
        <col width="15%"/> <col width="*"/>
    </colgroup>

    <!-- 게시글 정보 -->
    <tr>
        <td>번호</td> <td>${ param.virtualnum }</td>
        <td>작성자</td> <td>${ dto.nik }</td> <!-- 닉네임 -->
    </tr>

    <tr>
        <td>제목</td>
        <td colspan="3">${ dto.title }</td>
    </tr>
    <tr>
        <td>내용</td>
        <td colspan="3" height="100">${ dto.icontent }</td>
    </tr>
    <c:choose>
    <c:when test="${ dto.icomment != null }">
    <tr>
    	<td>답변</td>
        <td colspan="3" height="100">${ dto.icomment }</td> 
    </tr>
    </c:when>
	</c:choose>
    <!-- 하단 메뉴(버튼) -->
    
    
    <tr>
        <td colspan="4" align="center">
        <% if(!session.getAttribute("UserNik").equals("admin")){ %>
            <c:choose>	
            <c:when test="${ dto.icomment == null }">
            <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='../mvc2/edit.do?num=${ param.num }&virtualnum=${ param.virtualnum }';">
                수정하기
            </button>
            <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='../mvc2/delete.do?num=${ param.num }';">
                삭제하기
            </button>
            </c:when>
            </c:choose>
            <%
        }
            %>
            <% 
            	if(session.getAttribute("UserNik").equals("admin")){
            		%>
            <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='../mvc2/delete.do?num=${ param.num }';">
                관리자용삭제하기
            </button>
            <c:choose>
            <c:when test="${ dto.icomment == null }">
            <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='../mvc2/answer.do?num=${ param.num }';">
                답변하기
            </button>
            </c:when>
			<c:otherwise>
			<button type="button" class="btn btn-secondary btn-lg" onclick="location.href='../mvc2/answeredit.do?num=${ param.num }';">
                답변수정하기
            </button>
			</c:otherwise>
            </c:choose>
            <%
            }
            %>  
            <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='../mvc2/inquirylist.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>
  </article>
  </section>
  <aside>
  </aside>
  </main>
</body>
</html>