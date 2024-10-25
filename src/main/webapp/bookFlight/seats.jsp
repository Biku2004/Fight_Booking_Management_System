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
            width: 90%;
            max-width: 800px;
        }
        .seat-row {
            display: flex;
            justify-content: center;
            gap: 10px;
            margin-bottom: 10px;
        }
        .seat {
            width: 50px;
            height: 50px;
            color: white;
            font-weight: bold;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s ease;
            position: relative;
        }
        .seat.first { background-color: #FFD700; }
        .seat.business { background-color: #4CAF50; }
        .seat.economy { background-color: #2196F3; }
        .seat.selected { background-color: #FF5722; }
        .seat.disabled { background-color: gray; cursor: not-allowed; }

        .tooltip {
            visibility: hidden;
            background-color: #333;
            color: #fff;
            text-align: center;
            border-radius: 5px;
            padding: 5px;
            position: absolute;
            top: -35px;
            width: 80px;
            font-size: 12px;
        }
        .seat:hover .tooltip {
            visibility: visible;
        }
    </style>
</head>
<body>

<div class="airplane-body">
    <h3>First Class</h3>
    <div class="seat-row">
        <div class="seat first" id="1A" onclick="selectSeat(this)">1A<span class="tooltip">First Class</span></div>
        <div class="seat first" id="1B" onclick="selectSeat(this)">1B<span class="tooltip">First Class</span></div>
        <div class="seat first" id="1C" onclick="selectSeat(this)">1C<span class="tooltip">First Class</span></div>
    </div>

    <h3>Business Class</h3>
    <div class="seat-row">
        <div class="seat business" id="2A" onclick="selectSeat(this)">2A<span class="tooltip">Business Class</span></div>
        <div class="seat business" id="2B" onclick="selectSeat(this)">2B<span class="tooltip">Business Class</span></div>
    </div>

    <h3>Economy Class</h3>
    <div class="seat-row">
        <div class="seat economy" id="3A" onclick="selectSeat(this)">3A<span class="tooltip">Economy Class</span></div>
        <div class="seat economy" id="3B" onclick="selectSeat(this)">3B<span class="tooltip">Economy Class</span></div>
        <div class="seat economy" id="3C" onclick="selectSeat(this)">3C<span class="tooltip">Economy Class</span></div>
    </div>
</div>

<input type="hidden" id="previouslySelectedSeat" value="">

<script>
    function selectSeat(seat) {
        if (seat.classList.contains('disabled')) {
            alert("This seat is already occupied.");
            return;
        }

        // Clear previously selected seat
        const previouslySelected = document.querySelector('.seat.selected');
        if (previouslySelected) previouslySelected.classList.remove('selected');

        // Select new seat
        seat.classList.add('selected');

        // Update selected seat in parent window
        window.opener.updateSelectedSeat(seat.id);
        window.close();
    }
</script>

</body>
</html>
