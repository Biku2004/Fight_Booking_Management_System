<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.flight.flight_booking_management_system.Flight" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flight List</title>
  <style>
    table {
      width: 100%;
      border-collapse: collapse;
    }
    th, td {
      padding: 12px;
      text-align: left;
      border-bottom: 1px solid #ddd;
    }
    th {
      background-color: #f2f2f2;
    }
    tr:hover {
      background-color: #f5f5f5;
    }
  </style>
</head>
<body>
<h2>Flight List</h2>

<%
  System.out.println("JSP page loaded"); // Debug statement
  List<Flight> flightsList = (List<Flight>) request.getAttribute("flightList");
%>

<%
  String errorMessage = (String) request.getAttribute("errorMessage");
  if (errorMessage != null) {
%>
<p style="color: red;"><%= errorMessage %></p>
<%
  }
%>

<table>
  <thead>
  <tr>
    <th>ID</th>
    <th>Flight Number</th>
    <th>Airline</th>
    <th>Departure Airport</th>
    <th>Arrival Airport</th>
    <th>Duration</th>
    <th>Airplane</th>
    <th>Legroom</th>
    <th>Extensions</th>
    <th>Travel Class</th>
    <th>Layovers Duration</th>
    <th>Carbon Emissions</th>
    <th>Created At</th>
  </tr>
  </thead>
  <tbody>
  <%
    if (flightsList != null && !flightsList.isEmpty()) {
      for (Flight flight : flightsList) {
  %>
  <tr>
    <td><%= flight.getId() %></td>
    <td><%= flight.getFlightNumber() %></td>
    <td><%= flight.getAirline() %></td>
    <td><%= flight.getDepartureAirport() %></td>
    <td><%= flight.getArrivalAirport() %></td>
    <td><%= flight.getDuration() %> minutes</td>
    <td><%= flight.getAirplane() %></td>
    <td><%= flight.getLegroom() %></td>
    <td><%= flight.getExtensions() %></td>
    <td><%= flight.getTravelClass() %></td>
    <td><%= flight.getLayoversDuration() %> minutes</td>
    <td><%= flight.getCarbonEmissions() %> kg CO2</td>
    <td><%= flight.getCreatedAt() %></td>
  </tr>
  <%
    }
  } else {
  %>
  <tr>
    <td colspan="13">No flights found or data not available.</td>
  </tr>
  <%
    }
  %>
  </tbody>
</table>
</body>
</html>
