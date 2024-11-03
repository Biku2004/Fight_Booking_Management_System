<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 23-08-2024
  Time: 01:50
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flight Added Successfully</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #e6f0ff;
      margin: 0;
      padding: 0;
    }
    header {
      background-color: #008cba;
      padding: 15px 0;
    }
    nav {
      display: flex;
      justify-content: center;
      align-items: center;
    }
    nav a {
      text-decoration: none;
      font-size: 18px;
      color: white;
      padding: 10px 20px;
      margin: 0 15px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }
    nav a:hover {
      background-color: #005f5f;
    }

    .container {
      width: 80%;
      max-width: 500px;
      background: #ffffff;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
      text-align: center;
      margin: auto;
      margin-top: 50px;
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
      border-radius: 5px;
      background-color: #008cba;
      color: white;
      text-decoration: none;
      font-size: 16px;
      font-weight: bold;
      transition: background-color 0.3s ease;
    }
    .btn:hover {
      background-color: #005f5f;
    }
    .btn-secondary {
      background-color: #6c757d;
      margin-left: 10px;
    }
    .btn-secondary:hover {
      background-color: #5a6268;
    }
  </style>
</head>

<body>

<header>
  <nav>
    <a href="../Admin/HomeAdmin.jsp">SkyWay</a>
    <a href="../ViewPassenger/searchBooking.jsp">Passenger</a>
    <a href="../bookFlight/tickets.jsp">Ticket</a>
    <a href="../Admin/adminregd.jsp">Admin</a>
    <a href="../Admin/adminDelete.jsp">Delete Admin</a>
  </nav>
</header>

<div class="container">
  <h1>Success!</h1>
  <p>The flight has been added successfully.</p>
  <a href="../addFlight/addFlight.jsp" class="btn">Add Another Flight</a>
  <a href="../Admin/HomeAdmin.jsp" class="btn btn-secondary">Return to Admin Panel</a>
</div>
</body>
</html>
