<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 25-08-2024
  Time: 19:43
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Flight</title>
    <link rel="stylesheet" href="../cssFile/deleteflightStyle.css">
</head>
<body>
    <h1>Delete Flight</h1>
    <div class="container">
        <h1>Delete Flight</h1>
        <form action="<%= request.getContextPath() %>/deleteFlight1" method="post">
            <div class="form-group">
                <label for="flightNumber">Flight Number:</label>
                <input type="text" id="flightNumber" name="flightNumber" required>
            </div>
            <div class="form-group">
                <label for="departureTime">Departure Date and Time:</label>
                <input type="datetime-local" id="departureTime" name="departureTime" required>
            </div>
            <div class="form-group">
                <label for="arrivalTime">Arrival Date and Time:</label>
                <input type="datetime-local" id="arrivalTime" name="arrivalTime" required>
            </div>
            <div class="form-group">
                <button type="submit" class="btn">Delete Flight</button>
            </div>
        </form>

    <%-- Display success or error messages based on request parameters --%>
    <%
        String message = request.getParameter("message");
        if (message != null) {
    %>
    <div class="<%= message.equals("success") ? "success" : "error" %>">
        <%= message.equals("success") ? "Flight deleted successfully!" : "Failed to delete flight. Please try again." %>
    </div>
    <% } %>

    <a href="../index.jsp">Back to Home</a>
</div>
</body>
</html>
