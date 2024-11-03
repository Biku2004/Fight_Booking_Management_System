<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkyWay Flight Management</title>
    <link rel="stylesheet" href="../cssFile/addFlightStyle.css">

</head>
<body>
<header>
    <nav>
        <a href="../Admin/HomeAdmin.jsp">SkyWay</a>
        <a href="../ViewPassenger/searchBooking.jsp">Passenger</a>
        <a href="../bookFlight/tickets.jsp">Ticket</a>
        <a href="../Admin/adminregd.jsp">Admin</a>
        <a href="../Admin/adminDelete.jsp">Delete Admin</a>
    </nav>
</header>

<h1>Add a Flight to SkyWay</h1>

<div class="form-container">
    <form action="${pageContext.request.contextPath}/AddFlightServlet" method="post">
        <div class="form-row">
            <div>
                <label for="departure_name">Departure Name</label>
                <input type="text" id="departure_name" name="departure_name" placeholder="Enter Departure Location" required>
            </div>
            <div>
                <label for="departure_id">Departure ID</label>
                <input type="text" id="departure_id" name="departure_id" placeholder="e.g. DEL" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label for="arrival_name">Arrival Name</label>
                <input type="text" id="arrival_name" name="arrival_name" placeholder="Enter Arrival Location" required>
            </div>
            <div>
                <label for="arrival_id">Arrival ID</label>
                <input type="text" id="arrival_id" name="arrival_id" placeholder="e.g. CCU" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label for="departure_time">Departure Time</label>
                <input type="datetime-local" id="departure_time" name="departure_time" required>
            </div>
            <div>
                <label for="arrival_time">Arrival Time</label>
                <input type="datetime-local" id="arrival_time" name="arrival_time" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label for="duration">Flight Duration (minutes)</label>
                <input type="number" id="duration" name="duration" min="1" required>
            </div>
            <div>
                <label for="total_duration">Total Duration (minutes)</label>
                <input type="number" id="total_duration" name="total_duration" min="1" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label for="airplane">Airplane Model</label>
                <input type="text" id="airplane" name="airplane" placeholder="Enter Airplane Model" required>
            </div>
            <div>
                <label for="airline">Airline Name</label>
                <input type="text" id="airline" name="airline" placeholder="Enter Airline Name" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label for="airline_logo">Airline Logo</label>
                <input type="file" id="airline_logo" name="airline_logo" accept="image/*">
            </div>
            <div>
                <label for="travel_class">Travel Class</label>
                <input type="text" id="travel_class" name="travel_class" placeholder="e.g. Economy, Business" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label for="flight_number">Flight Number</label>
                <input type="text" id="flight_number" name="flight_number" placeholder="e.g. AI-123" required>
            </div>
            <div>
                <label for="legroom">Legroom</label>
                <input type="text" id="legroom" name="legroom" placeholder="Enter Legroom details">
            </div>
        </div>

        <div class="form-row">
            <div>
                <label for="carbon_emissions">Carbon Emissions (kg)</label>
                <input type="number" id="carbon_emissions" name="carbon_emissions" step="0.01" min="0" required>
            </div>
            <div>
                <label for="price">Price (INR)</label>
                <input type="number" id="price" name="price" min="0" required>
            </div>
        </div>

        <div class="form-row">
            <div>
                <label for="type">Flight Type</label>
                <input type="text" id="type" name="type" placeholder="e.g. Direct, Layover" required>
            </div>
            <div>
                <label for="extensions">Extensions</label>
                <textarea id="extensions" name="extensions" placeholder="Enter any extra details"></textarea>
            </div>
        </div>

        <div>
            <label for="booking_token">Booking Token</label>
            <input type="text" id="booking_token" name="booking_token" placeholder="Enter Booking Token">
        </div>

        <div>
            <label for="layovers">Layovers (JSON Format)</label>
            <textarea id="layovers" name="layovers" placeholder='Enter layovers in JSON format, e.g. [{"location": "XYZ", "duration": 60}]'></textarea>
        </div>

        <input type="submit" value="Add Flight">
    </form>
</div>
</body>
</html>



