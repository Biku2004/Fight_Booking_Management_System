<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking</title>
    <link rel="stylesheet" href="home.css">
    <script src="https://cdn.jsdelivr.net/npm/handlebars@4.7.7/dist/handlebars.min.js"></script>

    <style>
        /* Profile dropdown styling */
        .profile-dropdown {
            position: relative;
            display: inline-block;
            float: right;
            margin-right: 20px;
        }

        .profile-photo {
            width: 40px;
            height: 40px;
            border-radius: 50%;
            cursor: pointer;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #f1f1f1;
            min-width: 160px;
            box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
            z-index: 1;
        }

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
    </style>
</head>
<body>

<header></header>
<main>
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
                    <input type="text" id="fromAirport" name="from" placeholder="Airport" contenteditable="true">
                </div>

                <div class="form-group">
                    <label for="to">To</label>
                    <input type="text" id="to" name="to" placeholder="Search by place/airport">
                </div>
                <div class="form-group">
                    <label for="departure">Departure</label>
                    <input type="date" id="departure" name="departure" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD">
                </div>
                <div class="form-group" id="returnField">
                    <label for="return">Return</label>
                    <input type="date" id="return" name="return" pattern="\d{4}-\d{2}-\d{2}" placeholder="YYYY-MM-DD">
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

    <!-- Section to display flight search results -->
    <section class="flight-results">
        <h2>Flight Search Results</h2>
        <div id="flight-results">
            <%
                // Database connection settings
                String url = "jdbc:mysql://localhost:3306/flightregd";
                String user = "Java-Project";
                String password = "root@localhost";

                // Retrieving data from database
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection(url, user, password);

                    // SQL query to fetch flight data
                    String query = "SELECT * FROM flights WHERE departure_airport = ? AND arrival_airport = ? ORDER BY departure_time ASC";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setString(1, request.getParameter("from"));
                    pstmt.setString(2, request.getParameter("to"));
                    ResultSet rs = pstmt.executeQuery();

                    // Loop through the results and generate the HTML table
                    while (rs.next()) {
                        String flightNumber = rs.getString("flight_number");
                        String airline = rs.getString("airline");
                        String departureAirport = rs.getString("departure_airport");
                        String arrivalAirport = rs.getString("arrival_airport");
                        int duration = rs.getInt("duration");
                        String airplane = rs.getString("airplane");
                        String legroom = rs.getString("legroom");
                        String extensions = rs.getString("extensions");
                        String travelClass = rs.getString("travel_class");
                        int layoversDuration = rs.getInt("layovers_duration");
                        float carbonEmissions = rs.getFloat("carbon_emissions");
            %>
            <table class="tftable" border="1">

                <style type="text/css">

                </style>
                <tr class="flight-header">
                    <td colspan="2">Departure: <%= departureAirport %></td>
                    <td colspan="2">Arrival: <%= arrivalAirport %></td>
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
                    <td><%= duration / 60 %>h <%= duration % 60 %>m</td>
                    <td><%= airplane %></td>
                    <td><%= airline %></td>
                    <td><%= flightNumber %></td>
                    <td><%= legroom %></td>
                    <td><%= extensions %></td>
                </tr>
                <tr>
                    <th>Travel Class</th>
                    <th>Layovers Duration</th>
                    <th>Carbon Emissions</th>
                </tr>
                <tr>
                    <td><%= travelClass %></td>
                    <td><%= layoversDuration %> mins</td>
                    <td><%= carbonEmissions %> kg CO2</td>
                </tr>
            </table>
            <br>
            <%
                    }
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
            %>
        </div>
    </section>
</main>

<script>
    function toggleReturnDate() {
        const isRoundTrip = document.getElementById('roundtrip').checked;
        const returnField = document.getElementById('returnField');
        if (isRoundTrip) {
            returnField.style.display = 'block';
        } else {
            returnField.style.display = 'none';
        }
    }

    // Initialize visibility based on default checked value
    document.addEventListener('DOMContentLoaded', () => {
        toggleReturnDate();

        var flightData = '<%= request.getAttribute("flightData") %>';
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

            // Compile and render the template with the flight data
            document.getElementById('flight-results').innerHTML = Handlebars.compile(template)({ response: flightData });
        }
    });
</script>

</body>
</html>