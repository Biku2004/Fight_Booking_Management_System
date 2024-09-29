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
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String priceStr = request.getParameter("price");

        // Convert price to double and validate
        double price;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            System.out.println("Invalid price format: " + e.getMessage());
            response.sendRedirect("addFlight/addFlightError.jsp");
            return;
        }

        // Create a new AddFlight object
        AddFlight flight = new AddFlight();
        flight.setFlightNumber(flightNumber);
        flight.setAirline(airline);
        flight.setDepartureCity(departureCity);
        flight.setArrivalCity(arrivalCity);
        flight.setDepartureTime(departureTime);
        flight.setArrivalTime(arrivalTime);
        flight.setPrice(price);

        // Use AddFlightDAO to add flight
        boolean isAdded = addFlightDAO.addFlight(flight);

        if (isAdded) {
            System.out.println("Flight added successfully");
            response.sendRedirect("addFlight/addFlightSuccess.jsp");
        } else {
            System.out.println("Failed to add flight");
            response.sendRedirect("addFlight/addFlightError.jsp");
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Optional: handle GET requests if needed
        response.sendRedirect("addFlight/addFlight.jsp");
    }
}

