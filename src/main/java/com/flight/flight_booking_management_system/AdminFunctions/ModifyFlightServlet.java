package com.flight.flight_booking_management_system.AdminFunctions;

import com.flight.flight_booking_management_system.AddFlightServlet.AddFlightDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/ModifyFlightServlet")
public class ModifyFlightServlet extends HttpServlet {

    private AddFlightDAO flightDAO;

    @Override
    public void init() {
        flightDAO = new AddFlightDAO();  // Initialize DAO instance
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Retrieve parameters from the request
        String flightNumber = request.getParameter("flightNumber");
        String airline = request.getParameter("airline");
        String departureCity = request.getParameter("departureCity");
        String arrivalCity = request.getParameter("arrivalCity");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String priceStr = request.getParameter("price");

        double price = 0.0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            // Handle error if price is not a valid number
            request.setAttribute("errorMessage", "Invalid price format. Please enter a valid number.");
            request.getRequestDispatcher("modifyFlight/modifyFlight.jsp").forward(request, response);
            return;
        }

        // Create a ModifyFlight object to encapsulate the updated flight details
        ModifyFlight flight = new ModifyFlight(flightNumber, airline, departureCity, arrivalCity, departureTime, arrivalTime, price);

        // Call the DAO method to modify the flight details in the database
        boolean isModified = flightDAO.modifyFlight(flight);

        // Handle the result of the modification operation
        if (isModified) {
            // If modification is successful, redirect to success page
            response.sendRedirect("modifyFlightSuccess.jsp");
        } else {
            // If modification fails, show error message on the modify page
            request.setAttribute("errorMessage", "Failed to modify flight details. Please try again.");
            request.getRequestDispatcher("modifyFlight/modifyFlightError.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // For now, redirect GET requests to the modification form page
        response.sendRedirect("modifyFlight/modifyFlight.jsp");
    }
}
