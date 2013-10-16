<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>Login</title>
</head>
<body>
	<div id = "loginform">
		<c:choose>
			<c:when test="${not empty sessionScope.userId}">
				You already login
			</c:when>
			<c:otherwise>
				<form name="loginform" action="/login" method="POST">

					<label id="login_label"><strong>로그인 하세요</strong></label> <br />
					<input name="userid" type="text" placeholder="ID">
					<input name="passwd" type="password" placeholder="******"> <br />

					<button name="login">Login</button>

				</form>
			</c:otherwise>
		</c:choose>

	</div>
</body>
</html>