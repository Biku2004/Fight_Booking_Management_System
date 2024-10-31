<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 20px;
        }
        .error-message {
            color: red;
            text-align: center;
            font-size: 20px;
        }
    </style>
</head>
<body>
<h2>Booking Error</h2>
<p class="error-message">
    <%= session.getAttribute("errorMessage") %>
</p>
<a href="<%= request.getContextPath() %>/home.jsp">Go Back to Home</a>
</body>
</html>