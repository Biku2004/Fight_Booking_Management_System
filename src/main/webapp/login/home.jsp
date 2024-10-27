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
    }

    /* Header styles */
    .header {
      position: sticky; /* Make the header sticky */
      top: 0; /* Stick to the top of the page */
      background-color: #ffffff; /* Background color of the navbar */
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
      cursor: pointer; /* Pointer cursor on hover */
    }

    .profile-photo {
      width: 40px; /* Profile photo width */
      height: 40px; /* Profile photo height */
      border-radius: 50%; /* Rounded profile photo */
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
      background: url('../Images/background.jpg') no-repeat center center/cover;
      height: 100vh;
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
      background-color: rgba(0, 0, 0, 0.4); /* Semi-transparent background */
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
      padding: 100px 20px;
    }
    .booking-options {
      margin-top: 2rem;
      padding: 1rem;
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

    /* Popular Destinations Section Styling */
    .popular-destinations {
      padding: 80px 20px;
      display: flex;
      flex-direction: column;
      align-items: center;
      position: relative;
      h2{
        text-align: center; /* Centers the main heading */
        font-size: 2.5em; /* Increases font size for prominence */
        color: #333; /* Darker text color for contrast */
        margin-bottom: 20px; /* Space below the heading */
        font-weight: 600; /* Bold weight for the heading */
      }
    }

    .destination-viewer {
      position: relative;
      width: 70%;
      height: 80vh;
      overflow: hidden; /* Prevent overflow of image */
    }

    .destination-image img {
      width: 100%; /* Cover the entire width */
      height: 100%; /* Cover the entire height */
      object-fit: cover; /* Ensure the image covers the area */
      border-radius: 8px;
    }

    .destination-details {
      position: absolute; /* Position over the image */
      bottom: 20px; /* Distance from bottom */
      left: 50%; /* Position at the center horizontally */
      transform: translateX(-50%); /* Shift back by half of its own width */
      color: white; /* Text color */
      background: rgba(0, 0, 0, 0.5); /* Semi-transparent background */
      padding: 10px; /* Padding around text */
      border-radius: 8px;
      width: 80%; /* Width for details container */
      text-align: center; /* Center text inside the container */
    }

    .destination-details h3 {
      font-size: 24px;
      margin-bottom: 10px;
    }

    .destination-details p {
      font-size: 18px;
      margin-bottom: 10px;
    }

    .buttons {
      display: flex;
      justify-content: space-between;
    }

    button {
      padding: 10px 20px;
      font-size: 16px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      background-color: #007bff;
      color: #fff;
      transition: background-color 0.3s;
    }

    button:hover {
      background-color: #0056b3;
    }


    /* About Us Section */
    .about-us {
      padding: 80px; /* Increases padding for better spacing */
      background-color: #f9f9f9; /* Light background for contrast */
      border-radius: 10px; /* Adds rounded corners */
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1); /* Softer shadow for depth */
      margin: 0;
      transition: box-shadow 0.3s ease; /* Smooth transition for shadow effect */
    }

    .about-us:hover {
      box-shadow: 0 6px 30px rgba(0, 0, 0, 0.15); /* Enhanced shadow on hover for interaction */
    }

    .about-us h2 {
      text-align: center; /* Centers the main heading */
      font-size: 2.5em; /* Increases font size for prominence */
      color: #333; /* Darker text color for contrast */
      margin-bottom: 20px; /* Space below the heading */
      font-weight: 600; /* Bold weight for the heading */
    }

    .about-us h3 {
      margin-top: 30px; /* Adds space above subheadings */
      color: #007BFF; /* Distinct color for subheadings */
      font-size: 1.8em; /* Slightly larger font for subheadings */
      font-weight: 500; /* Semi-bold for subheadings */
    }

    .about-us p {
      line-height: 1.6; /* Improves readability with increased line height */
      color: #555; /* Softer text color for body text */
      margin-bottom: 15px; /* Space below paragraphs */
      font-size: 1.1em; /* Slightly larger font size for better legibility */
    }

    .about-us ul {
      list-style-type: disc; /* Standard bullet points */
      padding-left: 20px; /* Indents the list */
      margin: 10px 0; /* Space above and below the list */
    }

    .about-us li {
      margin-bottom: 10px; /* Space between list items */
      color: #444; /* Darker color for list items */
      font-size: 1em; /* Consistent font size for list items */
    }

    .about-us strong {
      color: #007BFF; /* Color for strong text */
      font-weight: bold; /* Bold for strong text */
    }

    /* Responsive Design */
    @media (max-width: 768px) {
      .about-us {
        padding: 20px; /* Adjust padding for smaller screens */
      }

      .about-us h2 {
        font-size: 2em; /* Responsive font size */
      }

      .about-us h3 {
        font-size: 1.5em; /* Responsive font size */
      }

      .about-us p {
        font-size: 1em; /* Responsive font size */
      }
    }

    /* Contact Us Section */
    .contact {
      background-color: #333; /* Dark background for footer */
      color: #fff; /* Light text color for contrast */
      padding: 40px; /* Adds padding around the section */
      text-align: left; /* Align text to the left */
    }

    .contact h2 {
      text-align: center; /* Center the main heading */
      font-size: 2em; /* Prominent font size for heading */
      margin-bottom: 20px; /* Space below the heading */
    }

    .contact p {
      margin: 10px 0; /* Space above and below paragraphs */
    }

    .contact a {
      color: #007BFF; /* Bright color for links */
      text-decoration: none; /* Removes underline from links */
    }

    .contact a:hover {
      text-decoration: underline; /* Underline on hover for links */
    }

    .social-media {
      margin: 20px 0; /* Space above and below the social media links */
    }

    .social-media a {
      margin-right: 15px; /* Space between social media links */
      font-size: 1.2em; /* Larger font for social media links */
    }

    .contact h3 {
      margin-top: 30px; /* Space above subheadings */
    }

    .form-group {
      margin-bottom: 15px; /* Space below form groups */
    }

    input[type="text"],
    input[type="email"],
    textarea {
      width: 100%; /* Full width for inputs and text area */
      padding: 10px; /* Padding inside input fields */
      border: 1px solid #ccc; /* Light border for inputs */
      border-radius: 4px; /* Rounded corners for inputs */
      box-sizing: border-box; /* Ensures padding is included in width */
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    textarea:focus {
      border-color: #007BFF; /* Change border color on focus */
      outline: none; /* Removes default outline */
    }

    .submit-btn {
      background-color: #007BFF; /* Bright button color */
      color: #fff; /* White text color */
      border: none; /* No border for button */
      padding: 10px 20px; /* Padding inside button */
      border-radius: 4px; /* Rounded corners for button */
      cursor: pointer; /* Pointer cursor on hover */
      font-size: 1em; /* Font size for button */
    }

    .submit-btn:hover {
      background-color: #0056b3; /* Darker button color on hover */
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
    <div class="destination-viewer">
      <div class="destination-image">
        <img id="destination-img" src="../Images/Agra.jpg" alt="Agra">
        <div class="destination-details">
          <h3 id="destination-title">Agra</h3>
          <p id="destination-desc">Home to the magnificent Taj Mahal, one of the Seven Wonders of the World.</p>
          <div class="buttons">
            <button id="prevButton">Previous</button>
            <button id="nextButton">Next</button>
          </div>
        </div>
      </div>
    </div>
  </section>
  <!-- About Us Section -->
  <section id="about" class="about-us">
    <h2>About Us</h2>
    <p>Welcome to SkyWay, where we are committed to providing the best flight booking experience for travelers around the world. Our mission is to connect people with the destinations they love, ensuring a seamless and enjoyable journey.</p>

    <h3>Our Values</h3>
    <ul>
      <li><strong>Customer Focus:</strong> We prioritize our customers' needs and strive to exceed their expectations.</li>
      <li><strong>Integrity:</strong> We conduct our business with honesty and transparency, building trust with our customers and partners.</li>
      <li><strong>Innovation:</strong> We embrace technology to continuously improve our services and streamline the booking process.</li>
      <li><strong>Sustainability:</strong> We are committed to environmentally responsible travel and reducing our carbon footprint.</li>
    </ul>

    <h3>Our Services</h3>
    <p>SkyWay offers a wide range of services to make your travel planning easier:</p>
    <ul>
      <li>Easy flight search and comparison</li>
      <li>Secure online booking</li>
      <li>24/7 customer support</li>
      <li>Exclusive deals and discounts</li>
      <li>Flexible cancellation and refund policies</li>
    </ul>

    <h3>Why Choose Us?</h3>
    <p>At SkyWay, we understand that travel is not just about reaching a destination; it's about the experiences along the way. Our user-friendly platform and dedicated team are here to help you every step of the journey. Join millions of satisfied travelers who trust SkyWay for their flight booking needs!</p>
  </section>

  <!-- Contact Section -->
  <section id="contact" class="contact">
    <h2>Contact Us</h2>
    <p>Email: <a href="mailto:sayanash347200@gmail.com">sayanash347200@gmail.com</a></p>
    <p>Phone: <a href="tel:+917718568456">+91 77185 68456</a></p>
    <p>Address: Bhubaneswar, Odisha</p>
    <p>Follow us on social media:</p>
    <div class="social-media">
      <a href="https://www.facebook.com/profile.php?id=100034723449266" target="_blank">Facebook</a>
      <a href="https://twitter.com/sayan_ash_" target="_blank">Twitter</a>
      <a href="https://www.instagram.com/s.y.n__a.s.h" target="_blank">Instagram</a>
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




  // JavaScript Functionality for Popular Destinations Section
  // JavaScript for handling next/previous button functionality
  const destinations = [
    {
      img: '../Images/Agra.jpg',
      title: 'Agra',
      desc: 'Home to the magnificent Taj Mahal, one of the Seven Wonders of the World.'
    },
    {
      img: '../Images/Jaipur.jpg',
      title: 'Jaipur',
      desc: 'The Pink City, known for its royal palaces and historic forts.'
    },
    {
      img: '../Images/Goa.jpg',
      title: 'Goa',
      desc: 'Famous for its pristine beaches, vibrant nightlife, and Portuguese architecture.'
    },
    {
      img: '../Images/Kerala.jpg',
      title: 'Kerala',
      desc: "God's Own Country, known for its backwaters and lush landscapes."
    },
    {
      img: '../Images/Leh Ladakh.jpg',
      title: 'Leh Ladakh',
      desc: 'A paradise for adventure seekers, with stunning mountain ranges and serene landscapes.'
    },
    {
      img: '../Images/Varanasi.jpg',
      title: 'Varanasi',
      desc: 'The spiritual capital of India, known for its ghats and sacred Ganges river.'
    },
    {
      img: '../Images/Rishikesh.jpg',
      title: 'Rishikesh',
      desc: 'A spiritual town on the Ganges, famous for yoga, meditation, and adventure sports.'
    },
    {
      img: '../Images/Amritsar.jpg',
      title: 'Amritsar',
      desc: 'Known for the Golden Temple, a symbol of Sikhism and peace.'
    },
    {
      img: '../Images/Mumbai.jpg',
      title: 'Mumbai',
      desc: 'The City of Dreams, a bustling metropolis known for Bollywood and Marine Drive.'
    },
    {
      img: '../Images/Darjeeling.jpg',
      title: 'Darjeeling',
      desc: 'A hill station in West Bengal famous for its tea gardens and panoramic views of the Himalayas.'
    },
    {
      img: '../Images/Udaipur.jpg',
      title: 'Udaipur',
      desc: 'The City of Lakes, known for its romantic charm and royal heritage.'
    },
    {
      img: '../Images/Konark.jpg',
      title: 'Konark',
      desc: 'Famous for the Sun Temple, a UNESCO World Heritage site in Odisha.'
    },
    {
      img: '../Images/Puri.jpg',
      title: 'Puri',
      desc: 'A popular pilgrimage destination in Odisha, known for the Jagannath Temple and beautiful beaches.'
    }
  ];

  let currentDestination = 0;

  function showDestination(index) {
    const destination = destinations[index];
    document.getElementById('destination-img').src = destination.img;
    document.getElementById('destination-title').textContent = destination.title;
    document.getElementById('destination-desc').textContent = destination.desc;
  }

  document.getElementById('prevButton').addEventListener('click', () => {
    currentDestination = (currentDestination - 1 + destinations.length) % destinations.length;
    showDestination(currentDestination);
  });

  document.getElementById('nextButton').addEventListener('click', () => {
    currentDestination = (currentDestination + 1) % destinations.length;
    showDestination(currentDestination);
  });

  // Initialize the first destination
  showDestination(currentDestination);


</script>
</body>
</html>
