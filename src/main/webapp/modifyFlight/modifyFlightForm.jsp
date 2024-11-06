<%@ page import="com.flight.flight_booking_management_system.AdminFunctions.ModifyFlight" %><%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 01-11-2024
  Time: 20:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modify Flight Details</title>
    <link rel="stylesheet" href="../cssFile/styles.css">
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
    <h2>Modify Flight Details</h2>

    <!-- Modify Flight Form -->
    <% List<ModifyFlight> flights = (List<ModifyFlight>) request.getAttribute("flights"); %>

    <% if (flights != null && !flights.isEmpty()) { %>
    Flight flight = flights.get(0); // Assuming we modify only one flight at a time
    %>

    <form action="${pageContext.request.contextPath}/ModifyFlightServlet" method="post">
        <!-- Hidden field to pass flight ID -->
        <input type="hidden" name="flightId" value="<%= flight.getId() %>">

        <!-- Display fields with existing data -->
        <label for="flightNumber">Flight Number:</label>
        <input type="text" id="flightNumber" name="flightNumber" value="<%= flight.getFlightNumber() %>" required>

        <!-- Add other fields similarly -->
        <!-- Example fields -->
        <label for="airline">Airline:</label>
        <input type="text" id="airline" name="airline" value="<%= flight.getAirline() %>" required>

        <!-- Additional fields as needed -->

        <input type="submit" value="Update Flight">
    </form>

    <% } else { %>
    <p>No flights available to modify.</p>
    <% } %>

    <!-- Back link -->
    <a href="${pageContext.request.contextPath}/modifyFlight.jsp">Back to Search</a>
</div>

</body>
</html>