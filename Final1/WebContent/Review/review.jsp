<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="reviewPage.*"%>
<%@ page import="utils.BoardPage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
// DAO를 생성해 DB에 연결
ReviewDAO dao = new ReviewDAO(application);

// 사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>(); 
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");	
String room = request.getParameter("room");


if (searchWord != null) {
    param.put("searchField", searchField);
    param.put("searchWord", searchWord);
}	

int totalCount = dao.selectCount(param, room);  // 게시물 수 확인
String nik = (String)session.getAttribute("Nik"); // 로그인중인 닉네임


/*** 페이지 처리 start ***/
//전체 페이지 수 계산
int pageSize = Integer.parseInt(application.getInitParameter("POSTS_PER_PAGE"));
int blockPage = Integer.parseInt(application.getInitParameter("PAGES_PER_BLOCK"));
int totalPage = (int)Math.ceil((double)totalCount / pageSize); // 전체 페이지 수
//현재 페이지 확인
int pageNum = 1;  // 기본값
String pageTemp = request.getParameter("pageNum");
if (pageTemp != null && !pageTemp.equals(""))
 pageNum = Integer.parseInt(pageTemp); // 요청받은 페이지로 수정
//목록에 출력할 게시물 범위 계산
int start = (pageNum - 1) * pageSize + 1;  // 첫 게시물 번호
int end = pageNum * pageSize; // 마지막 게시물 번호
param.put("start", start);
param.put("end", end);
/*** 페이지 처리 end ***/


List<ReviewDTO> reviewLists = dao.selectListPage(param, room);  // 게시물 목록 받기
dao.close();  // DB 연결 닫기
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="/Common/header.jsp" />  <!-- 공통 링크 -->
<style>
	article{
		margin-left: 50px;
	}
</style>
<title>리뷰</title>
</head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<body>
<div style="height: 230px;"></div>
<h2>목록 보기(List) - 현재 페이지 : <%= pageNum %> (전체 : <%= totalPage %>)</h2>

<div style="float: right;">
</div>

<article>

	    
	    <!-- 게시물 목록 테이블(표) --> 
	    <table class = "table table-hover" border="1" width="90%">
	        <!-- 각 칼럼의 이름 --> 
	        <tr>
	            <th width="10%">번호</th>
	            <th width="30%">제목</th>
	            <th width="25%">작성자</th>
	            <th width="10%">회의실 번호</th>
	            <th width="10%">평점</th>
	            <th width="15%">작성일</th>
	        </tr>
	        <!-- 목록의 내용 --> 
	<%
	if (reviewLists.isEmpty()) {
	    // 게시물이 하나도 없을 때 
	%>
	        <tr>
	            <td colspan="6" align="center">
	                <h3>등록된 리뷰가 없습니다</h3>
	            </td>
	        </tr>
	<%
	}
	else {
	    // 게시물이 있을 때 
	    int virtualNum = 0;  // 화면상에서의 게시물 번호
	    int countNum = 0;
	    for (ReviewDTO dto : reviewLists)
	    	
	    {
	        virtualNum = totalCount - (((pageNum -1) * pageSize) + countNum++); // 전체 게시물 수에서 시작해 1씩 감소
	%>
	        <tr align="center">
	            <td><%= virtualNum %></td>  <!--게시물 번호-->
	            <td align="left">  <!--제목(+ 하이퍼링크)-->
	                 <a href="View.jsp?num=<%= dto.getNum() %>&virtualNum=<%= virtualNum %>&room=<%= room %>"><%= dto.getTitle() %></a>

	            </td>
	            <td align="center"><%= dto.getNik() %></td>     <!--작성자 닉네임-->
	            <td align="center"><%= dto.getRnum()+"호" %></td>  <!--방번호-->
	            <td align="center">
				    <% for(int i = 0; i < (int)dto.getRate(); i++) { %>
				        &#9733;
				    <% } %>
				</td>  <!--평점-->
	            <td align="center"><%= dto.getRedate() %></td>    <!--작성일-->
	        </tr>
	<%
	    }
	}
	%>
	    </table>
	    <!--목록 하단의 [글쓰기] 버튼-->
	    <table class="table table-hover" border="1" width="50%" align = "right">
	        <tr align="center">
	        <!-- 검색폼 -->
            	<form method="get">  
		            <td align="left" width = "20%">
		            <select name="searchField"> 
		                <option value="title">제목</option> 
		                <option value="content">내용</option>
		            </select>
		            <input type="text" name="searchWord" />
		            <input type="submit" value="검색하기" />
	            </form>
	        </td>
	        <!--페이징 처리-->
	            <td>
			<%= BoardPage.pagingStr(totalCount, pageSize,
			       blockPage, pageNum, request.getRequestURI(), room) %> 
	            </td>
	            <td><button align= "right" type="button" class="btn btn-primary" onclick="location.href='Write.jsp?room=<%= room %>';">글쓰기
	                </button></td>
	        </tr>
	    </table>
	</div>    
 </article>
 
<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
<script src="/Final1/js/review.js"></script>
</body>
</html>
