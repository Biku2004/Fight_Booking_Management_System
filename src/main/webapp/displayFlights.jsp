<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <script src="https://cdn.jsdelivr.net/npm/handlebars@4.7.7/dist/handlebars.min.js"></script>
    <title>Flight Search Results</title>
</head>
<body>
<h2>Flight Search Results</h2>

<div id="flight-results"></div>
<script type="text/javascript">
    var template = `
        <style type="text/css">
            .tftable {font-size:14px;color:#333333;width:100%;border-width: 1px;border-color: #87ceeb;border-collapse: collapse;}
            .tftable th {font-size:18px;background-color:#87ceeb;border-width: 1px;padding: 8px;border-style: solid;border-color: #87ceeb;text-align:left;}
            .tftable tr {background-color:#ffffff;}
            .tftable td {font-size:14px;border-width: 1px;padding: 8px;border-style: solid;border-color: #87ceeb;}
            .tftable tr:hover {background-color:#e0ffff;}
            .flight-header {background-color:#f0f8ff; font-weight:bold;}
        </style>

        {{#each response.other_flights}}
            <table class="tftable" border="1">
                <!-- Header row with departure and arrival airports -->
                <tr class="flight-header">
                    <td colspan="2">Departure: {{flights.[0].departure_airport.name}}</td>
                    <td colspan="2">Arrival: {{flights.[0].arrival_airport.name}}</td>
                </tr>

                <!-- Flight details -->
                <tr>
                    <th>Duration</th>
                    <th>Airplane</th>
                    <th>Airline</th>
                    <th>Flight Number</th>
                </tr>
                <tr>
                    <td>{{formatDuration flights.[0].duration}}</td>
                    <td>{{flights.[0].airplane}}</td>
                    <td>{{flights.[0].airline}}</td>
                    <td>{{flights.[0].flight_number}}</td>
                </tr>

                <tr>
                    <th>Travel Class</th>
                    <th>Layovers Duration</th>
                    <th>Carbon Emissions</th>
                </tr>
                <tr>
                    <td>{{flights.[0].travel_class}}</td>
                    <td>{{layovers.[0].duration}}</td>
                    <td>{{carbon_emissions.this_flight}}</td>
                </tr>
            </table>
            <br>
        {{/each}}
    `;


    // minutes to hours
    Handlebars.registerHelper('formatDuration', function(duration) {
        const totalMinutes = parseInt(duration);
        const hours = Math.floor(totalMinutes / 60);
        const minutes = totalMinutes % 60;
        return hours + "h " + minutes + "m";
    });

    // Parse the flight data JSON passed from the servlet
    var flightData = JSON.parse('<%= request.getAttribute("flightData") %>');

    function constructVisualizerPayload() {
        return { response: flightData };
    }

    // Insert the visualization into the HTML
    document.getElementById('flight-results').innerHTML = Handlebars.compile(template)(constructVisualizerPayload());
</script>
</body>
</html>

