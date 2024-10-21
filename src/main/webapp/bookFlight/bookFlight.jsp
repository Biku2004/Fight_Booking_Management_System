<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Book Flight</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            background-color: #f9f9f9;--%>
<%--            margin: 0;--%>
<%--            padding: 20px;--%>
<%--        }--%>
<%--        h2 {--%>
<%--            text-align: center;--%>
<%--            color: #333;--%>
<%--        }--%>
<%--        .booking-container {--%>
<%--            background-color: #fff;--%>
<%--            padding: 20px;--%>
<%--            border-radius: 10px;--%>
<%--            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);--%>
<%--            max-width: 600px;--%>
<%--            margin: 20px auto;--%>
<%--        }--%>
<%--        .flight-info {--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>
<%--        .flight-info p {--%>
<%--            margin: 5px 0;--%>
<%--            color: #555;--%>
<%--        }--%>
<%--        .form-group {--%>
<%--            margin-bottom: 15px;--%>
<%--        }--%>
<%--        .form-group label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 5px;--%>
<%--        }--%>
<%--        .form-group input {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 5px;--%>
<%--        }--%>
<%--        .book-now {--%>
<%--            background-color: #007bff;--%>
<%--            color: #fff;--%>
<%--            padding: 10px 20px;--%>
<%--            border: none;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--            width: 100%;--%>
<%--            font-size: 16px;--%>
<%--        }--%>
<%--        .book-now:hover {--%>
<%--            background-color: #0056b3;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<h2>Flight Booking</h2>--%>

<%--<div class="booking-container">--%>
<%--    <div class="flight-info">--%>
<%--        <h3>Flight Information</h3>--%>
<%--        <p><strong>Airline:</strong> <%= request.getParameter("airline") %></p>--%>
<%--        <p><strong>Flight Number:</strong> <%= request.getParameter("flightNumber") %></p>--%>
<%--        <p><strong>Departure:</strong> <%= request.getParameter("departure") %></p>--%>
<%--        <p><strong>Arrival:</strong> <%= request.getParameter("arrival") %></p>--%>
<%--    </div>--%>

<%--    <form action="${pageContext.request.contextPath}/ConfirmBookingServlet" method="POST">--%>
<%--        <label for="fullName">Full Name:</label>--%>
<%--        <input type="text" id="fullName" name="fullName" required><br><br>--%>

<%--        <label for="email">Email:</label>--%>
<%--        <input type="email" id="email" name="email" required><br><br>--%>

<%--        <label for="phone">Phone:</label>--%>
<%--        <input type="tel" id="phone" name="phone" required><br><br>--%>

<%--        <input type="hidden" name="flightNumber" value="<%= request.getParameter("flightNumber") %>">--%>
<%--        <input type="hidden" name="airline" value="<%= request.getParameter("airline") %>">--%>
<%--        <input type="hidden" name="departure" value="<%= request.getParameter("departure") %>">--%>
<%--        <input type="hidden" name="arrival" value="<%= request.getParameter("arrival") %>">--%>

<%--        <button type="submit">Confirm Booking</button>--%>
<%--    </form>--%>
<%--</div>--%>

<%--</body>--%>
<%--</html>--%>



<%--<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <meta name="viewport" content="width=device-width, initial-scale=1.0">--%>
<%--    <title>Book Flight</title>--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: 'Roboto', sans-serif;--%>
<%--            background-color: #f3f4f6;--%>
<%--            margin: 0;--%>
<%--            padding: 20px;--%>
<%--        }--%>
<%--        h2 {--%>
<%--            text-align: center;--%>
<%--            color: #333;--%>
<%--            font-weight: 600;--%>
<%--        }--%>
<%--        .booking-container {--%>
<%--            background-color: #ffffff;--%>
<%--            padding: 30px;--%>
<%--            border-radius: 15px;--%>
<%--            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);--%>
<%--            max-width: 700px;--%>
<%--            margin: 20px auto;--%>
<%--        }--%>
<%--        .flight-info {--%>
<%--            margin-bottom: 25px;--%>
<%--        }--%>
<%--        .flight-info p {--%>
<%--            margin: 5px 0;--%>
<%--            color: #555;--%>
<%--        }--%>
<%--        .form-group {--%>
<%--            margin-bottom: 15px;--%>
<%--        }--%>
<%--        .form-group label {--%>
<%--            display: block;--%>
<%--            margin-bottom: 5px;--%>
<%--            color: #666;--%>
<%--        }--%>
<%--        .form-group input {--%>
<%--            width: 100%;--%>
<%--            padding: 10px;--%>
<%--            border: 1px solid #ccc;--%>
<%--            border-radius: 5px;--%>
<%--        }--%>
<%--        .book-now {--%>
<%--            background-color: #28a745;--%>
<%--            color: #fff;--%>
<%--            padding: 10px 20px;--%>
<%--            border: none;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--            width: 100%;--%>
<%--            font-size: 18px;--%>
<%--            transition: background-color 0.3s ease;--%>
<%--        }--%>
<%--        .book-now:hover {--%>
<%--            background-color: #218838;--%>
<%--        }--%>
<%--        .add-passenger-btn {--%>
<%--            background-color: #007bff;--%>
<%--            color: #fff;--%>
<%--            padding: 8px 16px;--%>
<%--            border: none;--%>
<%--            border-radius: 5px;--%>
<%--            cursor: pointer;--%>
<%--            margin-top: 10px;--%>
<%--        }--%>
<%--        .passenger-container {--%>
<%--            margin-top: 20px;--%>
<%--            border-top: 1px solid #ccc;--%>
<%--            padding-top: 20px;--%>
<%--        }--%>
<%--        .remove-passenger {--%>
<%--            background-color: #dc3545;--%>
<%--            color: white;--%>
<%--            padding: 5px 10px;--%>
<%--            margin-top: 10px;--%>
<%--            cursor: pointer;--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>

<%--<h2>Flight Booking</h2>--%>

<%--<div class="booking-container">--%>
<%--    <div class="flight-info">--%>
<%--        <h3>Flight Information</h3>--%>
<%--        <p><strong>Airline:</strong> <%= request.getParameter("airline") %></p>--%>
<%--        <p><strong>Flight Number:</strong> <%= request.getParameter("flightNumber") %></p>--%>
<%--        <p><strong>Departure:</strong> <%= request.getParameter("departure") %></p>--%>
<%--        <p><strong>Arrival:</strong> <%= request.getParameter("arrival") %></p>--%>
<%--    </div>--%>

<%--    <form action="${pageContext.request.contextPath}/ConfirmBookingServlet" method="POST" id="bookingForm">--%>
<%--        <div class="form-group">--%>
<%--            <label for="fullName">Full Name:</label>--%>
<%--            <input type="text" id="fullName" name="fullName" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="email">Email:</label>--%>
<%--            <input type="email" id="email" name="email" required>--%>
<%--        </div>--%>
<%--        <div class="form-group">--%>
<%--            <label for="phone">Phone:</label>--%>
<%--            <input type="tel" id="phone" name="phone" required>--%>
<%--        </div>--%>

<%--        <div id="passengerList"></div>--%>

<%--        <button type="button" class="add-passenger-btn" id="addPassengerBtn">+ Add Adult/Child</button>--%>

<%--        <input type="hidden" name="flightNumber" value="<%= request.getParameter("flightNumber") %>">--%>
<%--        <input type="hidden" name="airline" value="<%= request.getParameter("airline") %>">--%>
<%--        <input type="hidden" name="departure" value="<%= request.getParameter("departure") %>">--%>
<%--        <input type="hidden" name="arrival" value="<%= request.getParameter("arrival") %>">--%>

<%--        <button type="submit" class="book-now">Confirm Booking</button>--%>
<%--    </form>--%>
<%--</div>--%>

<%--<script>--%>
<%--    let passengerCount = 0;--%>
<%--    const addPassengerBtn = document.getElementById('addPassengerBtn');--%>
<%--    const passengerList = document.getElementById('passengerList');--%>

<%--    addPassengerBtn.addEventListener('click', () => {--%>
<%--        passengerCount++;--%>

<%--        const passengerDiv = document.createElement('div');--%>
<%--        passengerDiv.classList.add('passenger-container');--%>
<%--        passengerDiv.innerHTML = `--%>
<%--            <h4>Passenger ${passengerCount}</h4>--%>
<%--            <div class="form-group">--%>
<%--                <label for="passengerName${passengerCount}">Name:</label>--%>
<%--                <input type="text" id="passengerName${passengerCount}" name="passengerName${passengerCount}" required>--%>
<%--            </div>--%>
<%--            <div class="form-group">--%>
<%--                <label for="passengerType${passengerCount}">Type:</label>--%>
<%--                <select id="passengerType${passengerCount}" name="passengerType${passengerCount}" required>--%>
<%--                    <option value="Adult">Adult</option>--%>
<%--                    <option value="Child">Child</option>--%>
<%--                </select>--%>
<%--            </div>--%>
<%--            <button type="button" class="remove-passenger" onclick="this.parentElement.remove();">Remove</button>--%>
<%--        `;--%>
<%--        passengerList.appendChild(passengerDiv);--%>
<%--    });--%>
<%--</script>--%>

<%--</body>--%>
<%--</html>--%>







<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Flight</title>
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f3f4f6;
            margin: 0;
            padding: 20px;
        }
        h2 {
            text-align: center;
            color: #333;
            font-weight: 600;
        }
        .booking-container {
            background-color: #ffffff;
            padding: 30px;
            border-radius: 15px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            max-width: 700px;
            margin: 20px auto;
        }
        .flight-info {
            margin-bottom: 25px;
        }
        .flight-info p {
            margin: 5px 0;
            color: #555;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            margin-bottom: 5px;
            color: #666;
        }
        .form-group input {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .book-now {
            background-color: #28a745;
            color: #fff;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            font-size: 18px;
            transition: background-color 0.3s ease;
        }
        .book-now:hover {
            background-color: #218838;
        }
        .add-passenger-btn {
            background-color: #007bff;
            color: #fff;
            padding: 8px 16px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .passenger-container {
            margin-top: 20px;
            border-top: 1px solid #ccc;
            padding-top: 20px;
        }
        .remove-passenger {
            background-color: #dc3545;
            color: white;
            padding: 5px 10px;
            margin-top: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<h2>Flight Booking</h2>

<div class="booking-container">
    <div class="flight-info">
        <h3>Flight Information</h3>
        <p><strong>Flight Number:</strong> <%= request.getAttribute("flightNumber") %></p>
        <p><strong>Airline:</strong> <%= request.getAttribute("airline") %></p>
        <p><strong>Departure:</strong> <%= request.getAttribute("departure") %></p>
        <p><strong>Arrival:</strong> <%= request.getAttribute("arrival") %></p>
        <p><strong>Departure Time:</strong> <%= request.getAttribute("departureTime") %></p>
        <p><strong>Arrival Time:</strong> <%= request.getAttribute("arrivalTime") %></p>
        <p><strong>Airplane:</strong> <%= request.getAttribute("airplane") %></p>
        <p><strong>Legroom:</strong> <%= request.getAttribute("legroom") %></p>
        <p><strong>Extensions:</strong> <%= String.valueOf(request.getAttribute("extensions")) %></p>
        <p><strong>Travel Class:</strong> <%= request.getAttribute("travelClass")%></p>
        <p><strong>Duration:</strong> <%= request.getAttribute("duration") %> minutes</p>
        <p><strong>Layovers:</strong> <%= String.valueOf(request.getAttribute("layovers")) %></p>
        <p><strong>Price:</strong> ₹<%= request.getAttribute("price")%></p>
        <p><strong>Carbon Emissions:</strong> <%= request.getAttribute("carbonEmissions") %> kg CO2</p>
    </div>

    <form action="${pageContext.request.contextPath}/ConfirmBookingServlet" method="POST" id="bookingForm">
        <div class="form-group">
            <label for="fullName">Full Name:</label>
            <input type="text" id="fullName" name="fullName" required>
        </div>
        <div class="form-group">
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
        </div>
        <div class="form-group">
            <label for="phone">Phone:</label>
            <input type="tel" id="phone" name="phone" required>
        </div>

        <div id="passengerList"></div>

        <button type="button" class="add-passenger-btn" id="addPassengerBtn">+ Add Adult/Child</button>

        <input type="hidden" name="flightNumber" value="<%= request.getAttribute("flightNumber") %>">
        <input type="hidden" name="airline" value="<%= request.getAttribute("airline") %>">
        <input type="hidden" name="departure" value="<%= request.getAttribute("departure") %>">
        <input type="hidden" name="arrival" value="<%= request.getAttribute("arrival") %>">
        <input type="hidden" name="departureTime" value="<%= request.getAttribute("departureTime") %>">
        <input type="hidden" name="arrivalTime" value="<%= request.getAttribute("arrivalTime") %>">
        <input type="hidden" name="airplane" value="<%= request.getAttribute("airplane") %>">
        <input type="hidden" name="legroom" value="<%= request.getAttribute("legroom") %>">
        <input type="hidden" name="extensions" value="<%= request.getAttribute("extensions") %>">
        <input type="hidden" name="travel_class" value="<%= request.getAttribute("travelClass") %>">
        <input type="hidden" name="duration" value="<%= request.getAttribute("duration") %>">
        <input type="hidden" name="layovers" value="<%= request.getAttribute("layovers") %>">
        <input type="hidden" name="price" value="<%= request.getAttribute("price") %>">
        <input type="hidden" name="carbon_emissions" value="<%= request.getAttribute("carbonEmissions")%>">
        <button type="submit" class="book-now">Confirm Booking</button>
    </form>
</div>

<script>
    let passengerCount = 0;
    const addPassengerBtn = document.getElementById('addPassengerBtn');
    const passengerList = document.getElementById('passengerList');

    addPassengerBtn.addEventListener('click', () => {
        passengerCount++;

        const passengerDiv = document.createElement('div');
        passengerDiv.classList.add('passenger-container');
        passengerDiv.innerHTML = `
            <h4>Passenger ${passengerCount}</h4>
            <div class="form-group">
                <label for="passengerName${passengerCount}">Name:</label>
                <input type="text" id="passengerName${passengerCount}" name="passengerName${passengerCount}" required>
            </div>
            <div class="form-group">
                <label for="passengerType${passengerCount}">Type:</label>
                <select id="passengerType${passengerCount}" name="passengerType${passengerCount}" required>
                    <option value="Adult">Adult</option>
                    <option value="Child">Child</option>
                </select>
            </div>
            <button type="button" class="remove-passenger" onclick="this.parentElement.remove();">Remove</button>
        `;
        passengerList.appendChild(passengerDiv);
    });
</script>

</body>
</html>


