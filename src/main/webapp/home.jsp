<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flight Management Service</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
<!-- Header -->
<header>
  <div class="container">
    <h1>Flight Management Service</h1>
    <nav>
      <ul>
        <li><a href="index.jsp">Home</a></li>
        <li><a href="about.jsp">About Us</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="login.jsp">Login</a></li>
      </ul>
    </nav>
  </div>
</header>

<!-- Main Content -->
<main>
  <div class="container">
    <section class="search">
      <h2>Find Your Flight</h2>
      <form action="" method="get">
        <label for="departure">Departure City:</label>
        <input type="text" id="departure" name="departure" required>

        <label for="arrival">Arrival City:</label>
        <input type="text" id="arrival" name="arrival" required>

        <label for="departureDate">Departure Date:</label>
        <input type="date" id="departureDate" name="departureDate" required>

        <label for="returnDate">Return Date:</label>
        <input type="date" id="returnDate" name="returnDate">

        <button type="submit">Search Flights</button>
      </form>
    </section>

    <section class="about">
      <h2>About Us</h2>
      <p>Welcome to our Flight Management Service! We offer the best flight deals and booking options for your travel needs. Whether you are looking for domestic or international flights, we have you covered.</p>
    </section>
  </div>
</main>

<!-- Footer -->
<footer>
  <div class="container">
    <p>&copy; 2024 Flight Management Service. All rights reserved.</p>
  </div>
</footer>
</body>
</html>
