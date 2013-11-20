<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>업로드할 사진 고르기</title>
	<link rel="stylesheet" type="text/css" href="/stylesheets/upload.css">
	<style>
	</style>
</head>

<body>
	<div id="upload_photo">
		<form name="uploadphoto" action="/board/uploading" method="POST" enctype="multipart/form-data" accept="image/gif, image/jpeg, image/png">

			<label id="choose_upload"><strong>업로드할 사진을 고르세요</strong></label> <br />
			<input name="file" type="file"> <br />
			<input name="title" type="text" placeholder="이 사진의 이름을 지어주세요."> <br />
			<textarea name="contents" rows="4" cols="40" placeholder="이 사진에 대한 코멘트를 입력하세요."></textarea> <br />
            <input name="tags" placeholder="이 사진의 태그를 정해주세요"> <br />

			<button name="upload">업로드</button>

		</form>
	</div>
</body>
</html>