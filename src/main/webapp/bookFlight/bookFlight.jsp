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

<div class="booking-container">
    <div class="flight-info">
        <h3>Flight Information</h3>
        <p><strong>Flight Number:</strong> <%= request.getAttribute("flightNumber") %></p>
        <p><strong>Airline:</strong> <%= request.getAttribute("airline") %></p>
        <p><strong>Departure:</strong> <%= request.getAttribute("departure") %></p>
        <p><strong>Arrival:</strong> <%= request.getAttribute("arrival") %></p>
        <p><strong>Departure Time:</strong> <%= request.getAttribute("departureTime") %></p>
        <p><strong>Arrival Time:</strong> <%= request.getAttribute("arrivalTime") %></p>
        <p><strong>Airplane:</strong> <%= request.getAttribute("airplane") %></p>
        <p><strong>Legroom:</strong> <%= request.getAttribute("legroom") %></p>
        <p><strong>Extensions:</strong> <%= String.valueOf(request.getAttribute("extensions")) %></p>
        <p><strong>Travel Class:</strong> <%= request.getAttribute("travelClass") %></p>
        <p><strong>Duration:</strong> <%= request.getAttribute("duration") %> minutes</p>
        <p><strong>Layovers:</strong> <%= String.valueOf(request.getAttribute("layovers")) %></p>
        <p><strong>Price:</strong> ₹<%= request.getAttribute("price") %></p>
        <p><strong>Carbon Emissions:</strong> <%= request.getAttribute("carbonEmissions") %> kg CO2</p>
        <p><strong>Selected Seat:</strong> <span id="selectedSeatDisplay"><%= request.getParameter("selectedSeat") %></span></p>
    </div>

    <form action="${pageContext.request.contextPath}/ConfirmBookingServlet" method="POST" id="bookingForm">
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

        <input type="hidden" name="flightNumber" value="<%= request.getAttribute("flightNumber") %>">
        <input type="hidden" name="airline" value="<%= request.getAttribute("airline") %>">
        <input type="hidden" name="departure" value="<%= request.getAttribute("departure") %>">
        <input type="hidden" name="arrival" value="<%= request.getAttribute("arrival") %>">
        <input type="hidden" name="departureTime" value="<%= request.getAttribute("departureTime") %>">
        <input type="hidden" name="arrivalTime" value="<%= request.getAttribute("arrivalTime") %>">
        <input type="hidden" name="airplane" value="<%= request.getAttribute("airplane") %>">
        <input type="hidden" name="legroom" value="<%= request.getAttribute("legroom") %>">
        <input type="hidden" name="extensions" value="<%= request.getAttribute("extensions") %>">
        <input type="hidden" name="travel_class" value="<%= request.getAttribute("travelClass") %>">
        <input type="hidden" name="duration" value="<%= request.getAttribute("duration") %>">
        <input type="hidden" name="layovers" value="<%= request.getAttribute("layovers") %>">
        <input type="hidden" name="price" value="<%= request.getAttribute("price") %>">
        <input type="hidden" name="carbon_emissions" value="<%= request.getAttribute("carbonEmissions") %>">
        <input type="hidden" name="selectedSeat" id="selectedSeat" value="<%= request.getParameter("selectedSeat") %>">

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
