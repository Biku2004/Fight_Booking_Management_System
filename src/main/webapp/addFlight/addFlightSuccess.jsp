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
  <link rel="stylesheet" href="">
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
