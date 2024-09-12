<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 23-08-2024
  Time: 01:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Flight Added Successfully</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #eef2f7;
      margin: 0;
      padding: 0;
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
    }
    .container {
      width: 400px;
      background: #ffffff;
      border-radius: 12px;
      padding: 30px;
      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
      text-align: center;
    }
    h1 {
      font-size: 24px;
      color: #4CAF50;
      margin-bottom: 20px;
    }
    p {
      font-size: 16px;
      color: #333333;
      margin-bottom: 30px;
    }
    .btn {
      display: inline-block;
      padding: 12px 20px;
      border-radius: 8px;
      background: #007BFF;
      color: white;
      text-decoration: none;
      font-size: 16px;
      font-weight: 600;
      transition: background 0.3s ease;
    }
    .btn:hover {
      background: #0056b3;
    }
    .btn-secondary {
      background: #6c757d;
      margin-left: 10px;
    }
    .btn-secondary:hover {
      background: #5a6268;
    }
  </style>
</head>
<body>

<div class="container">
  <h1>Success!</h1>
  <p>The flight has been added successfully.</p>
  <a href="addFlight.jsp" class="btn">Add Another Flight</a>
  <a href="../Admin/HomeAdmin.jsp" class="btn btn-secondary">Return to Admin Panel</a>
</div>

</body>
</html>
