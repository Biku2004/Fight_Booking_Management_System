<link rel="stylesheet" type="text/css" href="../cssFile/ticket.css">
<div class="box">
    <ul class="left">
        <!-- Left dots or design elements remain unchanged -->
    </ul>

    <ul class="right">
        <!-- Right dots or design elements remain unchanged -->
    </ul>

    <div class="ticket">
        <span class="airline">British Airways</span>
        <span class="airline airlineslip">British Airways</span>
        <span class="boarding">Boarding pass</span>
        <div class="content">
            <span class="jfk">LHR</span> <!-- Updated airport code -->
            <span class="plane"><!-- Plane SVG remains unchanged --></span>
            <span class="sfo">ENG</span> <!-- Updated destination code -->

            <span class="jfk jfkslip">LHR</span> <!-- Slip copy updated -->
            <span class="plane planeslip"><!-- Plane SVG for slip remains unchanged --></span>
            <span class="sfo sfoslip">ENG</span> <!-- Slip destination updated -->

            <div class="sub-content">
                <span class="watermark">British Airways</span>
                <span class="name">PASSENGER NAME<br><span>Smith, Alex</span></span> <!-- Updated name -->
                <span class="flight">FLIGHT<br><span>BA789</span></span> <!-- Updated flight number -->
                <span class="gate">GATE<br><span>22C</span></span> <!-- Updated gate -->
                <span class="seat">SEAT<br><span>12B</span></span> <!-- Updated seat -->
                <span class="boardingtime">BOARDING TIME<br><span>10:45AM ON SEPTEMBER 15, 2024</span></span> <!-- Updated time -->

                <span class="flight flightslip">FLIGHT N<br><span>BA789</span></span> <!-- Slip flight number -->
                <span class="seat seatslip">SEAT<br><span>12B</span></span> <!-- Slip seat -->
                <span class="name nameslip">PASSENGER NAME<br><span>Smith, Alex</span></span> <!-- Slip name -->
            </div>
        </div>
        <div class="barcode"></div>
        <div class="barcode slip"></div>
    </div>
</div>
<div class="button-container">
    <button onclick="window.print()">Print Ticket</button>
    <button onclick="location.href='sendEmailServlet'">Send to Email</button>
    <button onclick="location.href='home.jsp'">Go to Home</button>
</div>