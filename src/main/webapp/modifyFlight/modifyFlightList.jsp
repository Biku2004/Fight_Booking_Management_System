<%@ page import="com.flight.flight_booking_management_system.AdminFunctions.ModifyFlight" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 02-11-2024
  Time: 09:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Modify Flight</title>
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
    <h2>Available Flights</h2>

    <% List<ModifyFlight> flights = (List<ModifyFlight>) request.getAttribute("flights"); %>

    <% if (flights != null && !flights.isEmpty()) { %>
    <table>
        <tr>
            <th>Flight Number</th>
            <th>Airline</th>
            <th>Departure Name</th>
            <th>Arrival Name</th>
            <th>Price</th>
            <th>Action</th>
        </tr>

        <% for (ModifyFlight flight : flights) { %>
        <tr>
            <td><%= flight.getFlightNumber() %></td>
            <td><%= flight.getAirline() %></td>
            <td><%= flight.getDepartureName() %></td>
            <td><%= flight.getArrivalName() %></td>
            <td><%= flight.getPrice() %></td>
            <td><a href="modifySingleFlight.jsp?flightNumber=<%= flight.getFlightNumber() %>">Modify</a></td> <!-- Link to modify -->
        </tr>
        <% } %>
    </table>

    <% } else { %>
    <p>No flights available to modify.</p>
    <% } %>

    <!-- Back link -->
    <a href="${pageContext.request.contextPath}/modifyFlight.jsp">Back to Search</a>
</div>

</body>
</html>
