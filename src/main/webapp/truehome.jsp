<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking</title>
    <link rel="stylesheet" href="home.css">
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
    </style>
    <script>
        function fetchFlights() {
            const from = document.getElementById('from').value;
            const to = document.getElementById('to').value;
            const departure = document.getElementById('departure').value;
            const returnDate = document.getElementById('return').value;

            const form = document.getElementById('flightSearchForm');
            form.action = 'flightSearch'; // URL of the servlet handling the request
            form.method = 'POST';

            // Create hidden fields to store the parameters
            form.appendChild(createHiddenInput('from', from));
            form.appendChild(createHiddenInput('to', to));
            form.appendChild(createHiddenInput('departure', departure));
            form.appendChild(createHiddenInput('return', returnDate));

            form.submit();
        }

        function createHiddenInput(name, value) {
            const input = document.createElement('input');
            input.type = 'hidden';
            input.name = name;
            input.value = value;
            return input;
        }
    </script>
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
                <a href="editProfile.jsp">Edit Profile</a>
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

            <form id="flightSearchForm">
                <div class="trip-type">
                    <input type="radio" id="oneway" name="trip" checked>
                    <label for="oneway">One Way</label>
                    <input type="radio" id="roundtrip" name="trip">
                    <label for="roundtrip">Round Trip</label>
                </div>

                <div class="booking-form">
                    <div class="form-group">
                        <label for="from">From</label>
                        <input type="text" id="from" name="from" placeholder="Search by place/airport" value="Delhi, DEL">
                    </div>
                    <div class="form-group">
                        <label for="to">To</label>
                        <input type="text" id="to" name="to" placeholder="Search by place/airport" value="Kolkata, CCU">
                    </div>
                    <div class="form-group">
                        <label for="departure">Departure</label>
                        <input type="date" id="departure" name="departure" value="">
                    </div>
                    <div class="form-group">
                        <label for="return">Return</label>
                        <input type="date" id="return" name="return" value="">
                    </div>
                    <div class="form-group">
                        <label for="passengers">Passengers</label>
                        <input type="number" id="passengers" name="passengers" value="1">
                    </div>

                    <div class="search">
                        <button type="button" class="search-btn" onclick="fetchFlights()">Search</button>
                    </div>
                </div>
            </form>
        </div>
    </section>
</main>

</body>
</html>
