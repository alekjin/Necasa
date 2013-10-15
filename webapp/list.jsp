<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>photo list</title>
</head>
<body>
<c:forEach items="${photos}" var="photo">
<a href="/board/view/${photo.id}.opo"> <img src="/images/${photo.filename}" width="400px" /><br /></a>
${photo.title} <br />
<hr/>
</c:forEach>
</body>
</html>