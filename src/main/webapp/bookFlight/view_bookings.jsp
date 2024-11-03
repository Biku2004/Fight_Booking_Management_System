<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 03-11-2024
  Time: 23:28
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" import="java.sql.ResultSet" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>My Bookings</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #e9ecef;
      color: #333;
    }

    h2 {
      text-align: center;
      color: #007bff; /* Bootstrap primary color */
      margin-bottom: 30px;
    }

    .container {
      max-width: 1200px;
      margin: auto;
      padding: 20px;
      background-color: #ffffff;
      border-radius: 8px;
      box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    }

    .booking-card {
      border: 1px solid #dee2e6;
      border-radius: 8px;
      padding: 15px;
      margin-bottom: 15px;
      transition: box-shadow 0.3s;
      background-color: #f8f9fa;
    }

    .booking-card:hover {
      box-shadow: 0 0 20px rgba(0, 123, 255, 0.5);
    }

    .booking-details {
      display: flex;
      justify-content: space-between;
      margin-bottom: 10px;
    }

    .booking-details div {
      flex: 1;
      margin-right: 10px;
    }

    .booking-details div:last-child {
      margin-right: 0;
    }

    .price {
      font-weight: bold;
      color: #28a745; /* Bootstrap success color */
    }

    a {
      display: inline-block;
      padding: 10px 15px;
      background-color: #007bff; /* Bootstrap primary color */
      color: white;
      text-decoration: none;
      border-radius: 5px;
      transition: background-color 0.3s;
    }

    a:hover {
      background-color: #0056b3; /* Darker blue on hover */
    }

    @media (max-width: 768px) {
      .booking-details {
        flex-direction: column;
      }

      .booking-details div {
        margin-right: 0;
        margin-bottom: 10px;
      }

      .booking-details div:last-child {
        margin-bottom: 0;
      }
    }
  </style>
</head>
<body>
<div class="container">
  <h2>Your Bookings</h2>
  <%
    ResultSet bookings = (ResultSet) request.getAttribute("bookings");
    while (bookings.next()) {
      int bookingId = bookings.getInt("booking_id");
  %>
  <div class="booking-card">
    <div class="booking-details">
      <div><strong>Booking ID:</strong> <%= bookingId %></div>
      <div><strong>Flight Number:</strong> <%= bookings.getString("flight_number") %></div>
      <div><strong>Airline:</strong> <%= bookings.getString("airline") %></div>
      <div><strong>Departure:</strong> <%= bookings.getString("departure") %></div>
      <div><strong>Arrival:</strong> <%= bookings.getString("arrival") %></div>
      <div><strong>Price:</strong> <span class="price">$<%= bookings.getBigDecimal("price") %></span></div>
      <div><a href="TicketServlet?bookingId=<%= bookingId %>">View Ticket</a></div>
    </div>
    <div>
      <strong>Departure Time:</strong> <%= bookings.getTimestamp("departure_time") %><br>
      <strong>Arrival Time:</strong> <%= bookings.getTimestamp("arrival_time") %>
    </div>
  </div>
  <%
    }
  %>
</div>
</body>
</html>
