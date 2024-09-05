<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking</title>
    <link rel="stylesheet" href="./cssFile/home1.css">
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
    <div class="container">
        <!-- Left Side -->
        <aside class="left-side">
            <button onclick="location.href='modifyFlight.jsp'" class="btn btn-custom">Modify Flight</button>
            <br/><br/>
            <button onclick="location.href='addFlight.jsp'" class="btn btn-custom">Add Flight</button>
            <br/><br/>
            <button onclick="location.href='deleteFlight.jsp'" class="btn btn-custom">Delete Flight</button>
        </aside>

        <!-- Right Side -->
        <div class="right-side">
            <section class="booking">
                <form id="flightSearchForm" method="post" action="flightSearchClone">
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

            <form id="flightDataForm" action="${pageContext.request.contextPath}fetchDataToTable" method="GET">
                <input type="hidden" name="from" id="fromInput">
                <input type="hidden" name="to" id="toInput">
                <button type="button" id="sendFlightDataBtn">Send Flight Data</button>
            </form>
        </div>
    </div>
</main>
<script>
    function toggleReturnDate() {
        const isRoundTrip = document.getElementById('roundtrip').checked;
        const returnField = document.getElementById('returnField');
        returnField.style.display = isRoundTrip ? 'block' : 'none';
    }

    document.addEventListener('DOMContentLoaded', function() {
        var sendFlightDataBtn = document.getElementById('sendFlightDataBtn');

        sendFlightDataBtn.addEventListener('click', function() {
            var fromValue = document.getElementById('fromAirport').value;
            var toValue = document.getElementById('to').value;

            if (fromValue && toValue) {
                // Create a form dynamically
                var form = document.createElement('form');
                form.method = 'GET';
                form.action = 'fetchDataToTable';

                var fromInput = document.createElement('input');
                fromInput.type = 'hidden';
                fromInput.name = 'from';
                fromInput.value = fromValue;

                var toInput = document.createElement('input');
                toInput.type = 'hidden';
                toInput.name = 'to';
                toInput.value = toValue;

                form.appendChild(fromInput);
                form.appendChild(toInput);

                // Append the form to the body and submit it
                document.body.appendChild(form);
                form.submit();
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
                .tftable th {font-size:18px;background-color:#87ceeb;border-width: 1px;padding: 8px;border-style: solid;border-color: #87ceeb;text-align:left;}
                .tftable tr {background-color:#ffffff;}
                .tftable td {font-size:14px;border-width: 1px;padding: 8px;border-style: solid;border-color: #87ceeb;}
                .tftable tr:hover {background-color:#e0ffff;}
            </style>

                {{#each response.other_flights}}
                    <table class="tftable" border="1">
                        <tr class="flight-header">
                            <td colspan="2">Departure: {{flights.[0].departure_airport.name}}</td>
                            <td colspan="2">Arrival: {{flights.[0].arrival_airport.name}}</td>
                        </tr>
                        <tr>
                            <th>Duration</th>
                            <th>Airplane</th>
                            <th>Airline</th>
                            <th>Flight Number</th>
                            <th>Legroom</th>
                            <th>Extensions</th>
                        </tr>
                        <tr>
                            <td>{{formatDuration flights.[0].duration}}</td>
                            <td>{{flights.[0].airplane}}</td>
                            <td>{{flights.[0].airline}}</td>
                            <td>{{flights.[0].flight_number}}</td>
                            <td>{{flights.[0].legroom}}</td>
                            <td>{{flights.[0].extensions}}</td>
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
