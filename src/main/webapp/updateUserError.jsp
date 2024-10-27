<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .error-container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            text-align: center;
            padding: 30px;
            max-width: 400px;
            width: 100%;
        }
        h1 {
            color: #e74c3c;
            font-size: 36px;
            margin-bottom: 20px;
        }
        p {
            color: #333;
            font-size: 18px;
            margin-bottom: 30px;
        }
        a {
            text-decoration: none;
            color: #3498db;
            font-size: 16px;
            background-color: #ecf0f1;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }
        a:hover {
            background-color: #3498db;
            color: #fff;
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>Error</h1>
    <p><%= request.getAttribute("message") %></p>
    <a href="login/home.jsp">Go Back</a>
</div>
</body>
</html>
