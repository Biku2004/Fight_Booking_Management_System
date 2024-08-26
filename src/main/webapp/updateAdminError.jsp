<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
</head>
<body>
<h1>Error</h1>
<p><%= request.getAttribute("message") %></p>
<a href="emailAuthentication.jsp">Go Back</a>
</body>
</html>
