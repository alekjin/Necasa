<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
	<title>NEcasa</title>
	<link rel="stylesheet" type="text/css" href="/stylesheets/index.css">
	<script src="/javascripts/head.js"></script>
</head>

<body>

		<div id="bigtitle">Welcome to Necasa</div>
		<div id="smalltitle">World's Best Photo Storage and Tools</div>
		<p>
		<c:choose>
			<c:when test="${not empty sessionScope.userId}">
				Hello ${sessionScope.userId}! Welcome to Necasa
				<a href="/logout.opo"><button>logout</button></a>
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
		</p>


	<table id="formtable" style:width="630" >
		<tr>
		<th width="300" scope="col"><a href="/board/upload.opo">사진 올리고 공유하기</a></th>
		<th width="300" scope="col"><a href="/board/view/main.opo">올린 사진 감상하기</a></th>
		<th width="300" scope="col">사진 꾸미기</th>
		</tr>
		</hr>
		<tr>
		<td colspan="3"><p><div id="joinus">Join us</div></p>
		<form name="signinform" action="/signing.opo" method="POST">
		<p><label id="signin_lable"><strong>가입 하세요</strong></label></p>
		<p>아이디 : <input name="userid" type="text" placeholder="ID"></p>
		<p>암호 : <input name="passwd" type="password" placeholder="******"></p>
		<p><button name="signin">Signin</button></p>
		</form>
		</td>
		</tr>
	</table>
</body>
</html>