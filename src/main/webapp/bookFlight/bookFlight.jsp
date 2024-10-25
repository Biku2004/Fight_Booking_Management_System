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
            background: #f0f8ff;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
        }
        .booking-container {
            background-color: #fff;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
            max-width: 700px;
            width: 100%;
        }
        h2 {
            text-align: center;
            color: #333;
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
            background-color: #28a745;
            color: white;
            padding: 10px;
            border: none;
            width: 100%;
            border-radius: 5px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="booking-container">
    <h2>Flight Booking</h2>

    <div class="flight-info">
        <p><strong>Flight Number:</strong> <%= request.getAttribute("flightNumber") %></p>
        <p><strong>Airline:</strong> <%= request.getAttribute("airline") %></p>
        <p><strong>Selected Seat:</strong> <span id="selectedSeatDisplay"><%= request.getParameter("selectedSeat") %></span></p>
    </div>

    <form id="bookingForm" action="${pageContext.request.contextPath}/ConfirmBookingServlet" method="POST">
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="Seats">Seats:</label>
            <input type="text" id="Seats" name="Seats" value="<%= request.getParameter("selectedSeat") %>" readonly>
            <button type="button" onclick="openSeatSelection()">Select Seat</button>
        </div>

        <button type="submit" class="book-now">Confirm Booking</button>
    </form>
</div>

<script>
    function openSeatSelection() {
        const selectedSeat = document.getElementById('Seats').value;

        // Open the seat selection page in a new window
        const seatWindow = window.open('${pageContext.request.contextPath}/bookFlight/seats.jsp', 'Select Seat', 'width=800,height=600');

        // Send the current selected seat to the new window
        seatWindow.onload = function() {
            seatWindow.document.getElementById('previouslySelectedSeat').value = selectedSeat;
        };
    }

    function updateSelectedSeat(seat) {
        document.getElementById('selectedSeatDisplay').textContent = seat;
        document.getElementById('Seats').value = seat;
    }
</script>

</body>
</html>
