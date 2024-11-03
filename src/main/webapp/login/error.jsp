<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8d7da;
            color: #721c24;
            text-align: center;
            margin-top: 50px;
        }
        .container {
            background-color: #f5c6cb;
            border: 1px solid #f5c6cb;
            padding: 20px;
            border-radius: 5px;
            display: inline-block;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h1 {
            font-size: 24px;
        }
        p {
            font-size: 18px;
        }
        a {
            color: #0056b3;
            text-decoration: none;
            font-weight: bold;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Email ID and Password Mismatch</h1>
    <p>It seems that the email ID or password you entered is incorrect. Please check your credentials and try again.</p>
    <p><a href="login.jsp">Back to Login</a></p>
</div>
</body>
</html>
