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

String nik = (String)session.getAttribute("Nik"); // 로그인중인 닉네임
int totalCount = dao.selectCount(param, nik);  // 게시물 수 확인
List<InquiryDTO> boardLists = dao.selectList(param, nik);  // 게시물 목록 받기
dao.close();  // DB 연결 닫기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../Common/Link.jsp" />  <!-- 공통 링크 -->
<title>문의 게시판</title>
</head>
<body>
<div style="height: 200px;"></div>

    <h2>문의 게시판</h2>
    <!-- 검색폼 --> 
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="center">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="icontent">내용</option>
            </select>
            <input type="text" name="searchWord" />
            <input type="submit" value="검색하기" />
        </td>
    </tr>   
    </table>
    </form>
    <!-- 게시물 목록 테이블(표) --> 
    <table border="1" width="90%">
        <!-- 각 칼럼의 이름 --> 
        <tr>
            <th width="10%">번호</th>
            <th width="50%">제목</th>
            <th width="15%">작성자</th>
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
            <td><%= virtualNum %></td>  <!--게시물 번호-->
            <td align="left">  <!--제목(+ 하이퍼링크)-->
                <a href="View.jsp?num=<%= dto.getNum() %>&virtualNum=<%= virtualNum %>"><%= dto.getTitle() %></a> 
            </td>
            <td align="center"><%= dto.getNik() %></td>          <!--작성자 아이디-->
        </tr>
<%
    }
}
%>
    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <table border="1" width="90%">
        <tr align="center">
            <td><button type="button" style="background-color: red" onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
<script src="../Common/ex.js"></script>
</body>
</html>
