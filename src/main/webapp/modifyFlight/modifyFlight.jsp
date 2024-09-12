<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>--%>
<!DOCTYPE html>
<html>
<head>
  <title>Modify Flight</title>
  <!-- Add your CSS styles here -->
  <link rel="stylesheet" href="modifystyle.css">
</head>
<body>
<h2>Modify Flight Details</h2>

<!-- Display a message if there is any error or success -->
<c:if test="${not empty message}">
  <div class="${messageType}">
      ${message}
  </div>
</c:if>

<!-- Modify Flight Form -->
<form action="${pageContext.request.contextPath}/ModifyFlightServlet" method="post">
  <!-- Hidden field to pass flight ID -->
  <input type="hidden" name="flightId" value="${flight.flightId}">

  <label for="flightNumber">Flight Number:</label>
  <input type="text" id="flightNumber" name="flightNumber" value="${flight.flightNumber}" required>
  <br>

  <label for="airline">Airline:</label>
  <input type="text" id="airline" name="airline" value="${flight.airline}" required>
  <br>

  <label for="departureCity">Departure City:</label>
  <input type="text" id="departureCity" name="departureCity" value="${flight.departureCity}" required>
  <br>

  <label for="arrivalCity">Arrival City:</label>
  <input type="text" id="arrivalCity" name="arrivalCity" value="${flight.arrivalCity}" required>
  <br>

  <label for="departureTime">Departure Time:</label>
  <input type="datetime-local" id="departureTime" name="departureTime" value="${flight.departureTime}" required>
  <br>

  <label for="arrivalTime">Arrival Time:</label>
  <input type="datetime-local" id="arrivalTime" name="arrivalTime" value="${flight.arrivalTime}" required>
  <br>

  <label for="price">Price:</label>
  <input type="number" id="price" name="price" step="0.01" value="${flight.price}" required>
  <br>

  <input type="submit" value="Update Flight">
</form>

<%--Resolve the issue in the back to deshboard--%>
<a href="Admin/HomeAdmin.jsp">Back to Dashboard</a>
</body>
</html>

