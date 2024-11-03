<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flight.flight_booking_management_system.ViewPassenger.Booking" %>
<!DOCTYPE html>
<html>
<head>
  <title>Booking Results</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #33A1FF, #6DD5FA, #ffffff);
      background-size: 400% 400%;
      animation: gradientAnimation 10s ease infinite;
      margin: 0;
      padding: 0;
    }
    @keyframes gradientAnimation {
      0%, 100% {
        background-position: 0% 50%;
      }
      50% {
        background-position: 100% 50%;
      }
    }
    table {
      width: 100%;
      border-collapse: collapse;
    }
    th, td {
      border: 1px solid #ddd;
      padding: 8px;
    }
    th {
      background-color: #f2f2f2;
    }
  </style>
</head>
<body>
<h2>Booking Results for Flight Number: <%= request.getAttribute("flight_number") %></h2>

<%
  List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
  if (bookings != null && !bookings.isEmpty()) {
%>
<table>
  <tr>
    <th>Flight Number</th>
    <th>Airline</th>
    <th>Departure</th>
    <th>Arrival</th>
    <th>Full Name</th>
    <th>Email</th>
    <th>Phone</th>
    <th>Booking Time</th>
  </tr>
  <%
    for (Booking booking : bookings) {
  %>
  <tr>
    <td><%= booking.getFlightNumber() %></td>
    <td><%= booking.getAirline() %></td>
    <td><%= booking.getDeparture() %></td>
    <td><%= booking.getArrival() %></td>
    <td><%= booking.getFullName() %></td>
    <td><%= booking.getEmail() %></td>
    <td><%= booking.getPhone() %></td>
    <td><%= booking.getBookingTime() %></td>
  </tr>
  <%
    }
  %>
</table>
<%
} else {
%>
<p>No bookings found for the provided flight number.</p>
<%
  }
%>
</body>
</html>
