<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 25-08-2024
  Time: 20:25
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Flight Deletion Error</title>
  <link rel="stylesheet" href="../cssFile/deleteFlightErrorStyle.css"> <!-- Link to your CSS file for styling -->
</head>
<body>
<div class="container">
  <h1>Flight Deletion Failed</h1>
  <p>Sorry, there was an error deleting the flight. Please try again later or contact support if the problem persists.</p>

  <!-- Option to go back to the main page or try deleting again -->
  <div class="options">
    <a href="../index.jsp" class="btn">Back to Home</a>
    <a href="deleteFlight.jsp" class="btn">Try Again</a>
    <a href="viewFlights.jsp" class="btn">View All Flights</a> <!-- Assuming there's a page to view flights -->
  </div>
</div>
</body>
</html>

