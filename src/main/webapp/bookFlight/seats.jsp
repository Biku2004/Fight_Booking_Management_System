<%@ page import="com.google.gson.Gson" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airplane Seat Selection</title>
    <style>
        h3 {
            text-align: center;
            cursor: pointer;
            font-size: 24px;
            color: #0084ff;
            transition: color 0.3s ease, transform 0.2s ease;
        }
        h3:hover {
            color: #0056b3;
            transform: scale(1.05);
        }
        h3:active {
            transform: scale(0.95);
        }
        .seat-row {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        .division {
            display: flex;
            flex-direction: row;
            justify-content: flex-start;
            width: 45%;
        }
        .seat {
            background-color: #8c00ff;
            cursor: pointer;
            padding: 10px;
            border: 2px solid #0084ff;
            border-radius: 5px;
            text-align: center;
            width: 70px;
            margin: 0 10px 10px 0;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .seat:hover {
            background-color: #d9edf7;
            transform: scale(1.05);
        }
        .seat.selected {
            background-color: #4CAF50;
            color: white;
            border-color: #388e3c;
        }
        .seat.disabled {
            background-color: #f44336; /* Booked seat color */
            color: white;
            cursor: not-allowed;
        }
    </style>
</head>
<body>

<div class="airplane-body">
    <div class="airplane-head"></div>
    <div class="airplane-wing"></div>
    <div class="airplane-tail"></div>

    <h3>First Class</h3>
    <div class="seat-row">
        <div class="division">
            <div class="seat first" id="1AFW" onclick="selectSeat(this)">1AFW</div>
            <div class="seat first" id="2BFM" onclick="selectSeat(this)">2BFM</div>
            <div class="seat first" id="3CFA" onclick="selectSeat(this)">3CFA</div>
        </div>
        <div class="division">
            <div class="seat first" id="4DFA" onclick="selectSeat(this)">4DFA</div>
            <div class="seat first" id="5EFM" onclick="selectSeat(this)">5EFM</div>
            <div class="seat first" id="6FFW" onclick="selectSeat(this)">6FFW</div>
        </div>
    </div>
    <div class="seat-row">
        <div class="division">
            <div class="seat first" id="7GF" onclick="selectSeat(this)">7GF</div>
            <div class="seat first" id="8HF" onclick="selectSeat(this)">8HF</div>
            <div class="seat first" id="9IF" onclick="selectSeat(this)">9IF</div>
        </div>
        <div class="division">
            <div class="seat first" id="10JF" onclick="selectSeat(this)">10JF</div>
            <div class="seat first" id="11KF" onclick="selectSeat(this)">11KF</div>
            <div class="seat first" id="12LF" onclick="selectSeat(this)">12LF</div>
        </div>
    </div>

    <h3>Business Class</h3>
    <div class="seat-row">
        <div class="division">
            <div class="seat business" id="1AB" onclick="selectSeat(this)">1AB</div>
            <div class="seat business" id="2BB" onclick="selectSeat(this)">2BB</div>
            <div class="seat business" id="3DB" onclick="selectSeat(this)">3DB</div>
        </div>
        <div class="division">
            <div class="seat business" id="4EB" onclick="selectSeat(this)">4EB</div>
            <div class="seat business" id="5FB" onclick="selectSeat(this)">5FB</div>
            <div class="seat business" id="6GB" onclick="selectSeat(this)">6GB</div>
        </div>
    </div>
    <div class="seat-row">
        <div class="division">
            <div class="seat business" id="7HB" onclick="selectSeat(this)">7HB</div>
            <div class="seat business" id="8IB" onclick="selectSeat(this)">8IB</div>
            <div class="seat business" id="9JB" onclick="selectSeat(this)">9JB</div>
        </div>
        <div class="division">
            <div class="seat business" id="10KB" onclick="selectSeat(this)">10KB</div>
            <div class="seat business" id="11LB" onclick="selectSeat(this)">11LB</div>
            <div class="seat business" id="12MB" onclick="selectSeat(this)">12MB</div>
        </div>
    </div>

    <h3>Economy Class</h3>
    <div class="seat-row">
        <div class="division">
            <div class="seat economy" id="1AE" onclick="selectSeat(this)">1AE</div>
            <div class="seat economy" id="2CE" onclick="selectSeat(this)">2CE</div>
            <div class="seat economy" id="3BE" onclick="selectSeat(this)">3BE</div>
        </div>
        <div class="division">
            <div class="seat economy" id="4DE" onclick="selectSeat(this)">4DE</div>
            <div class="seat economy" id="5EE" onclick="selectSeat(this)">5EE</div>
            <div class="seat economy" id="6FE" onclick="selectSeat(this)">6FE</div>
        </div>
    </div>
    <div class="seat-row">
        <div class="division">
            <div class="seat economy" id="7GE" onclick="selectSeat(this)">7GE</div>
            <div class="seat economy" id="8HE" onclick="selectSeat(this)">8HE</div>
            <div class="seat economy" id="9IE" onclick="selectSeat(this)">9IE</div>
        </div>
        <div class="division">
            <div class="seat economy" id="10JE" onclick="selectSeat(this)">10JE</div>
            <div class="seat economy" id="11KE" onclick="selectSeat(this)">11KE</div>
            <div class="seat economy" id="12LE" onclick="selectSeat(this)">12LE</div>
        </div>
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
