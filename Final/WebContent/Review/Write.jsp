<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<link href="../CSS/review.css" rel="stylesheet" type="text/css">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<!-- 부트스트랩 사용하기 위해 -->

<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>게시판 글쓰기 페이지</title>

</head>

<body>

<form method="post" action="contentWriteProcess.jsp">

<div class="container">

  <h2>게시판 글쓰기</h2>          

  <table class="table table-hover">

    <tbody>


      <tr>

      	<td><textarea type="text" class="form-control" placeholder="글 내용을 작성하세요" name="contentDetail" maxlength="1024" style="height: 400px;"></textarea></td>

      </tr>

		<tr>
		<td>
			<div class="star-rating">
		  <input type="radio" id="5-stars" name="rating" value="5" />
		  <label for="5-stars" class="star">&#9733;</label>
		  <input type="radio" id="4-stars" name="rating" value="4" />
		  <label for="4-stars" class="star">&#9733;</label>
		  <input type="radio" id="3-stars" name="rating" value="3" />
		  <label for="3-stars" class="star">&#9733;</label>
		  <input type="radio" id="2-stars" name="rating" value="2" />
		  <label for="2-stars" class="star">&#9733;</label>
		  <input type="radio" id="1-star" name="rating" value="1" />
		  <label for="1-star" class="star">&#9733;</label>
		</div>
        </td>
        </tr>
      
    </tbody>

  </table>

  <input type="submit" class="btn btn-primary pull-right" value="글쓰기">

</div>

</form>

</body>

</html>