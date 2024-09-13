<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking</title>
    <link rel="stylesheet" href="../cssFile/home1.css">
    <script src="https://cdn.jsdelivr.net/npm/handlebars@4.7.7/dist/handlebars.min.js"></script>
    <style>
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }

        .dropdown-content a:hover {
            background-color: #ddd;
        }

        .profile-dropdown:hover .dropdown-content {
            display: block;
        }

        /* Hide return date by default */
        #returnField {
            display: none;
        }

        /* Container for left and right sections */
        .container {
            display: flex;
            height: 100vh;
        }

        /* Left side (constant part) */
        .left-side {
            width: 200px;
            background-color: #f0f7ff;
            padding: 20px;
            box-shadow: 2px 0 5px rgba(0, 0, 0, 0.1);
            transition: width 0.3s ease;
        }
        .left-side.collapsed {
            width: 50px; /* Or any width for collapsed state */
        }

        .left-side button {
            display: block;
            width: 100%;
            text-align: left;
        }

        .left-side.collapsed button {
            display: none; /* Hide buttons in collapsed state */
        }

        /* Right side (scrollable part) */
        .right-side {
            flex: 1;
            padding: 20px;
            overflow-x: auto;
        }

        .search-btn {
            display: block;
            margin: 20px auto;
        }
    </style>
</head>
<body>

<header></header>
<main>
    <div  class="container">
        <!-- Left Side -->
        <aside id="leftSide" class="left-side">
            <button onclick="toggleAside()" class="btn btn-custom">Collapse</button>
            <br/><br/>
            <button onclick="location.href='modifyFlight/modifyFlight.jsp'" class="btn btn-custom">Modify Flight</button>
            <br/><br/>
            <button onclick="location.href='addFlight/addFlight.jsp'" class="btn btn-custom">Add Flight</button>
            <br/><br/>
            <button onclick="location.href='deleteFlight/deleteFlight.jsp'" class="btn btn-custom">Delete Flight</button>
        </aside>

        <!-- Right Side -->
        <div class="right-side">
            <section class="booking">
                <form id="flightSearchForm" method="post" action="${pageContext.request.contextPath}/flightSearchClone">
                    <div class="trip-type">
                        <input type="radio" id="oneway" name="trip" value="oneway" checked onclick="toggleReturnDate()">
                        <label for="oneway">One Way</label>
                        <input type="radio" id="roundtrip" name="trip" value="roundtrip" onclick="toggleReturnDate()">
                        <label for="roundtrip">Round Trip</label>
                    </div>

                    <div class="booking-form">
                        <div class="form-group dropdown">
                            <label for="fromAirport">From</label>
                            <input type="text" id="fromAirport" name="from" placeholder="Airport"
                                   value="${sessionScope.lastSearchFrom}">
                        </div>

                        <div class="form-group">
                            <label for="to">To</label>
                            <input type="text" id="to" name="to" placeholder="Search by place/airport" value="${sessionScope.lastSearchTo}">
                        </div>
                        <div class="form-group">
                            <label for="departure">Departure</label>
                            <input type="date" id="departure" name="departure" pattern="\d{4}-\d{2}-\d{2}"
                                   placeholder="YYYY-MM-DD">
                        </div>
                        <div class="form-group" id="returnField">
                            <label for="return">Return</label>
                            <input type="date" id="return" name="return" pattern="\d{4}-\d{2}-\d{2}"
                                   placeholder="YYYY-MM-DD">
                        </div>
                        <div class="form-group">
                            <label for="passengers">Passengers</label>
                            <input type="number" id="passengers" name="passengers" value="1">
                        </div>

                        <div class="search">
                            <button type="submit" class="search-btn">Search</button>
                        </div>


                    </div>
                </form>
            </section>

<%--            <button id="sendFlightDataBtn">Send Flight Data</button>--%>

            <!-- Section to display flight search results -->
            <section class="flight-results">
                <h2>Flight Search Results</h2>

                <div id="flight-results"></div>

            </section>

            <form id="flightDataForm" action="${pageContext.request.contextPath}/fetchDataToTable" method="GET">
                <input type="hidden" name="from" id="fromInput">
                <input type="hidden" name="to" id="toInput">
                <button type="button" id="sendFlightDataBtn">Send Flight Data</button>
            </form>
        </div>
    </div>
</main>
<script>

    function toggleAside() {
        const aside = document.getElementById("leftSide");
        aside.classList.toggle("collapsed");

        // Change the button text to "Expand" when collapsed
        const toggleButton = aside.querySelector("button");
        if (aside.classList.contains("collapsed")) {
            toggleButton.textContent = "Expand";
        } else {
            toggleButton.textContent = "Collapse";
        }
    }
    function toggleReturnDate() {
        const isRoundTrip = document.getElementById('roundtrip').checked;
        const returnField = document.getElementById('returnField');
        returnField.style.display = isRoundTrip ? 'block' : 'none';
    }


    document.addEventListener('DOMContentLoaded', function() {
        var sendFlightDataBtn = document.getElementById('sendFlightDataBtn');
        var flightDataForm = document.getElementById('flightDataForm');

        sendFlightDataBtn.addEventListener('click', function() {
            var fromValue = document.getElementById('fromAirport').value;
            var toValue = document.getElementById('to').value;

            if (fromValue && toValue) {
                document.getElementById('fromInput').value = fromValue;
                document.getElementById('toInput').value = toValue;
                flightDataForm.submit();
            } else {
                alert('Please enter both "From" and "To" airports before sending flight data.');
            }
        });

    });

    document.addEventListener('DOMContentLoaded', () => {
        toggleReturnDate();



        var flightData = '<%=request.getAttribute("flightData")%>';
        if (flightData) {
            flightData = JSON.parse(flightData);


            var template = `
                <style type="text/css">
                    .tftable {font-size:14px;color:#333333;width:100%;border-width: 1px;border-color: #87ceeb;border-collapse: collapse;}
                    .tftable th {font-size:18px;background-color:#87ceeb;border-width: 1px;padding: 12px;border-style: solid;border-color: #87ceeb;text-align:left;}
                    .tftable tr {background-color:#ffffff;}
                    .tftable td {font-size:14px;border-width: 1px;padding: 8px;border-style: solid;border-color: #87ceeb;}
                    .tftable tr:hover {background-color:#e0ffff;}
                </style>


                <!-- Airport Details -->
                <h3>Airports</h3>
                {{#each response.airports}}
                    {{#each departure}}
                    <h4>Departure Airport</h4>
                    <p><strong>{{airport.name}}</strong> - {{city}}, {{country}} ({{country_code}})</p>
                    <img src="{{thumbnail}}" alt="{{airport.name}} thumbnail" style="width:100px;">
                    {{/each}}
                    {{#each arrival}}
                    <h4>Arrival Airport</h4>
                    <p><strong>{{airport.name}}</strong> - {{city}}, {{country}} ({{country_code}})</p>
                    <img src="{{thumbnail}}" alt="{{airport.name}} thumbnail" style="width:100px;">
                    {{/each}}
                {{/each}}


                <table class="tftable" border="1">
                    <tr>
                        <th>Departure Airport</th> //1
                        <th>Arrival Airport</th> //2

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
                        <th>Legroom</th> //13

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


            Handlebars.registerHelper('formatDuration', function(duration) {
                const totalMinutes = parseInt(duration);
                const hours = Math.floor(totalMinutes / 60);
                const minutes = totalMinutes % 60;
                return hours + "h " + minutes + "m";
            });



            document.getElementById('flight-results').innerHTML = Handlebars.compile(template)({ response: flightData });
        }
    });



</script>

</body>
</html>
