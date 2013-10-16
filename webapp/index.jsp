<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>NEcasa</title>
	<link rel="stylesheet" type="text/css" href="/stylesheets/index.css">
	<script src="/javascripts/head.js"></script>
</head>

<body>

	<div id="title">
		<ul style="list-style: none;">
			<li><a href="/board/upload.opo">사진 올리고 공유하기</a></li>
			<li><a href="/board/view/main.opo">올린 사진 감상하기</a></li>
			<li>사진 꾸미기</li>
		</ul>
		<hr/>

		<form name="loginform" action="/login.opo" method="POST">

			<label id="login_label"><strong>로그인 하세요</strong></label> <br />
			<input name="userid" type="text" placeholder="ID">
			<input name="passwd" type="password" placeholder="******"> <br />

			<button name="login">Login</button>

		</form>
		<hr/>
		signin
		<form name="signinform" action="/signing.opo" method="POST">

			<label id="signin_lable"><strong>가입 하세요</strong></label> <br />
			<input name="userid" type="text" placeholder="ID">
			<input name="passwd" type="password" placeholder="******"> <br />

			<button name="signin">Signin</button>

		</form>
	</div>

	<div id="a">
	</div>

	<div id="b">
	</div>

</body>
</html>