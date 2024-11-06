package com.flight.flight_booking_management_system.AddFlightServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

@WebServlet("/AddFlightServlet")
public class AddFlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AddFlightDAO addFlightDAO;

    @Override
    public void init() {
        addFlightDAO = new AddFlightDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightNumber = request.getParameter("flight_number");
        String airline = request.getParameter("airline");
        String airlineLogo = request.getParameter("airline_logo");
        String departureName = request.getParameter("departure_name");
        String departureId = request.getParameter("departure_id");
        String arrivalName = request.getParameter("arrival_name");
        String arrivalId = request.getParameter("arrival_id");
        String departureTime = request.getParameter("departure_time");
        String arrivalTime = request.getParameter("arrival_time");

        System.out.println("Departure Time: " + departureTime);
        System.out.println("Arrival Time: " + arrivalTime);

        if (departureTime == null || departureTime.isEmpty() || arrivalTime == null || arrivalTime.isEmpty()) {
            System.out.println("Error: Departure or Arrival time is missing");
            response.sendRedirect(request.getContextPath() + "/addFlight/addFlightError.jsp");
            return;
        }

        DateTimeFormatter inputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd'T'HH:mm");
        DateTimeFormatter outputFormatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

        String formattedDepartureTime = LocalDateTime.parse(departureTime, inputFormatter).format(outputFormatter);
        String formattedArrivalTime = LocalDateTime.parse(arrivalTime, inputFormatter).format(outputFormatter);

        System.out.println("Formatted Departure Time: " + formattedDepartureTime);
        System.out.println("Formatted Arrival Time: " + formattedArrivalTime);

        String durationStr = request.getParameter("duration");
        String airplane = request.getParameter("airplane");
        String legroom = request.getParameter("legroom");
        String extensions = request.getParameter("extensions");
        String travelClass = request.getParameter("travel_class");
        String layovers = request.getParameter("layovers");
        String totalDurationStr = request.getParameter("total_duration");
        String carbonEmissionsStr = request.getParameter("carbon_emissions");
        String priceStr = request.getParameter("price");
        String type = request.getParameter("type");
        String bookingToken = request.getParameter("booking_token");


        // Parse and validate numeric fields
        int duration = 0;
        int totalDuration = 0;
        double carbonEmissions = 0.0;
        double price = 0.0;

        try {
            duration = durationStr != null && !durationStr.isEmpty() ? Integer.parseInt(durationStr) : 0;
            totalDuration = totalDurationStr != null && !totalDurationStr.isEmpty() ? Integer.parseInt(totalDurationStr) : 0;
            carbonEmissions = carbonEmissionsStr != null && !carbonEmissionsStr.isEmpty() ? Double.parseDouble(carbonEmissionsStr) : 0.0;
            price = priceStr != null && !priceStr.isEmpty() ? Double.parseDouble(priceStr) : 0.0;
        } catch (NumberFormatException e) {
            System.out.println("Invalid numeric input: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/addFlight/addFlightError.jsp");
            return;
        }

        AddFlight flight = new AddFlight();
        flight.setFlight_number(flightNumber);
        flight.setAirline(airline);
        flight.setAirlineLogo(airlineLogo);
        flight.setDepartureName(departureName);
        flight.setDepartureId(departureId);
        flight.setArrivalName(arrivalName);
        flight.setArrivalId(arrivalId);
        flight.setDeparture_time(formattedDepartureTime);
        flight.setArrivalTime(formattedArrivalTime);
        flight.setDuration(duration);
        flight.setAirplane(airplane);
        flight.setLegroom(legroom);
        flight.setExtensions(extensions);
        flight.setTravelClass(travelClass);
        flight.setLayovers(layovers);  // Assuming this is a JSON-formatted string
        flight.setTotalDuration(totalDuration);
        flight.setCarbonEmissions(carbonEmissions);
        flight.setPrice(price);
        flight.setType(type);
        flight.setBookingToken(bookingToken);


        // Use AddFlightDAO to add flight
        boolean isAdded = addFlightDAO.addFlight(flight);

        if (isAdded) {
            System.out.println("Flight added successfully");
            response.sendRedirect(request.getContextPath() + "/addFlight/addFlightSuccess.jsp");
        } else {
            System.out.println("Failed to add flight");
            response.sendRedirect(request.getContextPath() + "/addFlight/addFlightError.jsp");

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Optional: handle GET requests if needed
        response.sendRedirect("/addFlight/addFlight.jsp");
    }
}
