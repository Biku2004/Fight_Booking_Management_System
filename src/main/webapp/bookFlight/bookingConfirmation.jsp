<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 80%;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        h2 {
            color: #333;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        table, th, td {
            border: 1px solid #ddd;
        }

        th, td {
            padding: 10px;
            text-align: left;
        }

        th {
            background-color: #f2f2f2;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        .button-container button {
            margin: 5px;
            padding: 10px 20px;
            font-size: 16px;
            cursor: pointer;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Booking Confirmation</h2>

    <p>Thank you,
        <strong><%= session.getAttribute("fullName") %></strong>
        ! Your booking for flight number
        <strong><%= session.getAttribute("flightNumber") %></strong> has been confirmed.
    </p>

    <h3>Passenger Details:</h3>
    <table>
        <tr>
            <th>Name</th>
            <th>Age</th>
            <th>Seat</th>
        </tr>
        <%
            String[] passengerNames = (String[]) session.getAttribute("passengerNames");
            String[] passengerAges = (String[]) session.getAttribute("passengerAges");
            String[] passengerSeats = (String[]) session.getAttribute("passengerSeats");

            if (passengerNames != null) {
                for (int i = 0; i < passengerNames.length; i++) {
        %>
        <tr>
            <td><%= passengerNames[i] %></td>
            <td><%= passengerAges[i] %></td>
            <td><%= passengerSeats[i] %></td>
        </tr>
        <%
                }
            }
        %>
    </table>

    <div class="button-container">
        <button onclick="location.href='tickets.jsp'">Show Ticket</button>
    </div>
</div>

</body>
</html>