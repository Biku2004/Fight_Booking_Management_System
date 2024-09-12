package com.flight.flight_booking_management_system.AdminFunctions;

import com.flight.flight_booking_management_system.AddFlightServlet.AddFlightDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;

@WebServlet("/deleteFlight")
public class DeleteFlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AddFlightDAO flightDAO;

    @Override
    public void init() throws ServletException {
        flightDAO = new AddFlightDAO();  // Initialize the DAO object
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the flight number from the request
        String flightNumber = request.getParameter("flightNumber");

        // Create an instance of DeleteFlight with the flight number
        DeleteFlight flight = new DeleteFlight(flightNumber);

        // Call the deleteFlight method from DAO to delete the flight
        boolean isDeleted = flightDAO.deleteFlight(flight);

        // Redirect to the appropriate page based on the result
        if (isDeleted) {
            // Redirect to success page if deletion is successful
            response.sendRedirect("deleteFlightSuccess.jsp");
        } else {
            // Redirect to error page if deletion fails
            response.sendRedirect("deleteFlightError.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Typically, doPost handles deletion, but you can redirect to the form or error page if needed
        response.sendRedirect("deleteFlight/deleteFlight.jsp");
    }
}
