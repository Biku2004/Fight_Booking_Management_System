package com.flight.flight_booking_management_system.AddFlightServlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

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
        String flightNumber = request.getParameter("flightNumber");
        String airline = request.getParameter("airline");
        String airlineLogo = request.getParameter("airline_logo");
        String departureName = request.getParameter("departure_name");
        String departureId = request.getParameter("departure_id");
        String arrivalName = request.getParameter("arrival_name");
        String arrivalId = request.getParameter("arrival_id");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
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
        int layoversDuration = 0;
        double carbonEmissions = 0.0;
        double price = 0.0;

        try {
            duration = Integer.parseInt(durationStr);
            layoversDuration = layoversDurationStr != null && !layoversDurationStr.isEmpty() ? Integer.parseInt(layoversDurationStr) : 0;
            carbonEmissions = carbonEmissionsStr != null && !carbonEmissionsStr.isEmpty() ? Double.parseDouble(carbonEmissionsStr) : 0.0;
            price = priceStr != null && !priceStr.isEmpty() ? Double.parseDouble(priceStr) : 0.0;
        } catch (NumberFormatException e) {
            System.out.println("Invalid numeric input: " + e.getMessage());
            response.sendRedirect(request.getContextPath() + "/addFlight/addFlightError.jsp");

            return;
        }

        AddFlight flight = new AddFlight();
        flight.setFlightNumber(flightNumber);
        flight.setAirline(airline);
        flight.setDepartureCity(departureCity);
        flight.setArrivalCity(arrivalCity);
        flight.setDepartureAirport(departureAirport);
        flight.setArrivalAirport(arrivalAirport);
        flight.setDepartureTime(departureTime);
        flight.setArrivalTime(arrivalTime);
        flight.setDuration(duration);
        flight.setAirplane(airplane);
        flight.setLegroom(legroom);
        flight.setExtensions(extensions);
        flight.setTravelClass(travelClass);
        flight.setLayoversDuration(layoversDuration);
        flight.setCarbonEmissions(carbonEmissions);
        flight.setPrice(price);

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

