<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>show</title>
</head>
<body>
<p> 제목 : ${photo.title} </p>
<p> 내용 : ${photo.contents} </p>
<p> 사진 이름 : ${photo.filename} </p>
<p> 태그 : ${photo.tags} </p>
<p><a href="/board/view/main.opo"> 목록으로 돌아가기 <- </a></p>
<img src="/images/${photo.filename}" />
</body>
</html>