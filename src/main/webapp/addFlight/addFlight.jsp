<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>SkyWay Flight Management</title>

</head>
<body>
<header>
    <nav>
        <a href="#">a</a>
        <a href="#">b</a>
        <a href="#">c</a>
        <a href="#">d</a>
        <a href="#">e</a>
    </nav>
</header>

<h1>Add a Flight to SkyWay</h1>

<div class="form-container">
    <form action="AddFlightServlet" method="POST" enctype="multipart/form-data">
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

































<%--Old 2 version --%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Add New Flight</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            background: linear-gradient(135deg, #33A1FF, #6DD5FA, #ffffff);--%>
<%--            background-size: 400% 400%;--%>
<%--            animation: gradientAnimation 8s ease infinite;--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            color: #333;--%>
<%--        }--%>
<%--        @keyframes gradientAnimation {--%>
<%--            0%, 100% {--%>
<%--                background-position: 0% 50%;--%>
<%--            }--%>
<%--            50% {--%>
<%--                background-position: 100% 50%;--%>
<%--            }--%>
<%--        }--%>
<%--        .container {--%>
<%--            width: 80%;--%>
<%--            max-width: 800px;--%>
<%--            margin: 50px auto;--%>
<%--            background: linear-gradient(135deg, #0095ff, #63ffe7, #ffffff);--%>
<%--            animation: gradientAnimation 8s ease infinite;--%>
<%--            border-radius: 15px;--%>
<%--            padding: 30px;--%>
<%--            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);--%>
<%--            opacity: 0; /* Start invisible */--%>
<%--            animation: fadeIn 1s forwards; /* Fade-in effect */--%>
<%--        }--%>

<%--        @keyframes fadeIn {--%>
<%--            to {--%>
<%--                opacity: 1; /* Fully visible */--%>
<%--            }--%>
<%--        }--%>

<%--        .container h1 {--%>
<%--            text-align: center;--%>
<%--            font-size: 24px;--%>
<%--            margin-bottom: 20px;--%>
<%--            color: #001f5f;--%>
<%--        }--%>

<%--        .form-group {--%>
<%--            margin-bottom: 20px;--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .form-group label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 5px;--%>
<%--            font-weight: bold;--%>
<%--            color: #001f5f;--%>
<%--        }--%>

<%--        .form-group input,--%>
<%--        .form-group select {--%>
<%--            width: 100%;--%>
<%--            padding: 12px 5px;--%>
<%--            font-size: 16px;--%>
<%--            border-radius: 10px;--%>
<%--            border: 1px solid #ddd;--%>
<%--            transition: all 0.3s ease;--%>
<%--            box-shadow: inset 0 2px 4px rgba(0, 0, 0, 0.1);--%>
<%--        }--%>

<%--        .form-group input:focus,--%>
<%--        .form-group select:focus {--%>
<%--            border-color: #001f5f;--%>
<%--            box-shadow: 0 0 8px rgba(0, 31, 95, 0.3);--%>
<%--            outline: none;--%>
<%--        }--%>

<%--        .form-group button {--%>
<%--            width: 100%;--%>
<%--            padding: 15px;--%>
<%--            border-radius: 10px;--%>
<%--            background-color: #4b9f9b;--%>
<%--            color: white;--%>
<%--            border: none;--%>
<%--            font-size: 18px;--%>
<%--            font-weight: bold;--%>
<%--            cursor: pointer;--%>
<%--            transition: background-color 0.3s ease, transform 0.3s ease;--%>
<%--        }--%>

<%--        .form-group button:hover {--%>
<%--            background-color: #346c69;--%>
<%--            transform: translateY(-2px);--%>
<%--        }--%>

<%--        .form-group button:active {--%>
<%--            transform: translateY(0);--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>Add New Flight</h1>--%>
<%--    <form action="${pageContext.request.contextPath}/AddFlightServlet" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <label for="flightNumber">Flight Number</label>--%>
<%--            <input type="text" id="flightNumber" name="flightNumber" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="airline">Airline</label>--%>
<%--            <input type="text" id="airline" name="airline" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="departureCity">Departure City</label>--%>
<%--            <input type="text" id="departureCity" name="departureCity" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="arrivalCity">Arrival City</label>--%>
<%--            <input type="text" id="arrivalCity" name="arrivalCity" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="departure_airport">Departure Airport</label>--%>
<%--            <input type="text" id="departure_airport" name="departure_airport" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="arrival_airport">Arrival Airport</label>--%>
<%--            <input type="text" id="arrival_airport" name="arrival_airport" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="departureTime">Departure Time</label>--%>
<%--            <input type="datetime-local" id="departureTime" name="departureTime" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="arrivalTime">Arrival Time</label>--%>
<%--            <input type="datetime-local" id="arrivalTime" name="arrivalTime" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="duration">Flight Duration (minutes)</label>--%>
<%--            <input type="number" id="duration" name="duration" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="airplane">Airplane Model</label>--%>
<%--            <input type="text" id="airplane" name="airplane" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="legroom">Legroom (inches)</label>--%>
<%--            <input type="text" id="legroom" name="legroom">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="extensions">Extensions</label>--%>
<%--            <input type="text" id="extensions" name="extensions">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="travel_class">Travel Class</label>--%>
<%--            <select id="travel_class" name="travel_class" required>--%>
<%--                <option value="Economy">Economy</option>--%>
<%--                <option value="Business">Business</option>--%>
<%--                <option value="First">First</option>--%>
<%--            </select>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="layovers_duration">Layovers Duration (minutes)</label>--%>
<%--            <input type="number" id="layovers_duration" name="layovers_duration">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="carbon_emissions">Carbon Emissions (kg CO2)</label>--%>
<%--            <input type="number" step="0.01" id="carbon_emissions" name="carbon_emissions">--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="price">Ticket Price</label>--%>
<%--            <input type="number" id="price" name="price" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <button type="submit">Add Flight</button>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>

<%--Old JSP PAGe--%>

<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<html>--%>
<%--<head>--%>
<%--    <title>Add New Flight</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;--%>
<%--            background-color: #eef2f7;--%>
<%--            margin: 0;--%>
<%--            padding: 0;--%>
<%--            display: flex;--%>
<%--            justify-content: center;--%>
<%--            align-items: center;--%>
<%--            height: 100vh;--%>
<%--        }--%>

<%--        .container {--%>
<%--            width: 400px;--%>
<%--            background: #ffffff;--%>
<%--            border-radius: 12px;--%>
<%--            padding: 30px;--%>
<%--            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);--%>
<%--            transition: transform 0.3s ease-in-out;--%>
<%--        }--%>

<%--        .container:hover {--%>
<%--            transform: translateY(-5px);--%>
<%--        }--%>

<%--        h1 {--%>
<%--            text-align: center;--%>
<%--            font-size: 24px;--%>
<%--            margin-bottom: 20px;--%>
<%--            color: #333333;--%>
<%--            font-weight: 600;--%>
<%--        }--%>

<%--        .form-group {--%>
<%--            margin-bottom: 20px;--%>
<%--            position: relative;--%>
<%--        }--%>

<%--        .form-group label {--%>
<%--            display: block;--%>
<%--            font-weight: 600;--%>
<%--            margin-bottom: 8px;--%>
<%--            color: #555555;--%>
<%--        }--%>

<%--        .form-group input,--%>
<%--        .form-group select {--%>
<%--            width: 100%;--%>
<%--            padding: 12px;--%>
<%--            border-radius: 8px;--%>
<%--            border: 1px solid #cccccc;--%>
<%--            box-sizing: border-box;--%>
<%--            font-size: 16px;--%>
<%--            color: #333333;--%>
<%--            background-color: #fafafa;--%>
<%--            transition: border-color 0.3s ease;--%>
<%--        }--%>

<%--        .form-group input:focus,--%>
<%--        .form-group select:focus {--%>
<%--            border-color: #007BFF;--%>
<%--            outline: none;--%>
<%--            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);--%>
<%--        }--%>

<%--        .form-group button {--%>
<%--            width: 100%;--%>
<%--            padding: 14px;--%>
<%--            border-radius: 8px;--%>
<%--            background: linear-gradient(90deg, #007BFF, #00BFFF);--%>
<%--            color: white;--%>
<%--            border: none;--%>
<%--            font-size: 18px;--%>
<%--            font-weight: 600;--%>
<%--            cursor: pointer;--%>
<%--            transition: background 0.3s ease, transform 0.3s ease;--%>
<%--        }--%>

<%--        .form-group button:hover {--%>
<%--            background: linear-gradient(90deg, #0056b3, #007BFF);--%>
<%--            transform: translateY(-3px);--%>
<%--        }--%>

<%--        .form-group button:active {--%>
<%--            transform: translateY(1px);--%>
<%--        }--%>


<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>Add New Flight</h1>--%>
<%--    <form action="AddFlightServlet" method="post">--%>
<%--        <div class="form-group">--%>
<%--            <label for="flightNumber">Flight Number</label>--%>
<%--            <input type="text" id="flightNumber" name="flightNumber" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="airline">Airline</label>--%>
<%--            <input type="text" id="airline" name="airline" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="departureCity">Departure City</label>--%>
<%--            <input type="text" id="departureCity" name="departureCity" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="arrivalCity">Arrival City</label>--%>
<%--            <input type="text" id="arrivalCity" name="arrivalCity" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="departureTime">Departure Time</label>--%>
<%--            <input type="datetime-local" id="departureTime" name="departureTime" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="arrivalTime">Arrival Time</label>--%>
<%--            <input type="datetime-local" id="arrivalTime" name="arrivalTime" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="price">Ticket Price</label>--%>
<%--            <input type="number" id="price" name="price" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <button type="submit">Add Flight</button>--%>
<%--        </div>--%>
<%--    </form>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


