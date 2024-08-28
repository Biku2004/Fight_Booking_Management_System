package com.flight.flight_booking_management_system;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;

@WebServlet("/flightSearch")
public class FlightSearchServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departure = request.getParameter("departure");
        String returnDate = request.getParameter("return");
        String tripType = request.getParameter("trip");


//        String apiUrl = "https://serpapi.com/search.json?engine=google_flights&departure_id="+ from +
//        "&arrival_id=" + to +
//        "&outbound_date=" + departure +
//        "&return_date="+ returnDate +
//        "&currency=USD&hl=en&api_key=2e6ff4c799c82804bf56ffd1e046a88d9727e21c78a087394d81c43e5cf7e36b";

        String apiUrl;

        if ("roundtrip".equalsIgnoreCase(tripType.trim())) {
            // Two-way flight search
            apiUrl = "https://serpapi.com/search.json?engine=google_flights&departure_id=" + from +
                    "&arrival_id=" + to +
                    "&outbound_date=" + departure +
                    "&return_date=" + returnDate +
                    "&currency=USD&hl=en&api_key=2e6ff4c799c82804bf56ffd1e046a88d9727e21c78a087394d81c43e5cf7e36b";
        } else {
            // One-way flight search
            apiUrl = "https://serpapi.com/search?engine=google_flights&departure_id=" + from +
                    "&arrival_id=" + to +
                    "&outbound_date=" + departure +
                    "&type=2&currency=INR&hl=en&api_key=2e6ff4c799c82804bf56ffd1e046a88d9727e21c78a087394d81c43e5cf7e36b";
        }


        // Fetch flight data from the API
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        // Read the response
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder responseBuilder = new StringBuilder();
        String line;
        while ((line = in.readLine()) != null) {
            responseBuilder.append(line);
        }
        in.close();

        // Convert the response to JSON
//        String jsonResponse = responseBuilder.toString();
//        request.setAttribute("flightData", jsonResponse);
        String jsonResponse = responseBuilder.toString();
        request.setAttribute("flightData", jsonResponse);
        request.setAttribute("tripType", tripType);

        // Forward to JSP page
//        RequestDispatcher dispatcher = request.getRequestDispatcher("displayFlights.jsp");
//        dispatcher.forward(request, response);
        String jspPage = "roundtrip".equalsIgnoreCase(tripType.trim()) ? "displayFlights.jsp" : "displayOneWay.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);

        System.out.println("Trip Type: " + tripType);
    }
}


