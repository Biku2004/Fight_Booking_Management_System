<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 22-08-2024
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-image: url("bg_img.jpg");
            margin: 0;
            padding: 0;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
            gap: 20px;
            padding: 20px;
            max-width: 1000px;
            margin: auto;
        }

        .box {
            padding: 30px;
            background-image: linear-gradient(135deg, #667eea 0%, #764ba2 100%);
            border-radius: 12px;
            text-align: center;
            font-size: 18px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
            color: #fff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            cursor: pointer;
            position: relative;
            overflow: hidden;
        }

        .box::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.1);
            transition: opacity 0.3s ease;
            opacity: 0;
            z-index: 1;
        }

        .box:hover::before {
            opacity: 1;
        }

        .box a {
            text-decoration: none;
            color: inherit;
            display: block;
            z-index: 2;
            position: relative;
        }

        .box:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
        }

        .box h3 {
            margin: 0;
            font-size: 22px;
            font-weight: 600;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="box">
        <a href="adminregd.jsp"><h3>Add Admin</h3></a>
    </div>
    <div class="box">
        <a href="adminDelete.jsp"><h3>Delete Admin</h3></a>
    </div>
    <div class="box">
        <a href=""><h3>Update Admin</h3></a>
    </div>
    <div class="box">
        <a href=""><h3>View Admin</h3></a>
    </div>
    <div class="box">
        <a href="addFlight.jsp"><h3>Add Flight</h3></a>
    </div>
    <div class="box">
        <a href="modifyFlight.jsp"><h3>Modify Flight</h3></a>
    </div>
    <div class="box">
        <a href=""><h3>Delete Flight</h3></a>
    </div>
    <div class="box">
        <a href=""><h3>Seat Info</h3></a>
    </div>
    <div class="box">
        <a href=""><h3>Passenger Info</h3></a>
    </div>
</div>
</body>
</html>
