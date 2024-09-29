<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 29-09-2024
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Search Booking</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background-color: #e9ecef; /* Lighter background color */
      margin: 0;
      padding: 0;
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh; /* Full height of the viewport */
      padding: 20px;
    }

    .form-container {
      max-width: 400px;
      width: 100%;
      background: white;
      padding: 30px; /* Increased padding for a more spacious look */
      border-radius: 12px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Softer shadow for a classy feel */
      text-align: center; /* Center text inside the container */
    }

    h2 {
      color: #333;
      margin: 0 0 20px 0; /* Margin below the headline */
      font-size: 1.8em; /* Increased font size for the headline */
    }

    label {
      display: block; /* Block display for label to separate it from input */
      margin-bottom: 10px; /* Space between label and input */
      font-size: 1em; /* Font size for the label */
      color: #555; /* Darker color for better readability */
    }

    input[type="text"] {
      width: 100%;
      padding: 12px; /* Increased padding for the input */
      margin: 10px 0 20px 0; /* Space around the input */
      border: 1px solid #ced4da; /* Lighter border color */
      border-radius: 6px;
      font-size: 1em;
    }

    input[type="submit"] {
      background-color: #007bff; /* Bootstrap primary color */
      color: white;
      padding: 12px 15px;
      border: none;
      border-radius: 6px; /* Rounded corners */
      cursor: pointer;
      width: 100%;
      font-size: 1em;
      transition: background-color 0.3s ease, transform 0.2s ease; /* Transition for hover effect */
    }

    input[type="submit"]:hover {
      background-color: #0056b3; /* Darker shade on hover */
      transform: scale(1.05); /* Slightly scale up on hover */
    }
  </style>
</head>
<body>
<div class="container">
  <div class="form-container">
    <h2>Search Booking by Flight Number</h2>
    <form action="<%=request.getContextPath()%>/ViewPassenger/BookingServlet" method="get">
      <label for="flightNumber">Flight Number:</label>
      <input type="text" name="flightNumber" id="flightNumber" required>
      <input type="submit" value="Search">
    </form>
  </div>
</div>
</body>
</html>
