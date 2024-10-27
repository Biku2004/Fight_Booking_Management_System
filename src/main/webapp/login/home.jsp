<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">
<head>

  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Flight Booking</title>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/cssFile/home.css">
  <script src="https://cdn.jsdelivr.net/npm/handlebars@4.7.7/dist/handlebars.min.js"></script>

  <style>
    /* Reset some default styles */
    body, h1, h2, h3, p, a {
      margin: 0;
      padding: 0;
      text-decoration: none;
      color: inherit;
    }

    /* Header styles */
    .header {
      position: sticky; /* Make the header sticky */
      top: 0; /* Stick to the top of the page */
      background-color: #fff; /* Background color of the navbar */
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Slight shadow for depth */
      z-index: 1000; /* Ensure it stays above other elements */
    }

    /* Navbar styles */
    .navbar {
      display: flex; /* Flexbox for horizontal alignment */
      justify-content: space-between; /* Space between nav links and profile section */
      align-items: center; /* Center items vertically */
      padding: 10px 20px; /* Padding for spacing */
    }

    /* Navigation links */
    .nav-links {
      display: flex; /* Flexbox for horizontal alignment */
    }

    .nav-links a {
      margin: 0 15px; /* Space between links */
      font-size: 16px; /* Font size for links */
      color: #333; /* Link color */
      transition: color 0.3s; /* Transition for hover effect */
    }

    .nav-links a:hover {
      color: #007bff; /* Change color on hover */
    }

    /* Profile section styles */
    .profile-dropdown {
      position: relative; /* Position relative for dropdown */
      margin-left: 20px; /* Space from the edge */
    }

    .profile-photo {
      width: 40px; /* Width of the profile photo */
      height: 40px; /* Height of the profile photo */
      border-radius: 50%; /* Round profile photo */
      cursor: pointer; /* Pointer cursor on hover */
    }

    /* Dropdown content styles */
    .dropdown-content {
      display: none; /* Hidden by default */
      position: absolute; /* Absolute position for dropdown */
      right: 0; /* Align dropdown to the right */
      background-color: white; /* Background color of the dropdown */
      min-width: 150px; /* Minimum width of dropdown */
      box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2); /* Shadow for dropdown */
      z-index: 1001; /* Ensure it stays above other elements */
    }

    .profile-dropdown:hover .dropdown-content {
      display: block; /* Show dropdown on hover */
    }

    .dropdown-content a {
      display: block; /* Block display for links */
      padding: 10px; /* Padding for dropdown links */
      color: #333; /* Color for dropdown links */
    }

    .dropdown-content a:hover {
      background-color: #f0f0f0; /* Background color on hover */
    }


    /* Hero section */
    .hero {
      background: url('../images/hero-background.jpg') no-repeat center center/cover;
      height: 80vh;
      display: flex;
      justify-content: center;
      align-items: center;
      position: relative;
      color: #fff;
      text-align: center;
    }

    .hero-content {
      max-width: 800px;
      padding: 40px;
      background-color: rgba(0, 0, 0, 0.2); /* Semi-transparent background */
      border-radius: 10px;
    }

    .hero-title {
      font-size: 3.5rem;
      font-weight: bold;
      margin-bottom: 1rem;
      animation: fadeIn 2s ease-out;
    }

    .hero-highlight {
      color: #78b8ff; /* Gold color for SkyWay highlight */
    }

    .hero-subtitle {
      font-size: 1.7rem;
      margin-bottom: 2rem;
      animation: fadeIn 2.5s ease-out;
    }

    .hero-btn {
      padding: 12px 24px;
      background-color: #007BFF;
      color: #fff;
      text-decoration: none;
      font-size: 1.2rem;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    .hero-btn:hover {
      background-color: #0056b3;
    }

    /* Keyframe animation for fading effect */
    @keyframes fadeIn {
      0% { opacity: 0; transform: translateY(-20px); }
      100% { opacity: 1; transform: translateY(0); }
    }

    /* Booking form */
    .booking {
      text-align: center;
      padding: 90px 20px;
    }
    .booking-options {
      margin-top: 2rem;
      padding: 1rem;
      background: #f9f9f9;
      border-radius: 8px;
      max-width: 900px;
      margin-left: auto;
      margin-right: auto;
    }

    .booking h1 {
      text-align: center;
      color: #333;
    }

    .form-group {
      margin: 15px 0;
    }

    .form-group input {
      width: 100%;
      padding: 8px;
      border: 1px solid #ddd;
      border-radius: 4px;
    }

    .search-btn {
      background-color: #4CAF50;
      color: white;
      padding: 10px 20px;
      border: none;
      border-radius: 4px;
      cursor: pointer;
    }

    /* Spinner styling */
    .spinner {
      display: none;
      position: fixed;
      z-index: 999;
      top: 50%;
      left: 50%;
      width: 50px;
      height: 50px;
      margin: -25px 0 0 -25px;
      border: 4px solid rgba(0, 0, 0, 0.3);
      border-top: 4px solid #000;
      border-radius: 50%;
      animation: spin 1s linear infinite;
    }

    @keyframes spin {
      0% { transform: rotate(0deg); }
      100% { transform: rotate(360deg); }
    }
    /* Popular Destinations Styles */
    .popular-destinations {
      height: 80vh;
      text-align: center;
      background: #ffffff;
      padding: 90px 20px;
    }

    .destinations-grid {
      display: grid;
      grid-template-columns: repeat(auto-fill, minmax(200px, 1fr));
      gap: 20px;
      margin-top: 20px;
    }

    .destination-item {
      background: white;
      border-radius: 8px;
      overflow: hidden;
      transition: transform 0.3s;
    }

    .destination-item img {
      width: 100%;
      height: auto;
    }

    .destination-item h3 {
      margin: 10px 0 5px;
    }

    .destination-item p {
      color: #555;
      padding: 0 10px 10px;
    }

    .destination-item:hover {
      transform: scale(1.05);
    }

    /* About Us Section */

    .about-us {
      height: 80vh;
      padding: 90px 20px;
      text-align: center;
      background-color: #fff;
    }

    .about-us h2 {
      font-size: 2.5rem;
      margin-bottom: 20px;
      color: #333;
    }

    .about-us p {
      font-size: 1.2rem;
      color: #666;
      max-width: 800px;
      margin: 0 auto;
    }
    /* Contact Us Section */
    .contact {
      padding: 90px 20px;
      background-color: #f9f9f9;
      text-align: center;
    }

    .contact h2 {
      font-size: 2.5rem;
      margin-bottom: 20px;
      color: #333;
    }

    .contact p {
      font-size: 1.2rem;
      color: #666;
      margin: 5px 0;
    }

    .contact a {
      color: #007BFF;
      text-decoration: none;
    }

    .contact a:hover {
      text-decoration: underline;
    }

    .social-media {
      margin: 20px 0;
    }

    .social-media a {
      margin: 0 10px;
      font-size: 1.2rem;
      color: #007BFF;
    }

    .social-media a:hover {
      text-decoration: underline;
    }

    form {
      margin-top: 20px;
      display: inline-block;
      max-width: 600px;
      width: 100%;
    }

    .form-group {
      margin-bottom: 15px;
    }

    .form-group label {
      display: block;
      font-size: 1rem;
      color: #333;
      margin-bottom: 5px;
    }

    .form-group input,
    .form-group textarea {
      width: 100%;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 4px;
      font-size: 1rem;
    }

    .form-group textarea {
      height: 100px;
      resize: vertical;
    }

    .submit-btn {
      padding: 10px 15px;
      background-color: #007BFF;
      color: #fff;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-size: 1rem;
    }

    .submit-btn:hover {
      background-color: #0056b3;
    }

    /* Smooth scrolling */
    html {
      scroll-behavior: smooth;
    }
  </style>

</head>
<body>
<header class="header">
  <nav class="navbar">
    <div class="nav-links">
      <a href="#hero">Home</a>
      <a href="#booking">Book a Flight</a>
      <a href="#popular-destinations">Popular Destinations</a>
      <a href="#about">About Us</a>
      <a href="#contact">Contact Us</a>
    </div>

    <!-- Profile section -->
    <div class="profile-dropdown">
      <%
        byte[] profilePhoto = (byte[]) session.getAttribute("profile_photo");
        if (profilePhoto != null) {
          String base64Image = Base64.getEncoder().encodeToString(profilePhoto);
          out.print("<img src='data:image/png;base64," + base64Image + "' alt='Profile Photo' class='profile-photo'>");
        } else {
          out.print("<img src='default-profile.png' alt='Profile Photo' class='profile-photo'>");
        }
      %>
      <div class="dropdown-content">
        <a href="<%= request.getContextPath() %>/editProfile?email=<%= session.getAttribute("email") %>">Edit Profile</a>
        <a href="login.jsp">Logout</a>
      </div>
    </div>
  </nav>
</header>


<!-- Hero Section -->
<section id="hero" class="hero">
  <div class="hero-content">
    <h1 class="hero-title">Explore the World with <span class="hero-highlight">SkyWay</span></h1>
    <p class="hero-subtitle">Your gateway to the best flight deals and unforgettable experiences</p>
    <a href="#booking" class="hero-btn">Book a Flight</a>
  </div>
</section>


<main>
  <!-- Booking Section -->
  <section id="booking" class="booking">
    <h1>Hi there, where would you like to <span class="skyway">SkyWay</span> today?</h1>

    <div class="booking-options">
      <div id="loadingSpinner" class="spinner"></div>

      <form id="flightSearchForm" method="post" action="${pageContext.request.contextPath}/flightSearchClone" onsubmit="showLoading()">
        <div class="trip-type">
          <input type="radio" id="oneway" name="trip" value="oneway" checked onclick="toggleReturnDate()">
          <label for="oneway">One Way</label>
          <input type="radio" id="roundtrip" name="trip" value="roundtrip" onclick="toggleReturnDate()">
          <label for="roundtrip">Round Trip</label>
        </div>

        <div class="booking-form">
          <div class="form-group dropdown">
            <label for="fromAirport">From</label>
            <input type="text" id="fromAirport" name="from" placeholder="Airport">
          </div>

          <div class="form-group">
            <label for="to">To</label>
            <input type="text" id="to" name="to" placeholder="Search by place/airport">
          </div>
          <div class="form-group">
            <label for="departure">Departure</label>
            <input type="date" id="departure" name="departure">
          </div>
          <div class="form-group" id="returnField">
            <label for="return">Return</label>
            <input type="date" id="return" name="return">
          </div>
          <div class="form-group">
            <label for="passengers">Passengers</label>
            <input type="number" id="passengers" name="passengers" value="1">
          </div>

          <div class="search">
            <button type="submit" class="search-btn">Search</button>
          </div>
        </div>
      </form>
    </div>
  </section>

  <!-- Popular Destinations Section -->
  <section id="popular-destinations" class="popular-destinations">
    <h2>Popular Destinations</h2>
    <div class="destinations-grid">
      <div class="destination-item">
        <img src="../images/destination1.jpg" alt="Destination 1">
        <h3>Paris</h3>
        <p>The city of lights, known for its art, fashion, and culture.</p>
      </div>
      <div class="destination-item">
        <img src="../images/destination2.jpg" alt="Destination 2">
        <h3>New York</h3>
        <p>The city that never sleeps, a hub of entertainment and opportunity.</p>
      </div>
      <div class="destination-item">
        <img src="../images/destination3.jpg" alt="Destination 3">
        <h3>Tokyo</h3>
        <p>A vibrant city blending tradition and modernity.</p>
      </div>
      <div class="destination-item">
        <img src="../images/destination4.jpg" alt="Destination 4">
        <h3>London</h3>
        <p>Rich in history and known for its iconic landmarks.</p>
      </div>
      <div class="destination-item">
        <img src="../images/destination5.jpg" alt="Destination 5">
        <h3>Rome</h3>
        <p>Famous for its ancient ruins and beautiful architecture.</p>
      </div>
      <div class="destination-item">
        <img src="../images/destination6.jpg" alt="Destination 6">
        <h3>Sydney</h3>
        <p>Home to stunning beaches and the iconic Opera House.</p>
      </div>
    </div>
  </section>

  <!-- About Us Section -->
  <section id="about" class="about-us">
    <h2>About Us</h2>
    <p>SkyWay is committed to providing the best flight booking experience for travelers around the world. Our mission is to connect people with the destinations they love, ensuring a seamless and enjoyable journey.</p>
  </section>

  <!-- Contact Section -->
  <section id="contact" class="contact">
    <h2>Contact Us</h2>
    <p>Email: <a href="mailto:support@skyway.com">support@skyway.com</a></p>
    <p>Phone: <a href="tel:+1234567890">+123 456 7890</a></p>
    <p>Address: 123 Skyway Blvd, Travel City, TX 78901</p>
    <p>Follow us on social media:</p>
    <div class="social-media">
      <a href="https://www.facebook.com/SkyWay" target="_blank">Facebook</a>
      <a href="https://twitter.com/SkyWay" target="_blank">Twitter</a>
      <a href="https://www.instagram.com/SkyWay" target="_blank">Instagram</a>
    </div>
    <h3>Send us a message:</h3>
    <form id="contactForm">
      <div class="form-group">
        <label for="name">Name</label>
        <input type="text" id="name" name="name" required>
      </div>
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" required>
      </div>
      <div class="form-group">
        <label for="message">Message</label>
        <textarea id="message" name="message" required></textarea>
      </div>
      <button type="submit" class="submit-btn">Send Message</button>
    </form>
  </section>

</main>

<script>
  // Scroll to home section on page load
  window.onload = function() {
    window.scrollTo(0, 0);
  }

  function toggleReturnDate() {
    const isRoundTrip = document.getElementById('roundtrip').checked;
    const returnField = document.getElementById('returnField');
    if (isRoundTrip) {
      returnField.style.display = 'block';
    } else {
      returnField.style.display = 'none';
    }
  }

  // Initialize visibility based on default checked value
  document.addEventListener('DOMContentLoaded', () => {
    toggleReturnDate();
  });



  document.addEventListener('DOMContentLoaded', function() {
    var sendFlightDataBtn = document.getElementById('sendFlightDataBtn');
    var flightDataForm = document.getElementById('flightDataForm');

    sendFlightDataBtn.addEventListener('click', function() {
      var fromValue = document.getElementById('fromAirport').value;
      var toValue = document.getElementById('to').value;
      var date = document.getElementById('departure').value;

      if (fromValue && toValue && date) {
        document.getElementById('fromInput').value = fromValue;
        document.getElementById('toInput').value = toValue;
        document.getElementById('date').value = date;
        alert(fromValue + toValue + date)
        flightDataForm.submit();
      } else {
        alert('Please enter both "From" and "To" airports before sending flight data.');
      }
    });

  });

  function showLoading() {
    // Show the loading spinner
    document.getElementById("loadingSpinner").style.display = "block";

    // Optionally disable page interaction during loading
    document.body.classList.add("loading");
  }

  // Optional: Hide spinner once the page reloads or search completes
  window.onload = function() {
    document.getElementById("loadingSpinner").style.display = "none";
    document.body.classList.remove("loading");
  };
</script>
</body>
</html>
