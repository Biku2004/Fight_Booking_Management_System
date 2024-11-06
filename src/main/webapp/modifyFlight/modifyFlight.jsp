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
      color: #333333;
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

<%--    <label for="departure_time">Departure Time:</label>--%>
<%--    <input type="datetime-local" id="departure_time" name="departure_time">--%>

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