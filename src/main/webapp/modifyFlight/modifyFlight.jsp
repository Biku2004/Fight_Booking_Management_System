<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Modify Flight</title>
  <link rel="stylesheet" href="../cssFile/modifystyle.css"> <!-- Link to your CSS file -->

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

<h2>Modify Flight Details</h2>

<!-- Display a message if there is any error or success -->
<%
  String message = (String) request.getAttribute("message");
  String messageType = (String) request.getAttribute("messageType");
  if (message != null) {
%>
<div class="<%= messageType %>">
  <%= message %>
</div>
<% } %>

<!-- Modify Flight Form -->
<div class="form-container">
  <form action="${pageContext.request.contextPath}/ModifyFlightServlet" method="post">
    <!-- Hidden field to pass flight ID -->
    <input type="hidden" name="flightId" value="${flight.flightId}">

    <table>
      <tr>
        <th><label for="flightNumber">Flight Number:</label></th>
        <td><input type="text" id="flightNumber" name="flightNumber" value="${flight.flightNumber}" required></td>
      </tr>
      <tr>
        <th><label for="airline">Airline:</label></th>
        <td><input type="text" id="airline" name="airline" value="${flight.airline}" required></td>
      </tr>
      <tr>
        <th><label for="departureCity">Departure City:</label></th>
        <td><input type="text" id="departureCity" name="departureCity" value="${flight.departureCity}" required></td>
      </tr>
      <tr>
        <th><label for="arrivalCity">Arrival City:</label></th>
        <td><input type="text" id="arrivalCity" name="arrivalCity" value="${flight.arrivalCity}" required></td>
      </tr>
      <tr>
        <th><label for="departureTime">Departure Time:</label></th>
        <td><input type="datetime-local" id="departureTime" name="departureTime" value="${flight.departureTime}" required></td>
      </tr>
      <tr>
        <th><label for="arrivalTime">Arrival Time:</label></th>
        <td><input type="datetime-local" id="arrivalTime" name="arrivalTime" value="${flight.arrivalTime}" required></td>
      </tr>
      <tr>
        <th><label for="price">Price:</label></th>
        <td><input type="number" id="price" name="price" step="0.01" value="${flight.price}" required></td>
      </tr>
    </table>

    <!-- Submit Button -->
    <input type="submit" value="Update Flight">
  </form>

  <!-- Back to Dashboard Link -->
  <a href="../Admin/HomeAdmin.jsp">Back to Dashboard</a>
</div>

</body>
</html>





<%--Old ModifyFLight--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--&lt;%&ndash;<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>&ndash;%&gt;--%>
<%--<!DOCTYPE html>--%>
<%--<html>--%>
<%--<head>--%>
<%--  <title>Modify Flight</title>--%>
<%--  <!-- Add your CSS styles here -->--%>
<%--  <link rel="stylesheet" href="../cssFile/modifystyle.css">--%>
<%--</head>--%>
<%--<body>--%>
<%--<h2>Modify Flight Details</h2>--%>

<%--<!-- Display a message if there is any error or success -->--%>
<%--<c:if test="${not empty message}">--%>
<%--  <div class="${messageType}">--%>
<%--      ${message}--%>
<%--  </div>--%>
<%--</c:if>--%>

<%--<!-- Modify Flight Form -->--%>
<%--<form action="${pageContext.request.contextPath}/ModifyFlightServlet" method="post">--%>
<%--  <!-- Hidden field to pass flight ID -->--%>
<%--  <input type="hidden" name="flightId" value="${flight.flightId}">--%>

<%--  <label for="flightNumber">Flight Number:</label>--%>
<%--  <input type="text" id="flightNumber" name="flightNumber" value="${flight.flightNumber}" required>--%>
<%--  <br>--%>

<%--  <label for="airline">Airline:</label>--%>
<%--  <input type="text" id="airline" name="airline" value="${flight.airline}" required>--%>
<%--  <br>--%>

<%--  <label for="departureCity">Departure City:</label>--%>
<%--  <input type="text" id="departureCity" name="departureCity" value="${flight.departureCity}" required>--%>
<%--  <br>--%>

<%--  <label for="arrivalCity">Arrival City:</label>--%>
<%--  <input type="text" id="arrivalCity" name="arrivalCity" value="${flight.arrivalCity}" required>--%>
<%--  <br>--%>

<%--  <label for="departureTime">Departure Time:</label>--%>
<%--  <input type="datetime-local" id="departureTime" name="departureTime" value="${flight.departureTime}" required>--%>
<%--  <br>--%>

<%--  <label for="arrivalTime">Arrival Time:</label>--%>
<%--  <input type="datetime-local" id="arrivalTime" name="arrivalTime" value="${flight.arrivalTime}" required>--%>
<%--  <br>--%>

<%--  <label for="price">Price:</label>--%>
<%--  <input type="number" id="price" name="price" step="0.01" value="${flight.price}" required>--%>
<%--  <br>--%>

<%--  <input type="submit" value="Update Flight">--%>
<%--</form>--%>

<%--&lt;%&ndash;Resolve the issue in the back to deshboard&ndash;%&gt;--%>
<%--<a href="Admin/HomeAdmin.jsp">Back to Dashboard</a>--%>
<%--</body>--%>
<%--</html>--%>


