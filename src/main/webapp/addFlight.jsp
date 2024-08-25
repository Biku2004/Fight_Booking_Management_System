<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 22-08-2024
  Time: 23:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add New Flight</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #eef2f7;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 400px;
            background: #ffffff;
            border-radius: 12px;
            padding: 30px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease-in-out;
        }

        .container:hover {
            transform: translateY(-5px);
        }

        h1 {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #333333;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        .form-group label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #555555;
        }

        .form-group input,
        .form-group select {
            width: 100%;
            padding: 12px;
            border-radius: 8px;
            border: 1px solid #cccccc;
            box-sizing: border-box;
            font-size: 16px;
            color: #333333;
            background-color: #fafafa;
            transition: border-color 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #007BFF;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .form-group button {
            width: 100%;
            padding: 14px;
            border-radius: 8px;
            background: linear-gradient(90deg, #007BFF, #00BFFF);
            color: white;
            border: none;
            font-size: 18px;
            font-weight: 600;
            cursor: pointer;
            transition: background 0.3s ease, transform 0.3s ease;
        }

        .form-group button:hover {
            background: linear-gradient(90deg, #0056b3, #007BFF);
            transform: translateY(-3px);
        }

        .form-group button:active {
            transform: translateY(1px);
        }


    </style>
</head>
<body>
<div class="container">
    <h1>Add New Flight</h1>
    <form action="AddFlightServlet" method="post">
        <div class="form-group">
            <label for="flightNumber">Flight Number</label>
            <input type="text" id="flightNumber" name="flightNumber" required>
        </div>
        <div class="form-group">
            <label for="airline">Airline</label>
            <input type="text" id="airline" name="airline" required>
        </div>
        <div class="form-group">
            <label for="departureCity">Departure City</label>
            <input type="text" id="departureCity" name="departureCity" required>
        </div>
        <div class="form-group">
            <label for="arrivalCity">Arrival City</label>
            <input type="text" id="arrivalCity" name="arrivalCity" required>
        </div>
        <div class="form-group">
            <label for="departureTime">Departure Time</label>
            <input type="datetime-local" id="departureTime" name="departureTime" required>
        </div>
        <div class="form-group">
            <label for="arrivalTime">Arrival Time</label>
            <input type="datetime-local" id="arrivalTime" name="arrivalTime" required>
        </div>
        <div class="form-group">
            <label for="price">Ticket Price</label>
            <input type="number" id="price" name="price" required>
        </div>
        <div class="form-group">
            <button type="submit">Add Flight</button>
        </div>
    </form>
</div>
</body>
</html>
