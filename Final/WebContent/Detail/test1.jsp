<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<c:forEach items="${DetailReview}" var="n">
	<div class="card" style="width: 18rem; border: 1px solid black;">
					  <div class="card-body">
					    <h5 class="card-title">${ n.nik }</h5>
					    <h6 class="card-subtitle mb-2 text-muted">------------</h6>
					    <p class="card-text">${n.recontent}</p>
					  </div>
					</div>
	</c:forEach>


</body>
</html>