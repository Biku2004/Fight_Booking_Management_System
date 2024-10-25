<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Flight</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssFile/bookFlight.css">
</head>
<body>

<h2>Flight Booking</h2>

<div class="booking-wrapper">
<div class="booking-container">
    <h3>Flight Information</h3>
    <table class="flight-info-table">
        <tbody>
        <tr>
            <td><strong>Flight Number:</strong></td>
            <td><%= request.getAttribute("flightNumber") %></td>
        </tr>
        <tr>
            <td><strong>Airline:</strong></td>
            <td><%= request.getAttribute("airline") %></td>
        </tr>
        <tr>
            <td><strong>Departure:</strong></td>
            <td><%= request.getAttribute("departure") %></td>
        </tr>
        <tr>
            <td><strong>Arrival:</strong></td>
            <td><%= request.getAttribute("arrival") %></td>
        </tr>
        <tr>
            <td><strong>Departure Time:</strong></td>
            <td><%= request.getAttribute("departureTime") %></td>
        </tr>
        <tr>
            <td><strong>Arrival Time:</strong></td>
            <td><%= request.getAttribute("arrivalTime") %></td>
        </tr>
        <tr>
            <td><strong>Airplane:</strong></td>
            <td><%= request.getAttribute("airplane") %></td>
        </tr>
        <tr>
            <td><strong>Legroom:</strong></td>
            <td><%= request.getAttribute("legroom") %></td>
        </tr>
        <tr>
            <td><strong>Extensions:</strong></td>
            <td><%= String.valueOf(request.getAttribute("extensions")) %></td>
        </tr>
        <tr>
            <td><strong>Travel Class:</strong></td>
            <td><%= request.getAttribute("travelClass") %></td>
        </tr>
        <tr>
            <td><strong>Duration:</strong></td>
            <td><%= request.getAttribute("duration") %> minutes</td>
        </tr>
        <tr>
            <td><strong>Layovers:</strong></td>
            <td><%= String.valueOf(request.getAttribute("layovers")) %></td>
        </tr>
        <tr>
            <td><strong>Price:</strong></td>
            <td>₹<%= request.getAttribute("price") %></td>
        </tr>
        <tr>
            <td><strong>Carbon Emissions:</strong></td>
            <td><%= request.getAttribute("carbonEmissions") %> kg CO2</td>
        </tr>
        <tr>
            <td><strong>Selected Seat:</strong></td>
            <td><span id="selectedSeatDisplay"><%= request.getParameter("selectedSeat") %></span></td>
        </tr>
        </tbody>
    </table>
</div>


    <form action="${pageContext.request.contextPath}/ConfirmBookingServlet" method="POST" id="bookingForm">
        <h3> Give Details Here</h3>
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" required>
        </div>
        <div class="form-group">
            <label for="Seats">Seats:</label>
            <input type="text" id="Seats" name="Seats" value="<%= request.getParameter("selectedSeat") %>" readonly>
            <button type="button" onclick="openSeatSelection()">Select Seat</button>
        </div>
        <div id="passengerList"></div>

        <button type="button" class="add-passenger-btn" id="addPassengerBtn">+ Add Adult/Child</button>

        <button type="submit" class="book-now">Confirm Booking</button>
    </form>
</div>


<script>
    function openSeatSelection() {
        const selectedSeat = document.getElementById('Seats').value;
        const seatWindow = window.open('${pageContext.request.contextPath}/bookFlight/seats.jsp', 'Select Seat', 'width=800,height=600');

        seatWindow.onload = function() {
            const previousSeatElement = seatWindow.document.getElementById('previouslySelectedSeat');
            if (previousSeatElement) {
                previousSeatElement.value = selectedSeat;
            }
        };
    }

    function updateSelectedSeat(seatId) {
        document.getElementById('Seats').value = seatId;
        document.getElementById('selectedSeatDisplay').innerText = seatId;
    }

    let passengerCount = 0;
    const addPassengerBtn = document.getElementById('addPassengerBtn');
    const passengerList = document.getElementById('passengerList');

    addPassengerBtn.addEventListener('click', () => {
        passengerCount++;

        const passengerDiv = document.createElement('div');
        passengerDiv.classList.add('passenger-container');
        passengerDiv.innerHTML = `
            <h4>Passenger ${passengerCount}</h4>
            <div class="form-group">
                <label for="passengerName${passengerCount}">Name:</label>
                <input type="text" name="passengerName${passengerCount}" required>
            </div>
            <div class="form-group">
                <label for="passengerAge${passengerCount}">Age:</label>
                <input type="number" name="passengerAge${passengerCount}" required>
            </div>
            <button type="button" class="remove-passenger" onclick="removePassenger(this)">Remove Passenger</button>
        `;

        passengerList.appendChild(passengerDiv);
    });

    function removePassenger(button) {
        const passengerDiv = button.parentNode;
        passengerDiv.parentNode.removeChild(passengerDiv);
        passengerCount--;
    }
</script>

</body>
</html>