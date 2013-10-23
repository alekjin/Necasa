<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>Sign in</title>
</head>
<body>
<form name="signinform" action="/signing.opo" method="POST">
	<p><label id="signin_lable"><strong>가입 하세요</strong></label></p>
	<p>ID :
		<input name="userid" type="text" placeholder="ID" size="10px"></p>
	<p>PASSWD :
		<input name="passwd" type="password" placeholder="******" size="10px"></p>
	<p><button name="signin">Signin</button></p>
</form>
</body>
</html>