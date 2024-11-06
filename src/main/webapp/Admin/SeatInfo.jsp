<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seat Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            margin: 0;
            padding: 0;
        }
        .container {
            max-width: 800px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        h1 {
            text-align: center;
            color: #007bff;
        }
        #searchForm {
            display: flex;
            flex-direction: column;
            align-items: center;
            margin-bottom: 20px;
        }
        #searchForm label {
            font-size: 18px;
            margin-bottom: 10px;
        }
        #searchForm input {
            padding: 10px;
            font-size: 16px;
            width: 100%;
            max-width: 300px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }
        #searchForm button {
            padding: 10px 20px;
            font-size: 16px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }
        #searchForm button:hover {
            background-color: #0056b3;
        }
        .seats-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
        }
        .seat {
            background-color: #8c00ff;
            padding: 10px;
            border: 2px solid #0084ff;
            border-radius: 5px;
            text-align: center;
            width: 70px;
            margin: 10px;
            color: white;
            font-weight: bold;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }
        .seat.disabled {
            background-color: #f44336; /* Booked seat color */
            cursor: not-allowed;
        }
        .seat:hover {
            transform: scale(1.05);
        }
    </style>
</head>
<body>
<form id="searchForm" method="get" action="${pageContext.request.contextPath}/SeatInfoServlet">
    <label for="flightNumber">Flight Number:</label>
    <input type="text" id="flightNumber" name="flightNumber" required>
    <button type="submit">Search</button>
</form>
<div id="seatsContainer">
    <%
        String[] occupiedSeats = (String[]) request.getAttribute("occupiedSeats");
        if (occupiedSeats != null) {
            for (String seat : occupiedSeats) {
                out.println("<div class='seat disabled'>" + seat + "</div>");
            }
        }
    %>
</div>
</body>
</html>