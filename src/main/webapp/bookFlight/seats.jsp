<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airplane Seat Selection</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .airplane-body {
            display: flex;
            flex-direction: column;
            align-items: center;
            background-color: #f1f1f1;
            border-radius: 50px;
            padding: 20px;
            box-shadow: 0 0 20px rgba(0, 0, 0, 0.1);
            position: relative;
        }
        .nose {
            width: 80px;
            height: 80px;
            background-color: silver;
            border-radius: 50% 50% 0 0;
            margin-bottom: 10px;
        }
        .tail {
            width: 120px;
            height: 100px;
            background-color: silver;
            border-radius: 0 0 50px 50px;
            margin-top: 10px;
        }
        .airplane-container {
            background-color: white;
            padding: 20px;
            border-radius: 30px;
            display: grid;
            grid-template-columns: repeat(7, 60px);
            grid-gap: 15px;
            justify-content: center;
        }
        .seat {
            width: 50px;
            height: 50px;
            background-color: gray;
            display: flex;
            justify-content: center;
            align-items: center;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
        }
        .seat.selected {
            background-color: green;
        }
        .seat.disabled {
            background-color: red;
            cursor: not-allowed;
        }
        .aisle {
            background-color: transparent;
            border: none;
        }
        .wing {
            width: 400px;
            height: 100px;
            background-color: silver;
            position: absolute;
            left: -200px;
            top: 50%;
            transform: translateY(-50%);
            border-radius: 20px;
            box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
        }
        .wing.right {
            left: auto;
            right: -200px;
        }
    </style>
</head>
<body>

<div class="airplane-body">
    <!-- Airplane Nose (Front) -->
    <div class="nose"></div>

    <!-- Left and Right Wings -->
    <div class="wing"></div>
    <div class="wing right"></div>

    <!-- Airplane Seat Layout -->
    <div class="airplane-container">
        <!-- Row 1 -->
        <div class="seat" id="1A" onclick="toggleSeat(this)">1A</div>
        <div class="seat" id="1B" onclick="toggleSeat(this)">1B</div>
        <div class="aisle"></div>
        <div class="seat" id="1C" onclick="toggleSeat(this)">1C</div>
        <div class="seat" id="1D" onclick="toggleSeat(this)">1D</div>
        <div class="aisle"></div>
        <div class="seat" id="1E" onclick="toggleSeat(this)">1E</div>

        <!-- Row 2 -->
        <div class="seat" id="2A" onclick="toggleSeat(this)">2A</div>
        <div class="seat" id="2B" onclick="toggleSeat(this)">2B</div>
        <div class="aisle"></div>
        <div class="seat" id="2C" onclick="toggleSeat(this)">2C</div>
        <div class="seat" id="2D" onclick="toggleSeat(this)">2D</div>
        <div class="aisle"></div>
        <div class="seat" id="2E" onclick="toggleSeat(this)">2E</div>

        <!-- Row 3 -->
        <div class="seat" id="3A" onclick="toggleSeat(this)">3A</div>
        <div class="seat" id="3B" onclick="toggleSeat(this)">3B</div>
        <div class="aisle"></div>
        <div class="seat" id="3C" onclick="toggleSeat(this)">3C</div>
        <div class="seat" id="3D" onclick="toggleSeat(this)">3D</div>
        <div class="aisle"></div>
        <div class="seat" id="3E" onclick="toggleSeat(this)">3E</div>

        <!-- Add more rows as needed -->
    </div>

    <!-- Airplane Tail (Back) -->
    <div class="tail"></div>
</div>

<form id="seatForm" action="${pageContext.request.contextPath}/bookFlight/bookFlight.jsp" method="POST">
    <input type="hidden" name="selectedSeat" id="selectedSeat">
</form>

<script>
    function toggleSeat(seat) {
        if (seat.classList.contains('disabled')) {
            return;
        }

        const selectedSeatInput = document.getElementById('selectedSeat');
        const previouslySelectedSeat = document.querySelector('.seat.selected');

        if (previouslySelectedSeat) {
            previouslySelectedSeat.classList.remove('selected');
        }

        seat.classList.add('selected');
        selectedSeatInput.value = seat.id;

        // Submit the form automatically
        document.getElementById('seatForm').submit();
    }

    // Disable the selected seat if it is passed from bookFlight.jsp
    const selectedSeat = '<%= request.getParameter("selectedSeat") %>';
    if (selectedSeat) {
        const seatElement = document.getElementById(selectedSeat);
        if (seatElement) {
            seatElement.classList.add('disabled');
        }
    }
</script>

</body>
</html>