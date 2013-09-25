<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
	<title>View</title>
</head>
<body>

<%
	String photo = request.getParameter("photo");
	String photoname = request.getParameter("photoname");
	String photocomment = request.getParameter("photocomment");
%>

Photo : <%=photo%> <br />
PhotoName : <%=photoname%> <br />
PhotoComment : <%=photocomment%> <br />

</body>
</html>