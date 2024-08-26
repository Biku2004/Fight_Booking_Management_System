<%--
  Created by IntelliJ IDEA.
  User: rbstu
  Date: 25-08-2024
  Time: 19:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        .form-container {
            background-color: #fff;
            border: 1px solid #e0e0e0;
            border-radius: 8px;
            padding: 20px;
            max-width: 500px;
            text-align: center;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .form-container input[type="email"] {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }
        .form-container input[type="submit"] {
            background-color: #d9534f;
            color: #fff;
            border: none;
            cursor: pointer;
            padding: 15px;
            border-radius: 4px;
            font-size: 16px;
            width: 100%;
        }
        .form-container input[type="submit"]:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
<div class="form-container">
    <h1>Delete Admin</h1>
    <form action="deleteAdmin" method="post">
        <input type="email" name="email1" placeholder="Enter Admin Email" required/>
        <input type="submit" value="Delete"/>
    </form>
</div>
</body>
</html>
