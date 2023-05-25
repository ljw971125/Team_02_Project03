<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<jsp:include page="IsLoggedIn.jsp" />
  <title>문의 사항 답변하기</title>
  <script type="text/javascript">
    function validateForm(form) {  // 필수 항목 입력 확인
        if (form.icomment.value == "") {
            alert("답변을 입력하세요.");
            form.icomment.focus();
            return false;
        }
    }
</script>
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
  
  <form name="writeFrm" method="post"
      action="../mvc2/answer.do" onsubmit="return validateForm(this);">
<input type="hidden" name="num" value="${ dto.num }"/>
<table class="table table-striped-columns table-success 
    				table-bordered border-dark table-hover" >

    <tr>
        <td>
            <textarea class="form-control" placeholder="답변을 입력해주세요." name="icomment" style="width:90%;height:100px;"></textarea>
        </td>
        
    </tr>
    <tr>
        <td colspan="2" align="center">
            <button type="submit" class="btn btn-secondary btn-lg">작성 완료</button>
            <button type="reset" class="btn btn-secondary btn-lg">RESET</button>
            <button type="button" class="btn btn-secondary btn-lg" onclick="location.href='../mvc2/inquirylist.do';">
                목록 바로가기
            </button>
        </td>
    </tr>
</table>    
</form>
  </article>
  </section>
  <aside>
  </aside>
  </main>
</body>
</html>