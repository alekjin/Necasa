<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>show</title>
	<link rel="stylesheet" type="text/css" href="/stylesheets/view.css">
	<script>
		function countComments() {
			commentsList = document.querySelectorAll('.commentswrap');
			for (var i = 0 ; i < commentsList.length ; i++) {
				var currentNode = commentsList[i];
				var nCommentCount = currentNode.querySelectorAll('.commentwrap').length;
				return nCommentCount;
			}
		}

		function insertCommentsCount() {
			var count = countComments();
			document.getElementById("comment_number").innerHTML = "Comments : " + count;
		}
	</script>
</head>
<body>
<p> 제목 : ${photo.title} </p>
<p> 내용 : ${photo.contents} </p>
<p> 사진 이름 : ${photo.filename} </p>
<p><a href="/board/view/main"> 목록으로 돌아가기 <- </a></p>
<img src="/images/${photo.filename}" />
<c:choose>
	<c:when test="${not empty sessionScope.userId}">
		<div class="comment_write">
			<form class="commentWrite" action="/board/view/${photo.id}/comment" method="post">
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
	<div id="comment_number">
	</div>
	<div class="commentswrap">
		<c:forEach items="${photo.comments}" var="comment">
			<div class="commentwrap">
				<p>${comment.userid} : ${comment.comment}</p>
			</div>
			<hr/>
		</c:forEach>
	</div>
</div>
</body>
</html>