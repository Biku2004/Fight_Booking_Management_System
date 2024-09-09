<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Flight</title>
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
        .booking-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            margin: 20px auto;
        }
        .flight-info {
            margin-bottom: 20px;
        }
        .flight-info p {
            margin: 5px 0;
            color: #555;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .book-now {
            background-color: #007bff;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 16px;
        }
        .book-now:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>

<h2>Flight Booking</h2>

<div class="booking-container">
    <div class="flight-info">
        <h3>Flight Information</h3>
        <p><strong>Airline:</strong> <%= request.getParameter("airline") %></p>
        <p><strong>Flight Number:</strong> <%= request.getParameter("flightNumber") %></p>
        <p><strong>Departure:</strong> <%= request.getParameter("departure") %></p>
        <p><strong>Arrival:</strong> <%= request.getParameter("arrival") %></p>
    </div>

    <form action="ConfirmBookingServlet" method="POST">
        <label for="fullName">Full Name:</label>
        <input type="text" id="fullName" name="fullName" required><br><br>

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required><br><br>

        <label for="phone">Phone:</label>
        <input type="tel" id="phone" name="phone" required><br><br>

        <input type="hidden" name="flightNumber" value="<%= request.getParameter("flightNumber") %>">
        <input type="hidden" name="airline" value="<%= request.getParameter("airline") %>">
        <input type="hidden" name="departure" value="<%= request.getParameter("departure") %>">
        <input type="hidden" name="arrival" value="<%= request.getParameter("arrival") %>">

        <button type="submit">Confirm Booking</button>
    </form>
</div>

</body>
</html>
