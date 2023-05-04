<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<jsp:include page="../Common/Link.jsp" />
<link rel="stylesheet" type="text/css" href="../Style/company.css">
<meta charset="UTF-8">
<title>회의실 예약시스템</title>
</head>

<body>
<aside>
    <jsp:include page="../LogIn/LoginForm.jsp" />
</aside>
<div style="height: 200px;"></div>
<article>
	<div class="image-container">
		<img src="daewoo.jpg" width="600" height="300">
	</div>
	<div class="edit-container">
	    <p id="dt">저희 건물은 대우직업능력개발원이며 1995년에 설립이 되었습니다.<br></p>
	    <p id="dt">그러나 회의실 시스템은 이번 2023년 5월에 만들어 졌으며</p>
	    <p id="dt">모두에게 질좋은 회의실을 제공합니다.</p>
	</div>
</article>
<jsp:include page="../Common/afooter.jsp" />
<script src="../Common/link.js"></script>
</body>
</html>