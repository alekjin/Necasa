<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<% session = request.getSession(false);
	if(session != null) {
		session.invalidate();
	}
%>
<html>
<head>
	<title>logout</title>
</head>
<body>
<% response.sendRedirect("/"); %>
</body>
</html>