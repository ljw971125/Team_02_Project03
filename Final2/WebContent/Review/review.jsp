<%@ page import="java.util.List"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.Map"%>
<%@ page import="reviewPage.ReviewDTO"%>
<%@ page import="reviewPage.ReviewDAO"%>
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
if (searchWord != null) {
    param.put("searchField", searchField);
    param.put("searchWord", searchWord);
}

int totalCount = dao.selectCount(param);  // 게시물 수 확인
/* String nik = (String)session.getAttribute("Nik"); // 로그인중인 닉네임 */
List<ReviewDTO> reviewLists = dao.selectList(param);  // 게시물 목록 받기
dao.close();  // DB 연결 닫기

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

List<ReviewDTO> boardLists = dao.selectListPage(param);  // 게시물 목록 받기
dao.close();  // DB 연결 닫기
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<jsp:include page="../Common/Link.jsp" />  <!-- 공통 링크 -->
<title>회원제 게시판</title>
</head>

<body>
<div style="height: 140px;"></div>
<h2>목록 보기(List) - 현재 페이지 : <%= pageNum %> (전체 : <%= totalPage %>)</h2>

<div style="float: right;">
<aside>
    <jsp:include page="LoginForm.jsp" />
</aside>
</div>

<div style="margin-right: 400px;">
    <h2>회의실 리뷰</h2>
    <!-- 검색폼 --> 
    <form method="get">  
    <table border="1" width="90%">
    <tr>
        <td align="left">
            <select name="searchField"> 
                <option value="title">제목</option> 
                <option value="content">내용</option>
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
            <th width="30%">제목</th>
            <th width="15%">작성자</th>
            <th width="10%">회의실 번호</th>
            <th width="20%">평점</th>
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
                <a href="View.jsp?num=<%= dto.getNum() %>&virtualNum=<%=virtualNum%>"><%= dto.getTitle() %></a> 
            </td>
            <td align="center"><%= dto.getNik() %></td>     <!--작성자 닉네임-->
            <td align="center"><%= dto.getRnum() %></td>  <!--방번호-->
            <td align="center"><%= dto.getRate() %></td>  <!--평점-->
            <td align="center"><%= dto.getRedate() %></td>    <!--작성일-->
        </tr>
<%
    }
}
%>
    </table>
    <!--목록 하단의 [글쓰기] 버튼-->
    <table border="1" width="90%">
        <tr align="center">
                   <!--페이징 처리-->
            <td>
                <%= BoardPage.pagingStr(totalCount, pageSize,
                       blockPage, pageNum, request.getRequestURI()) %>  
            </td>
            <td><button type="button" style="background-color:lightgreen; width:100px; height:50px; font-size: 15px; border-radius: 15px; cursor:pointer; " onclick="location.href='Write.jsp';">글쓰기
                </button></td>
        </tr>
    </table>
    
<script src="../Common/link.js"></script>
	<script src="//t1.daumcdn.net/tistory_admin/lib/jquery/jquery-3.2.1.min.js"></script>
	
	
	

<!-- 마우스 커서 적용 -->
<!-- <style type="text/css">* {cursor: url(https://cur.cursors-4u.net/cursors/cur-11/cur1054.cur), auto !important;}</style><a href="https://www.cursors-4u.com/cursor/2012/02/11/chrome-pointer.html" target="_blank" title="Chrome Pointer"><img src="https://cur.cursors-4u.net/cursor.png" border="0" alt="Chrome Pointer" style="position:absolute; top: 0px; right: 0px;" /></a> -->
<!-- 마우스 애니메이션 효과 적용 -->
<script type="text/javascript">
// <![CDATA[
var colour="random"; // in addition to "random" can be set to any valid colour eg "#f0f" or "red"
var sparkles=50;

/****************************
*  Tinkerbell Magic Sparkle *
*(c)2005-13 mf2fm web-design*
*  http://www.mf2fm.com/rv  *
* DON'T EDIT BELOW THIS BOX *
****************************/
var x=ox=400;
var y=oy=300;
var swide=800;
var shigh=600;
var sleft=sdown=0;
var tiny=new Array();
var star=new Array();
var starv=new Array();
var starx=new Array();
var stary=new Array();
var tinyx=new Array();
var tinyy=new Array();
var tinyv=new Array();

window.onload=function() { if (document.getElementById) {
  var i, rats, rlef, rdow;
  for (var i=0; i<sparkles; i++) {
    var rats=createDiv(3, 3);
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    document.body.appendChild(tiny[i]=rats);
    starv[i]=0;
    tinyv[i]=0;
    var rats=createDiv(5, 5);
    rats.style.backgroundColor="transparent";
    rats.style.visibility="hidden";
    rats.style.zIndex="999";
    var rlef=createDiv(1, 5);
    var rdow=createDiv(5, 1);
    rats.appendChild(rlef);
    rats.appendChild(rdow);
    rlef.style.top="2px";
    rlef.style.left="0px";
    rdow.style.top="0px";
    rdow.style.left="2px";
    document.body.appendChild(star[i]=rats);
  }
  set_width();
  sparkle();
}}

function sparkle() {
  var c;
  if (Math.abs(x-ox)>1 || Math.abs(y-oy)>1) {
    ox=x;
    oy=y;
    for (c=0; c<sparkles; c++) if (!starv[c]) {
      star[c].style.left=(starx[c]=x)+"px";
      star[c].style.top=(stary[c]=y+1)+"px";
      star[c].style.clip="rect(0px, 5px, 5px, 0px)";
      star[c].childNodes[0].style.backgroundColor=star[c].childNodes[1].style.backgroundColor=(colour=="random")?newColour():colour;
      star[c].style.visibility="visible";
      starv[c]=50;
      break;
    }
  }
  for (c=0; c<sparkles; c++) {
    if (starv[c]) update_star(c);
    if (tinyv[c]) update_tiny(c);
  }
  setTimeout("sparkle()", 40);
}

function update_star(i) {
  if (--starv[i]==25) star[i].style.clip="rect(1px, 4px, 4px, 1px)";
  if (starv[i]) {
    stary[i]+=1+Math.random()*3;
    starx[i]+=(i%5-2)/5;
    if (stary[i]<shigh+sdown) {
      star[i].style.top=stary[i]+"px";
      star[i].style.left=starx[i]+"px";
    }
    else {
      star[i].style.visibility="hidden";
      starv[i]=0;
      return;
    }
  }
  else {
    tinyv[i]=50;
    tiny[i].style.top=(tinyy[i]=stary[i])+"px";
    tiny[i].style.left=(tinyx[i]=starx[i])+"px";
    tiny[i].style.width="2px";
    tiny[i].style.height="2px";
    tiny[i].style.backgroundColor=star[i].childNodes[0].style.backgroundColor;
    star[i].style.visibility="hidden";
    tiny[i].style.visibility="visible"
  }
}

function update_tiny(i) {
  if (--tinyv[i]==25) {
    tiny[i].style.width="1px";
    tiny[i].style.height="1px";
  }
  if (tinyv[i]) {
    tinyy[i]+=1+Math.random()*3;
    tinyx[i]+=(i%5-2)/5;
    if (tinyy[i]<shigh+sdown) {
      tiny[i].style.top=tinyy[i]+"px";
      tiny[i].style.left=tinyx[i]+"px";
    }
    else {
      tiny[i].style.visibility="hidden";
      tinyv[i]=0;
      return;
    }
  }
  else tiny[i].style.visibility="hidden";
}

document.onmousemove=mouse;
function mouse(e) {
  if (e) {
    y=e.pageY;
    x=e.pageX;
  }
  else {
    set_scroll();
    y=event.y+sdown;
    x=event.x+sleft;
  }
}

window.onscroll=set_scroll;
function set_scroll() {
  if (typeof(self.pageYOffset)=='number') {
    sdown=self.pageYOffset;
    sleft=self.pageXOffset;
  }
  else if (document.body && (document.body.scrollTop || document.body.scrollLeft)) {
    sdown=document.body.scrollTop;
    sleft=document.body.scrollLeft;
  }
  else if (document.documentElement && (document.documentElement.scrollTop || document.documentElement.scrollLeft)) {
    sleft=document.documentElement.scrollLeft;
    sdown=document.documentElement.scrollTop;
  }
  else {
    sdown=0;
    sleft=0;
  }
}

window.onresize=set_width;
function set_width() {
  var sw_min=999999;
  var sh_min=999999;
  if (document.documentElement && document.documentElement.clientWidth) {
    if (document.documentElement.clientWidth>0) sw_min=document.documentElement.clientWidth;
    if (document.documentElement.clientHeight>0) sh_min=document.documentElement.clientHeight;
  }
  if (typeof(self.innerWidth)=='number' && self.innerWidth) {
    if (self.innerWidth>0 && self.innerWidth<sw_min) sw_min=self.innerWidth;
    if (self.innerHeight>0 && self.innerHeight<sh_min) sh_min=self.innerHeight;
  }
  if (document.body.clientWidth) {
    if (document.body.clientWidth>0 && document.body.clientWidth<sw_min) sw_min=document.body.clientWidth;
    if (document.body.clientHeight>0 && document.body.clientHeight<sh_min) sh_min=document.body.clientHeight;
  }
  if (sw_min==999999 || sh_min==999999) {
    sw_min=800;
    sh_min=600;
  }
  swide=sw_min;
  shigh=sh_min;
}

function createDiv(height, width) {
  var div=document.createElement("div");
  div.style.position="absolute";
  div.style.height=height+"px";
  div.style.width=width+"px";
  div.style.overflow="hidden";
  return (div);
}

function newColour() {
  var c=new Array();
  c[0]=255;
  c[1]=Math.floor(Math.random()*256);
  c[2]=Math.floor(Math.random()*(256-c[1]/2));
  c.sort(function(){return (0.5 - Math.random());});
  return ("rgb("+c[0]+", "+c[1]+", "+c[2]+")");
}
// ]]>
</script>
</body>
</html>
