<%--&lt;%&ndash;--%>
<%--  Created by IntelliJ IDEA.--%>
<%--  User: Atkum--%>
<%--  Date: 25-08-2024--%>
<%--  Time: 19:43--%>
<%--  To change this template use File | Settings | File Templates.--%>
<%--&ndash;%&gt;--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Delete Flight</title>--%>
<%--    <link rel="stylesheet" href="../cssFile/deleteflightStyle.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--    <h1>Delete Flight</h1>--%>
<%--    <div class="container">--%>
<%--        <h1>Delete Flight</h1>--%>
<%--        <form action="<%= request.getContextPath() %>/deleteFlight1" method="post">--%>
<%--            <div class="form-group">--%>
<%--                <label for="flight_number">Flight Number:</label>--%>
<%--                <input type="text" id="flight_number" name="flight_number" required>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="departure_time">Departure Date and Time:</label>--%>
<%--                <input type="datetime-local" id="departure_time" name="departure_time" required>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="arrivalTime">Arrival Date and Time:</label>--%>
<%--                <input type="datetime-local" id="arrivalTime" name="arrivalTime" required>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <button type="submit" class="btn">Delete Flight</button>--%>
<%--            </div>--%>
<%--        </form>--%>

<%--    &lt;%&ndash; Display success or error messages based on request parameters &ndash;%&gt;--%>
<%--    <%--%>
<%--        String message = request.getParameter("message");--%>
<%--        if (message != null) {--%>
<%--    %>--%>
<%--    <div class="<%= message.equals("success") ? "success" : "error" %>">--%>
<%--        <%= message.equals("success") ? "Flight deleted successfully!" : "Failed to delete flight. Please try again." %>--%>
<%--    </div>--%>
<%--    <% } %>--%>

<%--    <a href="../index.jsp">Back to Home</a>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page import="com.flight.flight_booking_management_system.AdminFunctions.DeleteFlight" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Flight</title>
    <link rel="stylesheet" href="<%= request.getContextPath() %>/cssFile/deleteflightStyle.css">
</head>
<body>
<h1>Delete Flight</h1>
<div class="container">
    <form id="searchForm" action="<%= request.getContextPath() %>/deleteFlight1" method="get">
        <div class="form-group">
            <label for="flight_number">Flight Number:</label>
            <input type="text" id="flight_number" name="flight_number" required>
            <button type="submit" class="btn">Search</button>
        </div>
    </form>

    <div id="flightTableContainer">
        <table id="flightTable" style="<%= (request.getAttribute("flights") != null) ? "display: table;" : "display: none;" %>">
            <thead>
            <tr>
                <th>Flight Number</th>
                <th>Departure Time</th>
                <th>Arrival Time</th>
                <th>Action</th>
            </tr>
            </thead>
            <tbody>
            <%
                List<DeleteFlight> flights = (List<DeleteFlight>) request.getAttribute("flights");
                if (flights != null) {
                    for (DeleteFlight flight : flights) {
            %>
            <tr>
                <td><%= flight.getFlightNumber() %></td>
                <td><%= flight.getDepartureTime() %></td>
                <td><%= flight.getArrivalTime() %></td>
                <td>
                    <form action="<%= request.getContextPath() %>/deleteFlight1" method="post">
                        <input type="hidden" name="flight_number" value="<%= flight.getFlightNumber() %>">
                        <input type="hidden" name="departure_time" value="<%= flight.getDepartureTime() %>">
                        <input type="hidden" name="arrivalTime" value="<%= flight.getArrivalTime() %>">
                        <button type="submit" class="btn">Delete</button>
                    </form>
                </td>
            </tr>
            <%
                    }
                }
            %>
            </tbody>
        </table>
    </div>

    <a href="../index.jsp">Back to Home</a>
</div>
</body>
</html>