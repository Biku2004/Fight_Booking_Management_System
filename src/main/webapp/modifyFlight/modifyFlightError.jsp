<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 25-08-2024
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flight Modification Error</title>
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
    <h1>Error Modifying Flight!</h1>
    <p>There was an issue while trying to modify the flight details. Please check the information and try again.</p>

    <%-- Optionally display specific error messages --%>
    <% if (request.getAttribute("errorMessage") != null) { %>
    <p><strong><%= request.getAttribute("errorMessage") %></strong></p>
    <% } %>

    <a class="button" href="modifyFlight.jsp">Try Again</a>
    <a class="button" href="../Admin/HomeAdmin.jsp">Return to Dashboard</a>
</div>

</body>
</html>
