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
    <link rel="stylesheet" href="../cssFile/styles.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f0ff; /* Background color */
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
            max-width: 600px; /* Set maximum width */
            margin: auto; /* Center the container */
            background-color: #fff; /* White background for container */
            border-radius: 10px; /* Rounded corners */
            padding: 30px; /* Padding for comfort */
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1); /* Subtle shadow */
        }

        h2 {
            text-align: center;
            color: #333333; /* Heading color */
        }

        table {
            width: 100%; /* Full width table */
            margin-top: 20px;
            border-collapse: collapse; /* Collapse borders for cleaner look */
        }

        th, td {
            padding: 10px; /* Padding for table cells */
            text-align: left; /* Left align text in cells */
            border-bottom: 1px solid #ddd; /* Bottom border for rows */
        }

        th {
            background-color: #f2f2f2; /* Light gray background for headers */
        }

        a.modify-button {
            display: inline-block;
            padding: 5px 10px;
            color: white;
            background-color: #008cba; /* Button color */
            text-decoration: none;
            border-radius: 5px;
        }

        a.modify-button:hover {
            background-color: #005f5f; /* Darker shade on hover for button */
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
            <td><%= flight.getFlight_number() %></td>
            <td><%= flight.getAirline() %></td>
            <td><%= flight.getDepartureName() %></td>
            <td><%= flight.getArrivalName() %></td>
            <td><%= flight.getPrice() %></td>
            <td>
                <!-- Form to send the flight number -->
                <form action="${pageContext.request.contextPath}/ModifyFlightServlet" method="post">
                    <input type="hidden" name="flight_number" value="<%= flight.getFlight_number() %>">
                    <input type="hidden" name="action" value="search">
                    <button type="submit">Modify</button>
                </form>
            </td>
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
