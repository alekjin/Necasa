<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<title>NEcasa</title>
	<link rel="stylesheet" type="text/css" href="./stylesheets/index.css">
	<script>
		function submitLogin() {
			var form = document.forms['loginform'];
			form.action = "/login";
			form.submit();
		}

		function submitSignin() {
			var form = document.forms['loginform'];
			form.action = "/signin.opo";
			form.submit();
		}

		function initPage() {
			console.log('Loading Complete');
		}
		window.onload = initPage;
	</script>
</head>

<body>
	<div align="center" id="bodyWrap">
		<p><h1><div id="bigtitle">Welcome to Necasa</div></h1></p>
		<br />
		<p><h2><div id="smalltitle">World's Best Photo Storage and Tools</div></h2></p>
		<br />
		<p>
		<c:choose>
			<c:when test="${not empty sessionScope.userId}">
				Hello ${sessionScope.userId}! Welcome to Necasa
				<a href="/logout"><button>logout</button></a>
			</c:when>
			<c:otherwise>
				<form id="loginform" name="loginform" method="POST">

					<p><input name="userid" type="text" placeholder="아이디" size="10px"></p>
					<p><input name="passwd" type="password" placeholder="패스워드" size="10px"></p>
					<br />

					<input type="submit" onclick = "submitLogin();" value="Login" name="login">
					<input type="submit" onclick = "submitSignin();" value="Signin" name="signin">

				</form>
			</c:otherwise>
		</c:choose>
		</p>
		<br />
	<table id="formtable" style:width="630" >
		<tr>
		<th width="300" scope="col"><a href="/board/upload">사진 올리고 공유하기</a></th>
		<th width="300" scope="col"><a href="/board/view/main">올린 사진 감상하기</a></th>
		<th width="300" scope="col">사진 꾸미기</th>
		</tr>
		</hr>
		<tr>
		<tr>
		</td>
		</tr>
	</table>
	</div>
</body>
</html>