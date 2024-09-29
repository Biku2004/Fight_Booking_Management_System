<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Deletion Result</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .message-container {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            padding: 30px;
            width: 100%;
            max-width: 450px;
            text-align: center;
            box-sizing: border-box;
        }
        .message-container h1 {
            color: #333;
            font-size: 28px;
            margin-bottom: 15px;
        }
        .message-container p {
            color: #555;
            font-size: 18px;
            margin-bottom: 25px;
            line-height: 1.6;
        }
        .message-container a {
            display: inline-block;
            text-decoration: none;
            color: #007bff;
            font-weight: 600;
            border: 2px solid #007bff;
            border-radius: 6px;
            padding: 12px 20px;
            transition: all 0.3s ease;
            font-size: 16px;
        }
        .message-container a:hover {
            background-color: #007bff;
            color: #ffffff;
            border-color: #007bff;
        }
    </style>
</head>
<body>
<div class="message-container">
    <h1>Deletion Result</h1>
    <p>${message}</p>
    <a href="./Admin/HomeAdmin.jsp">Back To Home 🏠</a>
</div>
</body>
</html>
