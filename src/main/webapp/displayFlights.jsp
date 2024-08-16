<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="org.json.JSONObject"%>
<%@ page import="org.json.JSONArray"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Results</title>
    <link rel="stylesheet" href="styles.css">
</head>
<body>
<section class="results">
    <h2>Available Flights</h2>
    <%
        String flightData = request.getParameter("flightData");

        if (flightData != null && !flightData.isEmpty()) {
            JSONObject jsonData = new JSONObject(flightData);
            JSONArray bestFlights = jsonData.optJSONArray("best_flights");
            if (bestFlights != null) {
                for (int i = 0; i < bestFlights.length(); i++) {
                    JSONObject flight = bestFlights.getJSONObject(i);
                    out.println("<div class='flight'>");
                    out.println("<p><strong>Airline:</strong> " + flight.getString("airline") + "</p>");
                    out.println("<p><strong>From:</strong> " + flight.getJSONObject("departure_airport").getString("name") + " (" + flight.getJSONObject("departure_airport").getString("id") + ")</p>");
                    out.println("<p><strong>To:</strong> " + flight.getJSONObject("arrival_airport").getString("name") + " (" + flight.getJSONObject("arrival_airport").getString("id") + ")</p>");
                    out.println("<p><strong>Price:</strong> $" + flight.getInt("price") + "</p>");
                    out.println("<p><strong>Duration:</strong> " + flight.getInt("total_duration") + " minutes</p>");
                    out.println("<hr>");
                    out.println("</div>");
                }
            } else {
                out.println("<p>No best flights found. Checking other flights...</p>");
                JSONArray otherFlights = jsonData.optJSONArray("other_flights");
                if (otherFlights != null) {
                    for (int i = 0; i < otherFlights.length(); i++) {
                        JSONObject flight = otherFlights.getJSONObject(i);
                        out.println("<div class='flight'>");
                        out.println("<p><strong>Airline:</strong> " + flight.getString("airline") + "</p>");
                        out.println("<p><strong>From:</strong> " + flight.getJSONObject("departure_airport").getString("name") + " (" + flight.getJSONObject("departure_airport").getString("id") + ")</p>");
                        out.println("<p><strong>To:</strong> " + flight.getJSONObject("arrival_airport").getString("name") + " (" + flight.getJSONObject("arrival_airport").getString("id") + ")</p>");
                        out.println("<p><strong>Price:</strong> $" + flight.getInt("price") + "</p>");
                        out.println("<p><strong>Duration:</strong> " + flight.getInt("total_duration") + " minutes</p>");
                        out.println("<hr>");
                        out.println("</div>");
                    }
                } else {
                    out.println("<p>No flights found.</p>");
                }
            }
        } else {
            out.println("<p>No flight data received.</p>");
        }
    %>
</section>
</body>
</html>
