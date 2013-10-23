<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>show</title>
	<link rel="stylesheet" type="text/css" href="./stylesheets/view.css">
</head>
<body>
<p> 제목 : ${photo.title} </p>
<p> 내용 : ${photo.contents} </p>
<p> 사진 이름 : ${photo.filename} </p>
<p><a href="/board/view/main.opo"> 목록으로 돌아가기 <- </a></p>
<img src="/images/${photo.filename}" />
<c:choose>
	<c:when test="${not empty sessionScope.userId}">
		<div id="comment_write">
			<form id="commentWrite" action="/board/view/${photo.id}/comment" method="post">
			<p>Comment : </p>
			<p><textarea name="comment"></textarea></p>
			<p><input type="submit"> </p>
			</form>
		</div>
	</c:when>
	<c:otherwise>
	</c:otherwise>
</c:choose>


<div id="comment_view">
	<c:forEach items="${photo.comments}" var="comment">
	${comment.userid} : ${comment.comment}
	<hr/>
	</c:forEach>
</div>
</body>
</html>