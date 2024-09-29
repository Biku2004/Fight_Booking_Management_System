<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">
<head>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking</title>
    <link rel="stylesheet" href="../cssFile/home.css">
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
<header class="header">
    <nav class="navbar">
        <div class="nav-links">
            <a href="#">a</a>
            <a href="#">b</a>
            <a href="#">c</a>
            <a href="#">d</a>
            <a href="#">e</a>
        </div>

        <!-- Profile section -->
        <div class="profile-dropdown">
            <%
                byte[] profilePhoto = (byte[]) session.getAttribute("profile_photo");
                if (profilePhoto != null) {
                    String base64Image = Base64.getEncoder().encodeToString(profilePhoto);
                    out.print("<img src='data:image/png;base64," + base64Image + "' alt='Profile Photo' class='profile-photo'>");
                } else {
                    out.print("<img src='default-profile.png' alt='Profile Photo' class='profile-photo'>");
                }
            %>
            <div class="dropdown-content">
                <a href="../editProfile.jsp">Edit Profile</a>
            </div>
        </div>

        <!-- Logout Button -->
        <div class="logout">
            <button class="login-btn"><a href="login.jsp">Logout</a></button>
        </div>
    </nav>
</header>

<main>
    <section class="booking">
        <h1>Hi there, where would you like to <span class="skyway">SkyWay</span> today?</h1>

        <div class="booking-options">
            <div class="flight-hotel">
                <button class="flight-btn active">✈️ Book a flight</button>
            </div>


            <form id="flightSearchForm" method="post" action="${pageContext.request.contextPath}/flightSearch">
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
                        <input type="text" id="to" name="to" placeholder="Search by place/airport" value="Kolkata, CCU">
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

        </div>
    </section>

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
    });



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
</script>

</body>
</html>
