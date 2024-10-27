<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airplane Seat Selection</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssFile/seats.css"> <!-- Link to the external CSS file -->
</head>
<body>

<div class="airplane-body">
    <div class="airplane-head"></div>
    <div class="airplane-wing"></div>
    <div class="airplane-tail"></div>

    <h3>First Class</h3>
    <div class="seat-row">
        <div class="seat first" id="1AF" onclick="selectSeat(this)">1AF<span class="tooltip"></span></div>
        <div class="seat first" id="2BF" onclick="selectSeat(this)">2BF<span class="tooltip"></span></div>
        <div class="seat first" id="3CF" onclick="selectSeat(this)">3CF<span class="tooltip"></span></div>
        <div class="seat first" id="4DF" onclick="selectSeat(this)">4DF<span class="tooltip"></span></div>
        <div class="seat first" id="5EF" onclick="selectSeat(this)">5EF<span class="tooltip"></span></div>
        <div class="seat first" id="6FF" onclick="selectSeat(this)">6FF<span class="tooltip"></span></div>
    </div>

    <h3>Business Class</h3>
    <div class="seat-row">
        <div class="seat business" id="1AB" onclick="selectSeat(this)">1AB<span class="tooltip"></span></div>
        <div class="seat business" id="2BB" onclick="selectSeat(this)">2BB<span class="tooltip"></span></div>
        <div class="seat business" id="3DB" onclick="selectSeat(this)">3DB<span class="tooltip"></span></div>
        <div class="seat business" id="4EB" onclick="selectSeat(this)">4EB<span class="tooltip"></span></div>
        <div class="seat business" id="5FB" onclick="selectSeat(this)">5FB<span class="tooltip"></span></div>
    </div>

    <h3>Economy Class</h3>
    <div class="seat-row">
        <div class="seat economy" id="1AE" onclick="selectSeat(this)">1AE<span class="tooltip"></span></div>
        <div class="seat economy" id="2CE" onclick="selectSeat(this)">2CE<span class="tooltip"></span></div>
        <div class="seat economy" id="3BE" onclick="selectSeat(this)">3BE<span class="tooltip"></span></div>
        <div class="seat economy" id="4DE" onclick="selectSeat(this)">4DE<span class="tooltip"></span></div>
        <div class="seat economy" id="5EE" onclick="selectSeat(this)">5EE<span class="tooltip"></span></div>
        <div class="seat economy" id="6FE" onclick="selectSeat(this)">6FE<span class="tooltip"></span></div>
        <div class="seat economy" id="7GE" onclick="selectSeat(this)">7GE<span class="tooltip"></span></div>
        <div class="seat economy" id="8HE" onclick="selectSeat(this)">8HE<span class="tooltip"></span></div>
        <div class="seat economy" id="9IE" onclick="selectSeat(this)">9IE<span class="tooltip"></span></div>
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
