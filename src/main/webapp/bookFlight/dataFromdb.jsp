<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<%@ page import="java.util.*" %>--%>
<%--<%@ page import="com.flight.flight_booking_management_system.Admin.Flight" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--  <meta charset="UTF-8">--%>
<%--  <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--  <title>Flight Search Results</title>--%>
<%--  <style>--%>
<%--    body {--%>
<%--      font-family: Arial, sans-serif;--%>
<%--      background-color: #f9f9f9;--%>
<%--      margin: 0;--%>
<%--      padding: 20px;--%>
<%--    }--%>
<%--    h2 {--%>
<%--      text-align: center;--%>
<%--      color: #333;--%>
<%--    }--%>
<%--    .flight-card {--%>
<%--      background-color: #fff;--%>
<%--      border-radius: 10px;--%>
<%--      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);--%>
<%--      margin-bottom: 20px;--%>
<%--      padding: 20px;--%>
<%--      display: flex;--%>
<%--      justify-content: space-between;--%>
<%--      align-items: center;--%>
<%--    }--%>
<%--    .flight-info {--%>
<%--      flex: 1;--%>
<%--      padding: 10px;--%>
<%--    }--%>
<%--    .flight-info h3 {--%>
<%--      margin: 0;--%>
<%--      color: #007bff;--%>
<%--    }--%>
<%--    .flight-info p {--%>
<%--      margin: 5px 0;--%>
<%--      color: #555;--%>
<%--    }--%>
<%--    .flight-meta {--%>
<%--      text-align: right;--%>
<%--      color: #555;--%>
<%--    }--%>
<%--    .flight-meta span {--%>
<%--      display: block;--%>
<%--      margin: 5px 0;--%>
<%--    }--%>
<%--    .flight-meta .flight-time {--%>
<%--      font-weight: bold;--%>
<%--      color: #333;--%>
<%--    }--%>
<%--    .error-message {--%>
<%--      color: red;--%>
<%--      text-align: center;--%>
<%--    }--%>

<%--    .book-button {--%>
<%--      background-color: #007bff;--%>
<%--      color: #fff;--%>
<%--      padding: 10px 20px;--%>
<%--      border: none;--%>
<%--      border-radius: 5px;--%>
<%--      cursor: pointer;--%>
<%--      text-decoration: none;--%>
<%--      font-size: 16px;--%>
<%--    }--%>
<%--    .book-button:hover {--%>
<%--      background-color: #0056b3;--%>
<%--    }--%>
<%--  </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<h2>Available Flights</h2>--%>

<%--<%--%>
<%--  System.out.println("JSP page loaded"); // Debug statement--%>
<%--  List<Flight> flightsList = (List<Flight>) request.getAttribute("flightList");--%>
<%--%>--%>

<%--<%--%>
<%--  String errorMessage = (String) request.getAttribute("errorMessage");--%>
<%--  if (errorMessage != null) {--%>
<%--%>--%>
<%--<p class="error-message"><%= errorMessage %></p>--%>
<%--<%--%>
<%--  }--%>
<%--%>--%>

<%--<%--%>
<%--  if (flightsList != null && !flightsList.isEmpty()) {--%>
<%--    for (Flight flight : flightsList) {--%>
<%--%>--%>
<%--<div class="flight-card">--%>
<%--  <div class="flight-info">--%>
<%--    <h3><%= flight.getAirline() %> | Flight No: <%= flight.getFlightNumber() %></h3>--%>
<%--    <p>From: <%= flight.getDepartureAirport() %></p>--%>
<%--    <p>To: <%= flight.getArrivalAirport() %></p>--%>
<%--    <p>Airplane: <%= flight.getAirplane() %></p>--%>
<%--    <p>Legroom: <%= flight.getLegroom() %></p>--%>
<%--  </div>--%>
<%--  <div class="flight-meta">--%>
<%--    <span class="flight-time">Duration: <%= flight.getDuration() %> minutes</span>--%>
<%--    <span>Layovers: <%= flight.getLayoversDuration() %> minutes</span>--%>
<%--    <span>Carbon Emissions: <%= flight.getCarbonEmissions() %> kg CO2</span>--%>
<%--    <span>Created on: <%= flight.getCreatedAt() %></span>--%>

<%--    <form action="bookFlight/bookFlight.jsp" method="POST">--%>
<%--      <input type="hidden" name="flightNumber" value="<%= flight.getFlightNumber() %>">--%>
<%--      <input type="hidden" name="airline" value="<%= flight.getAirline() %>">--%>
<%--      <input type="hidden" name="departure" value="<%= flight.getDepartureAirport() %>">--%>
<%--      <input type="hidden" name="arrival" value="<%= flight.getArrivalAirport() %>">--%>
<%--      <input type="submit" class="book-button" value="Book">--%>
<%--    </form>--%>


<%--  </div>--%>
<%--</div>--%>
<%--<%--%>
<%--  }--%>
<%--} else {--%>
<%--%>--%>
<%--<p class="error-message">No flights found or data not available.</p>--%>
<%--<%--%>
<%--  }--%>
<%--%>--%>

<%--</body>--%>
<%--</html>--%>


<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<%@ page import="com.flight.flight_booking_management_system.Admin.Flight" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flight Search Results</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #f9f9f9;
      margin: 0;
      padding: 20px;
    }
    h2 {
      text-align: center;
      color: #333;
    }
    .flight-card {
      background-color: #fff;
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      margin-bottom: 20px;
      padding: 20px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }
    .flight-info {
      flex: 1;
      padding: 10px;
    }
    .flight-info h3 {
      margin: 0;
      color: #007bff;
    }
    .flight-info p {
      margin: 5px 0;
      color: #555;
    }
    .flight-meta {
      text-align: right;
      color: #555;
    }
    .flight-meta span {
      display: block;
      margin: 5px 0;
    }
    .flight-meta .flight-time {
      font-weight: bold;
      color: #333;
    }
    .error-message {
      color: red;
      text-align: center;
    }

    .book-button {
      background-color: #007bff;
      color: #fff;
      padding: 10px 20px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      text-decoration: none;
      font-size: 16px;
    }
    .book-button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>

<h2>Available Flights</h2>

<%
  System.out.println("JSP page loaded"); // Debug statement
  List<Flight> flightsList = (List<Flight>) request.getAttribute("flightList");
%>

<%
  String errorMessage = (String) request.getAttribute("errorMessage");
  if (errorMessage != null) {
%>
<p class="error-message"><%= errorMessage %></p>
<%
  }
%>

<%
  if (flightsList != null && !flightsList.isEmpty()) {
    for (Flight flight : flightsList) {
%>
<div class="flight-card">
  <div class="flight-info">
    <h3><%= flight.getAirline() %> | Flight No: <%= flight.getFlightNumber() %></h3>
    <p>From: <%= flight.getDepartureName() %> (<%= flight.getDepartureId() %>)</p>
    <p>To: <%= flight.getArrivalName() %> (<%= flight.getArrivalId() %>)</p>
    <p>Departure Time: <%= flight.getDepartureTime() %></p>
    <p>Arrival Time: <%= flight.getArrivalTime() %></p>
    <p>Airplane: <%= flight.getAirplane() %></p>
    <p>Legroom: <%= flight.getLegroom() %></p>
    <p>Extensions: <%= flight.getExtensions() %></p>
    <p>Travel Class: <%= flight.getTravelClass() %></p>
    <p>Type: <%= flight.getType() %></p>
<%--    <p>Booking Token: <%= flight.getBookingToken() %></p>--%>
  </div>
  <div class="flight-meta">
    <span class="flight-time">Duration: <%= flight.getDuration() %> minutes</span>
    <span>Total Duration: <%= flight.getTotalDuration() %> minutes</span>
    <span>Carbon Emissions: <%= flight.getCarbonEmissions() %> kg CO2</span>
    <span>Price: ₹<%= flight.getPrice() %></span>

    <form action="bookFlight/bookFlight.jsp" method="POST">
      <input type="hidden" name="flightNumber" value="<%= flight.getFlightNumber() %>">
      <input type="hidden" name="airline" value="<%= flight.getAirline() %>">
      <input type="hidden" name="departure" value="<%= flight.getDepartureName() %>">
      <input type="hidden" name="arrival" value="<%= flight.getArrivalName() %>">
      <input type="submit" class="book-button" value="Book">
    </form>
  </div>
</div>
<%
  }
} else {
%>
<p class="error-message">No flights found or data not available.</p>
<%
  }
%>

</body>
</html>