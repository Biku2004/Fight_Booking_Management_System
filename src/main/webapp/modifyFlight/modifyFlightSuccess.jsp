<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 25-08-2024
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flight Modification Success</title>
    <link rel="stylesheet" href="../cssFile/styles.css"> <!-- Link to your CSS file -->

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
    <h1>Flight Modification Successful!</h1>
    <p>The flight details have been successfully updated in the database.</p>
    <a class="button" href="../Admin/HomeAdmin.jsp">Return to Dashboard</a>
    <a class="button" href="modifyFlight.jsp">Modify Another Flight</a>
</div>

</body>
</html>



