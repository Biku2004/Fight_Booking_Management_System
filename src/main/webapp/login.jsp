<%--
  Created by IntelliJ IDEA.
  User: rbstu
  Date: 11-08-2024
  Time: 10:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Flight Booking Management System - Login</title>
    <link rel="stylesheet" type="text/css" href="login.css">
</head>
<body>
<div class="login-container">
    <h2>Login</h2>
    <form action="login" method="post">
        Enter Your Registered Email : <input type="email" name="email1"/><br>
        Enter Your Password : <input type="password" name="pass1"/><br>
        <input type="submit" value="Login" action="loginServlet">
    </form>
    <a href="Registration.jsp">Register Here</a>
</div>
</body>
</html>
