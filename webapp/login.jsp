<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Login</title>
</head>
<body>
	<div id = "loginform">
		<form name="loginform" action="/board/login.opo" method="POST">

			<label id="login_label"><strong>로그인 하세요</strong></label> <br />
			<input name="userid" type="text" placeholder="ID">
			<input name="passwd" type="password" placeholder="******"> <br />

		<button name="login">Login</button>

		</form>
	</div>
</body>
</html>