<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 25-08-2024
  Time: 20:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flight Deletion Success</title>
    <link rel="stylesheet" href="deleteFlightSuccessStyle.css"> <!-- Link to your CSS file for styling -->
</head>
<body>
<div class="container">
    <h1>Flight Deletion Successful</h1>
    <p>The flight has been successfully deleted from the database.</p>

    <!-- Option to go back to the main page or perform other actions -->
    <div class="options">
        <a href="index.jsp" class="btn">Back to Home</a>
        <a href="deleteFlight.jsp" class="btn">Delete Another Flight</a>
        <a href="viewFlights.jsp" class="btn">View All Flights</a> <!-- Assuming there's a page to view flights -->
    </div>
</div>
</body>
</html>

