<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>photo list</title>
	<link rel="stylesheet" type="text/css" href="/stylesheets/list.css">
	<style>
	</style>
	<script>
		function moveToUpload() {
			window.location = "/board/upload.opo";
		}
	</script>
</head>
<body>
<div id="bodywrap">
	<div class="photowrap">
		<form name="uploadphoto" action="/board/uploading.opo" method="POST" enctype="multipart/form-data" accept="image/gif, image/jpeg, image/png">

			<label id="choose_upload"><strong>업로드할 사진을 고르세요</strong></label> <br />
			<input name="file" type="file"> <br />
			<input name="title" type="text" placeholder="이 사진의 이름을 지어주세요."> <br />
			<textarea name="contents" rows="4" cols="40" placeholder="이 사진에 대한 코멘트를 입력하세요."></textarea> <br />
			<input name="tags" placeholder="이 사진의 태그를 정해주세요"> <br />

			<button name="upload">업로드</button>

		</form>
	</div>
	<br />
	<c:forEach items="${photos}" var="photo">
	<div class="photowrap">
	<a href="/board/view/${photo.id}.opo"> <img src="/images/${photo.filename}" width="400px" /><br /></a>
	<br />
	<p><h1>${photo.title}</h1></p>
	<br />
		<div class="contentswrap">
		<p>${photo.contents}</p>
		</div>
		<br />
			<c:forEach items="${photo.comments}" var="comment">
			<div class="commentswrap">
				${comment.userid} : ${comment.comment}
			</div>
				<hr/>
			</c:forEach>
	</div>
	<br />
	</c:forEach>
	<button onclick="moveToUpload()">새글쓰기</button>
</div>
</body>
</html>