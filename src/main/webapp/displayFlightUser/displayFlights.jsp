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


        <table class="tftable" border="1">
            <tr>
                <th>Departure Airport</th>
                <th>Arrival Airport</th>

                <th>Departure Airport ID</th>
                <th>Arrival Airport ID</th>

                <th>Departure time</th>
                <th>Arrival time</th>

                <th>Duration</th>
                <th>Airplane</th>
                <th>Airline</th>
                <th>Airline Logo</th>
                <th>Travel Class</th>
                <th>Flight Number</th>
                <th>Legroom</th>

                <th>extensions</th>

                <th>Layovers</th>

                <th>total_duration</th>
                <th>Carbon Emissions (this flight)</th>
                <th>Typical Carbon Emissions for Route</th>
                <th>Carbon Emission Difference (%)</th>
                <th>price</th>
            </tr>

            {{#each response.best_flights}}
                {{#each flights}}
                    <tr>
                        <td>{{departure_airport.name}}</td>
                        <td>{{arrival_airport.name}}</td>
                        <td>{{departure_airport.id}}</td>
                        <td>{{arrival_airport.id}}</td>
                        <td>{{departure_airport.time}}</td>
                        <td>{{arrival_airport.time}}</td>

                        <td>{{duration}}</td>
                        <td>{{airplane}}</td>
                        <td>{{airline}}</td>
                        <td><img src="{{airline_logo}}" alt="Airline Logo" style="width:50px;"></td>
                        <td>{{travel_class}}</td>
                        <td>{{flight_number}}</td>
                        <td>{{legroom}}</td>

                        <td>{{extensions}}</td>

                        <td>
                            {{#each ../layovers}}
                                {{this.name}} - {{this.duration}} min {{#if overnight}} (Overnight) {{/if}} <br>
                            {{/each}}
                        </td>
                        <td>{{../total_duration}}</td>
                        <td>{{../carbon_emissions.this_flight}} g</td>
                        <td>{{../carbon_emissions.typical_for_this_route}} g</td>
                        <td>{{../carbon_emissions.difference_percent}}%</td>
                        <td>{{../price}}</td>
                    </tr>
                {{/each}}
            {{/each}}

            {{#each response.other_flights}}
                {{#each flights}}
                    <tr>
                        <td>{{departure_airport.name}}</td>
                        <td>{{arrival_airport.name}}</td>
                        <td>{{departure_airport.id}}</td>
                        <td>{{arrival_airport.id}}</td>
                        <td>{{departure_airport.time}}</td>
                        <td>{{arrival_airport.time}}</td>

                        <td>{{duration}}</td>
                        <td>{{airplane}}</td>
                        <td>{{airline}}</td>
                        <td><img src="{{airline_logo}}" alt="Airline Logo" style="width:50px;"></td>
                        <td>{{travel_class}}</td>
                        <td>{{flight_number}}</td>
                        <td>{{legroom}}</td>

                        <td>{{extensions}}</td>

                        <td>
                            {{#each ../layovers}}
                                {{this.name}} - {{this.duration}} min {{#if overnight}} (Overnight) {{/if}} <br>
                            {{/each}}
                        </td>
                        <td>{{../total_duration}}</td>
                        <td>{{../carbon_emissions.this_flight}} g</td>
                        <td>{{../carbon_emissions.typical_for_this_route}} g</td>
                        <td>{{../carbon_emissions.difference_percent}}%</td>
                        <td>{{../price}}</td>
                    </tr>
                {{/each}}
            {{/each}}
        </table>
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

