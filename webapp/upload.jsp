<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>업로드할 사진 고르기</title>
	<link rel="stylesheet" type="text/css" href="./stylesheets/upload.css">
</head>

<body>
	<div id="uploadphoto">
		<form name="uploadphoto"
		      action="/board/upload_complete.opo" method="POST">

			<label id="chooseupload">
				<strong>업로드할 사진을 고르세요</strong>
			</label> <br />
			<%--<canvas name="photo" width="400px" height="400px"></canvas> <br />--%>

			<input name="photo" type="file"> <br />
			<input name="photoname" type="text" value="사진의 이름을 입력하세요."> <br />

			<textarea name="photocomment" rows="4" cols="40">이 사진에 대한 코멘트를 입력하세요.</textarea> <br />
			<button name="upload">업로드</button>

		</form>
	</div>
</body>
</html>