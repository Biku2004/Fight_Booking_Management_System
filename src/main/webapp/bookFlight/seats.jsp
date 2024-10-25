<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Airplane Seat Selection</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/cssFile/seats.css"> <!-- Link to the external CSS file -->
</head></head>
<body>

<div class="airplane-body">
    <div class="airplane-head"></div>
    <div class="airplane-wing"></div>
    <div class="airplane-tail"></div>

    <h3>First Class</h3>
    <div class="seat-row">
        <div class="seat first" id="1A" onclick="selectSeat(this)">1A<span class="tooltip">First Class</span></div>
        <div class="seat first" id="1B" onclick="selectSeat(this)">1B<span class="tooltip">First Class</span></div>
        <div class="seat first" id="1C" onclick="selectSeat(this)">1C<span class="tooltip">First Class</span></div>
        <div class="seat first" id="1D" onclick="selectSeat(this)">1D<span class="tooltip">First Class</span></div>
        <div class="seat first" id="1E" onclick="selectSeat(this)">1E<span class="tooltip">First Class</span></div>
        <div class="seat first" id="1F" onclick="selectSeat(this)">1F<span class="tooltip">First Class</span></div>
    </div>

    <h3>Business Class</h3>
    <div class="seat-row">
        <div class="seat business" id="2A" onclick="selectSeat(this)">2A<span class="tooltip">Business Class</span></div>
        <div class="seat business" id="2B" onclick="selectSeat(this)">2B<span class="tooltip">Business Class</span></div>
        <div class="seat business" id="2C" onclick="selectSeat(this)">2C<span class="tooltip">Business Class</span></div>
        <div class="seat business" id="2D" onclick="selectSeat(this)">2D<span class="tooltip">Business Class</span></div>
        <div class="seat business" id="2E" onclick="selectSeat(this)">2E<span class="tooltip">Business Class</span></div>
    </div>

    <h3>Economy Class</h3>
    <div class="seat-row">
        <div class="seat economy" id="3A" onclick="selectSeat(this)">3A<span class="tooltip">Economy Class</span></div>
        <div class="seat economy" id="3B" onclick="selectSeat(this)">3B<span class="tooltip">Economy Class</span></div>
        <div class="seat economy" id="3C" onclick="selectSeat(this)">3C<span class="tooltip">Economy Class</span></div>
        <div class="seat economy" id="3D" onclick="selectSeat(this)">3D<span class="tooltip">Economy Class</span></div>
        <div class="seat economy" id="3E" onclick="selectSeat(this)">3E<span class="tooltip">Economy Class</span></div>
        <div class="seat economy" id="3F" onclick="selectSeat(this)">3F<span class="tooltip">Economy Class</span></div>
        <div class="seat economy" id="3G" onclick="selectSeat(this)">3G<span class="tooltip">Economy Class</span></div>
        <div class="seat economy" id="3H" onclick="selectSeat(this)">3H<span class="tooltip">Economy Class</span></div>
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
