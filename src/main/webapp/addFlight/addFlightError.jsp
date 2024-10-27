<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 23-08-2024
  Time: 01:00
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Flight Error</title>

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

<div class="error-container">
  <h1>Error Adding Flight</h1>
  <p>There was an issue while trying to add the flight. Please check the details and try again.</p>

  <!-- Optionally display specific error messages -->
  <% if (request.getAttribute("errorMessage") != null) { %>
  <p><strong><%= request.getAttribute("errorMessage") %></strong></p>
  <% } %>

  <a class="back-button" href="../Admin/HomeAdmin.jsp">Go Back</a>
</div>
</body>
</html>




























<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <title>Error Adding Flight</title>--%>
<%--  <style>--%>
<%--    body {--%>
<%--      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--%>
<%--      background-color: #eef2f7;--%>
<%--      margin: 0;--%>
<%--      padding: 0;--%>
<%--      display: flex;--%>
<%--      justify-content: center;--%>
<%--      align-items: center;--%>
<%--      height: 100vh;--%>
<%--    }--%>
<%--    .container {--%>
<%--      background: #ffffff;--%>
<%--      border-radius: 12px;--%>
<%--      padding: 30px;--%>
<%--      box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);--%>
<%--      text-align: center;--%>
<%--    }--%>
<%--    h1 {--%>
<%--      font-size: 24px;--%>
<%--      color: #d9534f;--%>
<%--      margin-bottom: 20px;--%>
<%--    }--%>
<%--    p {--%>
<%--      font-size: 18px;--%>
<%--      color: #333333;--%>
<%--    }--%>
<%--    a {--%>
<%--      display: inline-block;--%>
<%--      margin-top: 20px;--%>
<%--      padding: 10px 20px;--%>
<%--      background: #007BFF;--%>
<%--      color: white;--%>
<%--      text-decoration: none;--%>
<%--      border-radius: 8px;--%>
<%--      transition: background 0.3s ease;--%>
<%--    }--%>
<%--    a:hover {--%>
<%--      background: #0056b3;--%>
<%--    }--%>
<%--  </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<div class="container">--%>
<%--  <h1>Failed to Add Flight</h1>--%>
<%--  <p>There was an error while processing your request. Please try again later.</p>--%>
<%--  <a href="../addFlight/addFlight.jsp">Go Back to Add Flight</a>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>

