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
            background-image: url("../bg_img.jpg");
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            background-size: cover;
        }

        .container {
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            display: flex;
            overflow: hidden;
            max-width: 900px;
            width: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
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
            font-size: 2.5em;
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
            font-size: 1.1em;
            color: #333;
        }

        .input-container input[type="email"],
        .input-container input[type="password"] {
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            margin-bottom: 15px;
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
        }

        .input-container input[type="email"]:focus,
        .input-container input[type="password"]:focus {
            outline: none;
            border-color: #2b92ae; /* Custom border color */
            box-shadow: 0 0 5px rgba(27, 138, 255, 0.5);
        }

        .input-container input[type="email"]:hover,
        .input-container input[type="password"]:hover {
            border-color: #41d4ff; /* Change border on hover */
            transform: scale(1.02); /* Slightly scale the element */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        .input-container input[type="submit"] {
            padding: 12px;
            background-color: #2c3e50;
            border: none;
            border-radius: 50px;
            color: #fff;
            font-size: 1em;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
            margin-top: 10px;
            text-transform: uppercase;
            font-weight: bold;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .input-container input[type="submit"]:hover {
            background-color: #1a252f;
            transform: scale(1.05);
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.3);
        }

        .input-container input[type="submit"]:active {
            background-color: #16202a;
            transform: scale(1);
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2);
        }

    </style>
</head>
<body>
<div class="container">
    <div class="left">
        <img src="../video/flight2.jpg" alt="Scenic Image"/>
    </div>
    <div class="right">
        <h2>Let's get <span>started</span></h2>
        <div class="input-container">
            <form action="${pageContext.request.contextPath}/login" method="post">
                <label for="email">Enter e-mail address: </label><br>
                <input type="email" id="email" name="email1" placeholder="abcd@gmail.com" required/><br>
                <label for="password">Enter password: </label><br>
                <input  type="password" id="password" name="pass1" placeholder="********" required/><br>
                <input type="submit" value="Login">
            </form>
        </div>
    </div>
</div>
</body>
</html>
