<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
    
<form method="get">  
    <table class="table table-striped-columns table-success 
    				table-bordered border-dark">
    <tr>
        <td align="right" >
        <div>
            <label><input type="radio" name="viewValue" value="viewAll" checked>전체보기</label>
            <label><input type="radio" name="viewValue" value="viewNotAnswer"/>미답변 보기</label>
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="icontent">내용</option>
            </select>
            <input type="text" placeholder="입력" name="searchWord" />
            <input type="submit" class="btn btn-light btn-sm" value="검색" />
            </div>
        </td>
    </tr>   
    </table>
    </form>
    
      </article>

    <article>
    <!-- 게시물 목록 테이블(표) --> 
    <table class="table table-striped-columns table-success 
    				table-bordered border-dark table-hover">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th class="text-center" scope="col" width="10%">번호</th>
            <th class="text-center" scope="col">제목</th>
            <th class="text-center" scope="col" width="10%">답변</th>
            <th class="text-center" scope="col" width="20%">작성자</th>
        </tr>
    <c:choose>    
    <c:when test="${ empty boardLists }">  <!-- 게시물이 없을 때 -->
        <tr>
            <td colspan="4" align="center">
                등록된 게시물이 없습니다^^*
            </td>
        </tr>
    </c:when>
    <c:otherwise>  <!-- 게시물이 있을 때 -->
        <c:forEach items="${ boardLists }" var="row" varStatus="loop">    
        <tr align="center">
        	
            <td>  <!-- 번호 -->
                ${ loop.index + map.totalCount }   
            </td>
            
            <td align="left">  <!-- 제목(링크) -->
                <a href="../mvc2/inquiryview.do?num=${ row.num }">${ row.title }</a> 
            </td> 
                        
            <c:choose> 
            <c:when test="${ row.icomment != null }">
            <td>O</td>
            </c:when>
            <c:otherwise>
            <td>X</td>
            </c:otherwise>
            </c:choose>
            
            <td>${ row.nik }</td>  <!-- 작성자 -->
            
        </tr>
        </c:forEach>        
    </c:otherwise>    
</c:choose>

	</table>
      </article>
      <article>
      <!--목록 하단의 [글쓰기] 버튼-->
    <table class="table table-striped-columns table-success 
    				table-bordered border-dark width="90%">
        <tr align="center">
            <td><button type="button" class="btn btn-secondary btn-lg" onclick="location.href='../mvc2/write.do';">글쓰기
                </button></td>
        </tr>
    </table>
      </article>
    </section>
    
        <aside>
    </aside>
    
  </main>
  <footer>
    <p><jsp:include page="/Common/rfooter.jsp" /></p>
  </footer>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

</body>
</html>
