<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flight Booking</title>
  <link rel="stylesheet" href="home.css">
</head>
<body>
<header class="header">
  <nav class="navbar">
    <div class="nav-links">
      <a href="#">a</a>
      <a href="#">b</a>
      <a href="#">c</a>
      <a href="#">d</a>
      <a href="#">e</a>
    </div>
    <div class="login">
      <button class="login-btn" ><a href="login.jsp">Login</a></button>
      <button class="login-btn" ><a href="Registration.jsp">Registration</a></button>
      <button class="login-btn" ><a href="Registrationstyle.css">Registration</a></button>
      
    </div>
  </nav>
</header>

<main>
  <section class="booking">
    <h1>Hi there, where would you like to <span class="skyway">SkyWay</span> today?</h1>
    <div class="booking-options">
      <div class="flight-hotel">
        <button class="flight-btn active">✈️ Book a flight</button>
      </div>
      <div class="trip-type">
        <input type="radio" id="oneway" name="trip" checked>
        <label for="oneway">One Way</label>
        <input type="radio" id="roundtrip" name="trip">
        <label for="roundtrip">Round Trip</label>
      </div>
      <div class="booking-form">
        <div class="form-group">
          <label for="from">From</label>
          <input type="text" id="from" placeholder="Search by place/airport" value="<%= request.getParameter("from") != null ? request.getParameter("from") : "Delhi, DEL" %>">
        </div>
        <div class="form-group">
          <label for="to">To</label>
          <input type="text" id="to" placeholder="Search by place/airport" value="<%= request.getParameter("to") != null ? request.getParameter("to") : "Kolkata, CCU" %>">
        </div>
        <div class="form-group">
          <label for="departure">Departure</label>
          <input type="date" id="departure" value="<%= request.getParameter("departure") != null ? request.getParameter("departure") : "" %>">
        </div>
        <div class="form-group">
          <label for="return">Return</label>
          <input type="date" id="return" value="<%= request.getParameter("return") != null ? request.getParameter("return") : "" %>">
        </div>
        <div class="form-group">
          <label for="passengers">Passengers</label>
          <input type="number" id="passengers" value="<%= request.getParameter("passengers") != null ? request.getParameter("passengers") : "1" %>">
        </div>
        <div class="search">
          <button class="search-btn">Search</button>
        </div>
      </div>
    </div>
  </section>
</main>
</body>
</html>
