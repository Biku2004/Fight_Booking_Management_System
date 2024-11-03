<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Modify Flight</title>
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

    label {
      display: block;
      margin-bottom: 5px;
    }

    input[type="text"], input[type="datetime-local"] {
      width: calc(100% - 16px); /* Full width inputs with padding adjustment */
      padding: 8px; /* Padding for inputs */
      margin-bottom: 15px; /* Space below inputs */
      border-radius: 5px; /* Rounded corners for inputs */
      border: 1px solid #ccc; /* Border style for inputs */
    }

    input[type="submit"] {
      background-color: #008cba; /* Submit button color */
      color: white; /* Button text color */
      padding: 10px 15px; /* Padding for button */
      border-radius: 5px; /* Rounded corners for button */
      border: none; /* Remove border from button */
      cursor: pointer; /* Pointer cursor on hover */
    }

    input[type="submit"]:hover {
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
  <h2>Search Flight to Modify</h2>

  <!-- Search Flight Form -->
  <form action="${pageContext.request.contextPath}/ModifyFlightServlet" method="post">
    <input type="hidden" name="action" value="search">

    <label for="flight_number">Flight Number:</label>
    <input type="text" id="flight_number" name="flight_number" required>

    <label for="departure_time">Departure Time:</label>
    <input type="datetime-local" id="departure_time" name="departure_time">

    <input type="submit" value="Search Flight">
  </form>

  <%-- Check if there are any messages --%>
  <%
    String message = (String) request.getAttribute("message");
    if (message != null) {
  %>
  <div style="color:red;"> <%= message %> </div>
  <% } %>

</div>

</body>
</html>


<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--  <title>Modify Flight</title>--%>
<%--&lt;%&ndash;  <link rel="stylesheet" href="../cssFile/modifystyle.css">&ndash;%&gt;--%>
<%--  <style>--%>
<%--    body {--%>
<%--      font-family: 'Arial', sans-serif;--%>
<%--      background-color: #e6f0ff; /* Background color */--%>
<%--      margin: 0;--%>
<%--      padding: 0;--%>
<%--    }--%>
<%--    header {--%>
<%--      background-color: #008cba; /* Navbar background */--%>
<%--      padding: 15px 0; /* Padding for navbar */--%>
<%--    }--%>
<%--    nav {--%>
<%--      display: flex;--%>
<%--      justify-content: center; /* Centering nav items */--%>
<%--      align-items: center; /* Vertically center items */--%>
<%--    }--%>
<%--    nav a {--%>
<%--      text-decoration: none;--%>
<%--      font-size: 18px;--%>
<%--      color: white; /* Text color */--%>
<%--      padding: 10px 20px; /* Padding around links */--%>
<%--      margin: 0 15px; /* Margin between links */--%>
<%--      border-radius: 5px; /* Rounded corners */--%>
<%--      transition: background-color 0.3s ease; /* Smooth transition effect */--%>
<%--    }--%>
<%--    nav a:hover {--%>
<%--      background-color: #005f5f; /* Darker shade on hover */--%>
<%--    }--%>
<%--    h2 {--%>
<%--      text-align: center;--%>
<%--      color: #333333; /* Heading color */--%>
<%--    }--%>
<%--    .form-container {--%>
<%--      width: 80%; /* Increased width for larger screens */--%>
<%--      max-width: 800px; /* Set maximum width */--%>
<%--      margin: auto;--%>
<%--      background: #ffffff; /* White background for container */--%>
<%--      border-radius: 10px; /* Rounded corners */--%>
<%--      padding: 30px; /* Padding for comfort */--%>
<%--      box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1); /* Subtle shadow */--%>
<%--    }--%>
<%--    table {--%>
<%--      width: 100%; /* Full width table */--%>
<%--      margin-top: 20px;--%>
<%--    }--%>
<%--    th, td {--%>
<%--      padding: 10px; /* Padding for table cells */--%>
<%--      text-align: left; /* Left align text in cells */--%>
<%--    }--%>
<%--    th {--%>
<%--      background-color: #f2f2f2; /* Light gray background for headers */--%>
<%--    }--%>
<%--    input[type="text"],--%>
<%--    input[type="number"],--%>
<%--    input[type="datetime-local"] {--%>
<%--      width: calc(100% - 16px); /* Full width inputs with padding adjustment */--%>
<%--      padding: 8px; /* Padding for inputs */--%>
<%--      margin-bottom: 15px; /* Space below inputs */--%>
<%--      border-radius: 5px; /* Rounded corners for inputs */--%>
<%--      border: 1px solid #ccc; /* Border style for inputs */--%>
<%--    }--%>
<%--    input[type="submit"] {--%>
<%--      background-color: #008cba; /* Submit button color */--%>
<%--      color: white; /* Button text color */--%>
<%--      padding: 10px 15px; /* Padding for button */--%>
<%--      border-radius: 5px; /* Rounded corners for button */--%>
<%--      border: none; /* Remove border from button */--%>
<%--      cursor: pointer; /* Pointer cursor on hover */--%>
<%--    }--%>
<%--    input[type="submit"]:hover {--%>
<%--      background-color: #005f5f; /* Darker shade on hover for button */--%>
<%--    }--%>
<%--  </style>--%>

<%--</head>--%>
<%--<body>--%>

<%--<header>--%>
<%--  <nav>--%>
<%--    <a href="../Admin/HomeAdmin.jsp">SkyWay</a>--%>
<%--    <a href="../ViewPassenger/searchBooking.jsp">Passenger</a>--%>
<%--    <a href="../bookFlight/tickets.jsp">Ticket</a>--%>
<%--    <a href="../Admin/adminregd.jsp">Admin</a>--%>
<%--    <a href="../Admin/adminDelete.jsp">Delete Admin</a>--%>
<%--  </nav>--%>
<%--</header>--%>

<%--<h2>Modify Flight Details</h2>--%>

<%--<!-- Display a message if there is any error or success -->--%>
<%--<%--%>
<%--  String message = (String) request.getAttribute("message");--%>
<%--  String messageType = (String) request.getAttribute("messageType");--%>
<%--  if (message != null) {--%>
<%--%>--%>
<%--<div class="<%= messageType %>">--%>
<%--  <%= message %>--%>
<%--</div>--%>
<%--<% } %>--%>

<%--<!-- Modify Flight Form -->--%>
<%--<div class="form-container">--%>
<%--  <form action="${pageContext.request.contextPath}/ModifyFlightServlet" method="post">--%>
<%--    <!-- Hidden field to pass flight ID -->--%>
<%--    <input type="hidden" name="flightId" value="${flight.flightId}">--%>

<%--    <table>--%>
<%--      <tr>--%>
<%--        <th><label for="flight_number">Flight Number:</label></th>--%>
<%--        <td><input type="text" id="flight_number" name="flight_number" value="${flight.flight_number}" required></td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <th><label for="airline">Airline:</label></th>--%>
<%--        <td><input type="text" id="airline" name="airline" value="${flight.airline}" required></td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <th><label for="departureCity">Departure City:</label></th>--%>
<%--        <td><input type="text" id="departureCity" name="departureCity" value="${flight.departureCity}" required></td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <th><label for="arrivalCity">Arrival City:</label></th>--%>
<%--        <td><input type="text" id="arrivalCity" name="arrivalCity" value="${flight.arrivalCity}" required></td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <th><label for="departure_time">Departure Time:</label></th>--%>
<%--        <td><input type="datetime-local" id="departure_time" name="departure_time" value="${flight.departure_time}" required></td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <th><label for="arrivalTime">Arrival Time:</label></th>--%>
<%--        <td><input type="datetime-local" id="arrivalTime" name="arrivalTime" value="${flight.arrivalTime}" required></td>--%>
<%--      </tr>--%>
<%--      <tr>--%>
<%--        <th><label for="price">Price:</label></th>--%>
<%--        <td><input type="number" id="price" name="price" step="0.01" value="${flight.price}" required></td>--%>
<%--      </tr>--%>
<%--    </table>--%>

<%--    <!-- Submit Button -->--%>
<%--    <input type="submit" value="Update Flight">--%>
<%--  </form>--%>

<%--  <!-- Back to Dashboard Link -->--%>
<%--  <a href="../Admin/HomeAdmin.jsp">Back to Dashboard</a>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>





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

<%--  <label for="flight_number">Flight Number:</label>--%>
<%--  <input type="text" id="flight_number" name="flight_number" value="${flight.flight_number}" required>--%>
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

<%--  <label for="departure_time">Departure Time:</label>--%>
<%--  <input type="datetime-local" id="departure_time" name="departure_time" value="${flight.departure_time}" required>--%>
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


