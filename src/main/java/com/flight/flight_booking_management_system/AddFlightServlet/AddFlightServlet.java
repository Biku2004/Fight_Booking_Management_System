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
        String departureCity = request.getParameter("departureCity");
        String arrivalCity = request.getParameter("arrivalCity");
        String departureAirport = request.getParameter("departure_airport");
        String arrivalAirport = request.getParameter("arrival_airport");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String durationStr = request.getParameter("duration");
        String airplane = request.getParameter("airplane");
        String legroom = request.getParameter("legroom");
        String extensions = request.getParameter("extensions");
        String travelClass = request.getParameter("travel_class");
        String layoversDurationStr = request.getParameter("layovers_duration");
        String carbonEmissionsStr = request.getParameter("carbon_emissions");
        String priceStr = request.getParameter("price");


        // Parse and validate numeric fields
        int duration = 0;
        int layoversDuration = 0;
        double carbonEmissions = 0;
        double price = 0;

        try {
            duration = Integer.parseInt(durationStr);
            layoversDuration = layoversDurationStr != null && !layoversDurationStr.isEmpty() ? Integer.parseInt(layoversDurationStr) : 0;
            carbonEmissions = carbonEmissionsStr != null && !carbonEmissionsStr.isEmpty() ? Double.parseDouble(carbonEmissionsStr) : 0.0;
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            System.out.println("Invalid numeric input: " + e.getMessage());
            response.sendRedirect("addFlight/addFlightError.jsp");

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
            response.sendRedirect("addFlight/addFlightSuccess.jsp");
        } else {
            System.out.println("Failed to add flight");
            response.sendRedirect(request.getContextPath() + "addFlight/addFlightError.jsp");

        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Optional: handle GET requests if needed
        response.sendRedirect("addFlight/addFlight.jsp");
    }
}

