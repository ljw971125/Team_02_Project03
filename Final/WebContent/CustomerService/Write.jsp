<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./IsLoggedIn.jsp"%> <!--로그인 확인-->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<jsp:include page="/Common/header.jsp" />
<title>문의 게시판</title>
</head>
<body>

<div style="height: 200px;"></div>

<h2><a href="<%=request.getContextPath() %>/CustomerService/InquiryMain.jsp" class="my_inquiry">문의 게시판</a> - 글쓰기(Write)</h2>
<article>
	<form name="writeFrm" method="post" action="WriteProcess.jsp"
	      onsubmit="return validateForm(this);">
	    <table class="table table-striped-columns table-success 
    				table-bordered border-dark table-hover" width="90%">
	        <tr>
	            <td>제목</td>
	            <td>
	                <input type="text" class="form-control" placeholder="제목을 입력해주세요." name="title" style="width: 90%;" />
	            </td>
	        </tr>
	        <tr>
	            <td>내용</td>
	            <td>
	                <textarea class="form-control" placeholder="내용을 입력해주세요." name="icontent" style="width: 90%; height: 100px;"></textarea>
	            </td>
	        </tr>
	        <tr>
	            <td colspan="2" align="center">
	                <button type="submit" class="btn btn-secondary btn-lg">작성 완료</button>
	                <button type="reset" class="btn btn-secondary btn-lg">다시 입력</button>
	                <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='InquiryMain.jsp';">
	                    목록 보기</button>
	            </td>
	        </tr>
	    </table>
	</form>
</article>
<div style="height: 20px;"></div>
<jsp:include page="/Common/rfooter.jsp" />
<script src="/Final1/js/header.js"></script> 
<script src="/Final1/js/CS.js"></script> 
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
</body>
</html>