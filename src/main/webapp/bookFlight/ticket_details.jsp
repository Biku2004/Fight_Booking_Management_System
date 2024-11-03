<%@ page import="java.sql.ResultSet" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Boarding Pass</title>
  <style>
    body {
      margin: 0;
      padding: 0;
      background: #e8e8e8; /* Light gray background */
      font-family: 'Arial', sans-serif;
      display: flex; /* Use Flexbox on the body */
      justify-content: center; /* Center horizontally */
      align-items: center; /* Center vertically */
      height: 100vh; /* Full viewport height */
      flex-direction: column; /* Stack elements vertically */
    }

    .boarding-pass {
      width: 800px; /* Width suitable for a boarding pass */
      height: 300px; /* Height for the boarding pass */
      background: linear-gradient(to right, #fff, #f0f0f0); /* Gradient background */
      border: 2px solid #0077cc; /* Blue color for border */
      border-radius: 5px;
      box-shadow: 0 4px 20px rgba(0, 0, 0, 0.5);
      padding: 20px;
      position: relative;
      overflow: hidden;
      display: flex; /* Flexbox for layout */
      flex-direction: row; /* Horizontal layout */
      justify-content: space-between; /* Space between elements */
      margin-bottom: 20px; /* Space below the boarding pass */
    }

    .left-section, .right-section {
      flex: 1; /* Equal width for both sections */
      padding: 10px;
    }

    .left-section {
      border-right: 2px solid #0077cc; /* Divider line */
      padding-right: 20px; /* Add padding for better spacing */
    }

    h2 {
      text-align: center;
      margin: 0;
      font-size: 24px; /* Increased font size for the title */
      color: #0077cc; /* Blue for the title */
      padding-bottom: 10px;
    }

    .details {
      margin-top: 10px;
    }

    .details p {
      margin: 4px 0;
      font-size: 16px; /* Increased font size for better readability */
      line-height: 1.4; /* Increase line height for clarity */
    }

    .details strong {
      color: #0077cc; /* Blue for strong labels */
    }

    .barcode {
      margin: 20px 0;
      width: 100%;
      height: 60px; /* Increased height for barcode */
      background: #eee; /* Placeholder for barcode */
      border: 1px solid #0077cc; /* Border for visual separation */
      text-align: center;
      line-height: 60px; /* Center barcode text vertically */
      font-size: 20px; /* Larger font size for barcode text */
      color: #0077cc; /* Color for barcode text */
      font-weight: bold; /* Bold text for emphasis */
    }

    .footer {
      text-align: center;
      font-size: 14px; /* Slightly larger footer text */
      color: #777;
      margin-top: 20px;
      width: 100%;
    }

    .print-button {
      background-color: #0077cc; /* Button background color */
      color: white; /* Button text color */
      border: none; /* Remove default border */
      border-radius: 5px; /* Rounded corners */
      padding: 10px 20px; /* Padding inside the button */
      font-size: 16px; /* Font size for the button */
      cursor: pointer; /* Change cursor on hover */
      transition: background-color 0.3s; /* Smooth transition */
    }

    .print-button:hover {
      background-color: #005fa3; /* Darker shade on hover */
    }

    /* Additional styling for authenticity */
    .boarding-pass::after {
      content: "";
      position: absolute;
      top: 20px;
      left: 20px;
      right: 20px;
      bottom: 20px;
      border: 1px dashed #0077cc; /* Dashed border for a realistic effect */
      pointer-events: none; /* Ensure the overlay is not interactive */
    }

    /* Style for the flight information */
    .flight-info {
      display: flex;
      justify-content: space-between;
      margin-top: 10px;
    }

    /* New styles for the right section */
    .advertising {
      text-align: center;
      margin-top: 20px;
    }

    .advertising h3 {
      margin: 10px 0;
      font-size: 18px; /* Font size for company name */
      color: #0077cc; /* Color for company name */
    }

    .advertising p {
      font-size: 14px; /* Font size for tagline/contact */
      color: #555; /* Darker gray for tagline/contact */
    }
  </style>
  <script>
    function printBoardingPass() {
      window.print(); // Trigger the print dialog
    }
  </script>
</head>
<body>
<div class="container">
  <div class="boarding-pass">
    <div class="left-section">
      <h2>Boarding Pass</h2>
      <%
        ResultSet ticket = (ResultSet) request.getAttribute("ticket");
      %>
      <div class="details">
        <p><strong>Passenger:</strong> <%= ticket.getString("full_name") %></p>
        <p><strong>Flight:</strong> <%= ticket.getString("flight_number") %></p>
        <div class="flight-info">
          <p><strong>Departure:</strong> <%= ticket.getString("departure") %></p>
          <p><strong>Arrival:</strong> <%= ticket.getString("arrival") %></p>
        </div>
        <div class="flight-info">
          <p><strong>Seat:</strong> <%= ticket.getString("seat") %></p>
            <p><strong>Gate:</strong> 22C</p>
          <p><strong>Class:</strong> <%= ticket.getString("travel_class") %></p>
        </div>
        <p><strong>Price:</strong> ₹<%= ticket.getBigDecimal("price") %></p>
      </div>
    </div>
    <div class="right-section">
      <div class="barcode">
        <!-- Placeholder for barcode image -->
        | 123456789012 | <!-- Replace with actual barcode if available -->
      </div>
      <div class="advertising">
        <h3>SkyWay</h3>
        <p>Experience the <i>future of flight management</i> with us.</p>
        <p>Contact: +91 77185 68456</p>
        <p>Email: info@skyway.com</p>
      </div>
    </div>
  </div>
  <div class="footer">* This is a computer-generated boarding pass.</div>
  <button class="print-button" onclick="printBoardingPass()">Print Boarding Pass</button> <!-- Print button -->
</div>
</body>
</html>
