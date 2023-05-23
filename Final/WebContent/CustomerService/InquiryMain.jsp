<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="customerInquiryBoard.InquiryDAO"%>
<%@ page import="customerInquiryBoard.InquiryDTO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<jsp:include page="IsLoggedIn.jsp" />

<%
// DAO를 생성해 DB에 연결
InquiryDAO dao = new InquiryDAO(application);

// 사용자가 입력한 검색 조건을 Map에 저장
Map<String, Object> param = new HashMap<String, Object>(); 
String searchField = request.getParameter("searchField");
String searchWord = request.getParameter("searchWord");	

if (searchWord != null) {
    param.put("searchField", searchField);
    param.put("searchWord", searchWord);
}

String nik = (String)session.getAttribute("UserNik"); // 로그인중인 닉네임*
String viewValue = request.getParameter("viewValue");

int totalCount = dao.selectCount(param, nik, viewValue);  // 게시물 수 확인
List<InquiryDTO> boardLists = dao.selectList(param, nik, viewValue);  // 게시물 목록 받기
dao.close();  // DB 연결 닫기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<jsp:include page="/Common/header.jsp" />  <!-- 공통 링크 -->

<title>문의 게시판</title>
</head>
<body class="bg-light text-dark"">
<div class="container-md" style="height: 200px"></div>
<div class="bg-light text-dark"" style="height: 380px">
    <h2><a href="<%=request.getContextPath() %>/CustomerService/InquiryMain.jsp" class="my_inquiry">문의 게시판</a></h2>
 	<article>
    <!-- 검색폼 --> 
    
    <form method="get">  
    <table class="table table-striped-columns table-success 
    				table-bordered border-dark width="90%">
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
    				table-bordered border-dark table-hover" width="100%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th scope="col" width="5%">번호</th>
            <th class="text-center" scope="col" width="50%" >제목</th>
            <th class="text-center" scope="col" width="5%" >답변</th>
            <th scope="col" width="15%">작성자</th>
        </tr>
        <!-- 목록의 내용 --> 
<%
if (boardLists.isEmpty()) {
    // 게시물이 하나도 없을 때 
%>
        <tr>
            <td colspan="5" align="center">
                <h3>등록된 문의가 없습니다</h3>
            </td>
        </tr>
<%
}

else {
    // 게시물이 있을 때 
    int virtualNum = 0;  // 화면상에서의 게시물 번호
    for (InquiryDTO dto : boardLists)
    {
        virtualNum = totalCount--;  // 전체 게시물 수에서 시작해 1씩 감소
%>
        <tr align="center">
            <td align="left"><%= virtualNum %></td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
                <a href="View.jsp?num=<%= dto.getNum() %>&virtualNum=<%= virtualNum %>"><%= dto.getTitle() %></a> 
            </td>
            <td align="center"><%= dto.getIcomment()!= null ? "O" : "X" %></td>
            <td align="left"><%= dto.getNik() %></td>          <!--작성자 아이디-->
        </tr>
<%
    }
}
%>
    </table>
</article>

<article>
    <!--목록 하단의 [글쓰기] 버튼-->
    <table class="table table-striped-columns table-success 
    				table-bordered border-dark width="90%">
        <tr align="center">
            <td><button type="button" class="btn btn-secondary btn-lg" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
</article>
</div>
<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>
