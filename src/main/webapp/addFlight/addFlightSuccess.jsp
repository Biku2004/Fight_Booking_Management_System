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
      background-color: #008cba; /* Navbar background */
      padding: 15px 0; /* Padding for navbar */
    }
    nav {
      display: flex;
      justify-content: center; /* Centering nav items */
      align-items: center; /* Vertically center items */
    }
    nav a {
      text-decoration: none;
      font-size: 18px;
      color: white; /* Text color */
      padding: 10px 20px; /* Padding around links */
      margin: 0 15px; /* Margin between links */
      border-radius: 5px; /* Rounded corners */
      transition: background-color 0.3s ease; /* Smooth transition effect */
    }
    nav a:hover {
      background-color: #005f5f; /* Darker shade on hover */
    }

    .container {
      width: 80%; /* Increased width for larger screens */
      max-width: 500px; /* Set maximum width */
      background: #ffffff; /* White background for container */
      border-radius: 10px; /* Rounded corners */
      padding: 30px; /* Padding for comfort */
      box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1); /* Subtle shadow */
      text-align: center; /* Centered text */
    }
    h1 {
      font-size: 24px;
      color: #4CAF50; /* Success color */
      margin-bottom: 20px;
    }
    p {
      font-size: 16px;
      color: #333333; /* Dark text for readability */
      margin-bottom: 30px;
    }
    .btn {
      display: inline-block;
      padding: 12px 20px;
      border-radius: 5px; /* Rounded corners for buttons */
      background-color: #008cba; /* Primary button color */
      color: white; /* Button text color */
      text-decoration: none; /* Remove underline from links */
      font-size: 16px;
      font-weight: bold; /* Bold text */
      transition: background-color 0.3s ease; /* Smooth transition */
    }
    .btn:hover {
      background-color: #005f5f; /* Darker shade on hover for primary button */
    }
    .btn-secondary {
      background-color: #6c757d; /* Secondary button color */
      margin-left: 10px; /* Space between buttons */
    }
    .btn-secondary:hover {
      background-color: #5a6268; /* Darker shade on hover for secondary button */
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
