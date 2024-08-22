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
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("bg_img.jpg");
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            overflow: hidden;
            max-width: 900px;
            width: 100%;
        }

        .left {
            width: 50%;
        }

        .left img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }

        .right {
            width: 50%;
            padding: 40px;
            display: flex;
            flex-direction: column;
            justify-content: center;
        }

        .right h2 {
            margin: 0;
            font-size: 32px;
            color: #333;
        }

        .right h2 span {
            color: #4caf50; /* Green color for "started" */
        }

        .input-container {
            margin-top: 20px;
            display: flex;
            flex-direction: column;
        }

        .input-container label {
            margin-bottom: 8px;
            font-size: 16px;
            color: #333;
        }

        .input-container input[type="email"],
        .input-container input[type="password"] {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            margin-bottom: 15px;
        }

        .input-container input[type="submit"] {
            padding: 12px;
            background-color: #4caf50;
            border: none;
            border-radius: 50px;
            color: #fff;
            font-size: 18px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            margin-top: 10px;
        }

        .input-container input[type="submit"]:hover {
            background-color: #45a049;
        }

    </style>
</head>
<body>
<div class="container">
    <div class="left">
        <img src="flight2.jpg" alt="Scenic Image"/>
    </div>
    <div class="right">
        <h2>let's get <span>started</span></h2>
        <div class="input-container">
            <form action="login" method="post">
            <label for="email">Enter e-mail address: </label><br>
            <input type="email" id="email" name="email1" placeholder="abcd@gmail.com"/><br>
            <label for="password">Enter password: </label><br>
            <input type="password" id="password" name="pass1" placeholder="********"/><br>
            <input type="submit" value="Login" action="loginServlet">
            </form>
        </div>
    </div>
</div>
</body>
</html>
