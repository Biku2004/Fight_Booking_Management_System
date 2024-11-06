<%--<%@ page import="com.flight.flight_booking_management_system.AdminFunctions.ModifyFlight" %>--%>
<%--<%@ page import="java.util.List" %>--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <title>Modify Flight</title>--%>
<%--  <link rel="stylesheet" href="../cssFile/styles.css">--%>
<%--  <style>--%>
<%--    body {--%>
<%--      font-family: Arial, sans-serif;--%>
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

<%--    .container {--%>
<%--      width: 80%; /* Increased width for larger screens */--%>
<%--      max-width: 800px; /* Set maximum width */--%>
<%--      margin: auto; /* Center the container */--%>
<%--      background-color: #fff; /* White background for container */--%>
<%--      border-radius: 10px; /* Rounded corners */--%>
<%--      padding: 30px; /* Padding for comfort */--%>
<%--      box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1); /* Subtle shadow */--%>
<%--    }--%>

<%--    h2 {--%>
<%--      text-align: center;--%>
<%--      color: #333333; /* Heading color */--%>
<%--    }--%>

<%--    table {--%>
<%--      width: 100%; /* Full width table */--%>
<%--      margin-top: 20px;--%>
<%--      border-collapse: collapse; /* Collapse borders for cleaner look */--%>
<%--    }--%>

<%--    th, td {--%>
<%--      padding: 10px; /* Padding for table cells */--%>
<%--      text-align: left; /* Left align text in cells */--%>
<%--      border-bottom: 1px solid #ddd; /* Bottom border for rows */--%>
<%--    }--%>

<%--    th {--%>
<%--      background-color: #f2f2f2; /* Light gray background for headers */--%>
<%--    }--%>

<%--    a.modify-button {--%>
<%--      display: inline-block;--%>
<%--      padding: 5px 10px;--%>
<%--      color: white;--%>
<%--      background-color: #008cba; /* Button color */--%>
<%--      text-decoration: none;--%>
<%--      border-radius: 5px;--%>
<%--    }--%>

<%--    a.modify-button:hover {--%>
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

<%--<div class="container">--%>
<%--  <h2>Modify Flight</h2>--%>
<%--  <% ModifyFlight flight = (ModifyFlight) request.getAttribute("flight"); %>--%>
<%--  <% if (flight != null) { %>--%>
<%--  <form action="${pageContext.request.contextPath}/ModifyFlightServlet" method="post">--%>
<%--    <input type="hidden" name="action" value="update">--%>
<%--    <label for="flight_number">Flight Number:</label>--%>
<%--    <input type="text" id="flight_number" name="flight_number" value="<%= flight.getFlight_number() %>" readonly>--%>

<%--    <label for="airline">Airline:</label>--%>
<%--    <input type="text" id="airline" name="airline" value="<%= flight.getAirline() %>">--%>

<%--    <label for="departureName">Departure Name:</label>--%>
<%--    <input type="text" id="departureName" name="departureName" value="<%= flight.getDepartureName() %>">--%>

<%--    <label for="arrivalName">Arrival Name:</label>--%>
<%--    <input type="text" id="arrivalName" name="arrivalName" value="<%= flight.getArrivalName() %>">--%>

<%--    <label for="departure_time">Departure Time:</label>--%>
<%--    <input type="datetime-local" id="departure_time" name="departure_time" value="<%= flight.getDeparture_time().replace(" ", "T") %>">--%>

<%--    <label for="arrivalTime">Arrival Time:</label>--%>
<%--    <input type="datetime-local" id="arrivalTime" name="arrivalTime" value="<%= flight.getArrivalTime().replace(" ", "T") %>">--%>

<%--    <label for="price">Price:</label>--%>
<%--    <input type="number" id="price" name="price" value="<%= flight.getPrice() %>">--%>

<%--    <input type="submit" value="Update Flight">--%>
<%--  </form>--%>
<%--  <% } else { %>--%>
<%--  <p>Flight not found.</p>--%>
<%--  <% } %>--%>
<%--  <a href="${pageContext.request.contextPath}/modifyFlightList.jsp">Back to List</a>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>


<%@ page import="com.flight.flight_booking_management_system.AdminFunctions.ModifyFlight" %>
<%@ page import="java.util.List" %>
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
      background-color: #e6f0ff;
      margin: 0;
      padding: 0;
    }

    header {
      background-color: #008cba;
      padding: 15px 0;
    }

    nav {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    nav a {
      text-decoration: none;
      font-size: 18px;
      color: white;
      padding: 10px 20px;
      margin: 0 15px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    nav a:hover {
      background-color: #005f5f;
    }

    .container {
      width: 80%;
      max-width: 800px;
      margin: auto;
      background-color: #fff;
      border-radius: 10px;
      padding: 30px;
      box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
    }

    h2 {
      text-align: center;
      color: #333333;
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-top: 10px;
      font-weight: bold;
    }

    input[type="text"],
    input[type="datetime-local"],
    input[type="number"] {
      padding: 10px;
      margin-top: 5px;
      border: 1px solid #ddd;
      border-radius: 5px;
      width: 100%;
    }

    input[type="submit"] {
      margin-top: 20px;
      padding: 10px;
      background-color: #008cba;
      color: white;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    input[type="submit"]:hover {
      background-color: #005f5f;
    }

    .back-link {
      display: block;
      text-align: center;
      margin-top: 20px;
      color: #008cba;
      text-decoration: none;
    }

    .back-link:hover {
      text-decoration: underline;
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
  <h2>Modify Flight</h2>
  <% ModifyFlight flight = (ModifyFlight) request.getAttribute("flight"); %>
  <% if (flight != null) { %>
  <form action="${pageContext.request.contextPath}/ModifyFlightServlet" method="post">
    <input type="hidden" name="action" value="update">
    <label for="flight_number">Flight Number:</label>
    <input type="text" id="flight_number" name="flight_number" value="<%= flight.getFlight_number() %>" readonly>

    <label for="airline">Airline:</label>
    <input type="text" id="airline" name="airline" value="<%= flight.getAirline() %>">

    <label for="departureName">Departure Name:</label>
    <input type="text" id="departureName" name="departureName" value="<%= flight.getDepartureName() %>">

    <label for="arrivalName">Arrival Name:</label>
    <input type="text" id="arrivalName" name="arrivalName" value="<%= flight.getArrivalName() %>">

    <label for="departure_time">Departure Time:</label>
    <input type="datetime-local" id="departure_time" name="departure_time" value="<%= flight.getDeparture_time().replace(" ", "T") %>">

    <label for="arrivalTime">Arrival Time:</label>
    <input type="datetime-local" id="arrivalTime" name="arrivalTime" value="<%= flight.getArrivalTime().replace(" ", "T") %>">

    <label for="price">Price:</label>
    <input type="number" id="price" name="price" value="<%= flight.getPrice() %>">

    <input type="submit" value="Update Flight">
  </form>
  <% } else { %>
  <p>Flight not found.</p>
  <% } %>
  <a href="${pageContext.request.contextPath}/modifyFlight/modifyFlightList.jsp" class="back-link">Back to List</a>
</div>

</body>
</html>