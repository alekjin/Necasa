<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>View</title>
	<link rel="stylesheet" type="text/css" href="/stylesheets/uploadC.css">
</head>
<body>

<%
	String photo = request.getParameter("photo");
	String photoname = request.getParameter("photoname");
	String photocomment = request.getParameter("photocomment");
%>
<div id="photofinal">
Photo : <%=photo%> <br />
PhotoName : <%=photoname%> <br />
PhotoComment : <%=photocomment%> <br />
</div>
</body>
</html>