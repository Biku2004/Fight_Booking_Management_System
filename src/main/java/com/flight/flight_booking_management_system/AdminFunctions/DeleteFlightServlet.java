package com.flight.flight_booking_management_system.AdminFunctions;

import com.flight.flight_booking_management_system.AddFlightServlet.AddFlightDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/deleteFlight1")
public class DeleteFlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AddFlightDAO flightDAO;

    @Override
    public void init() throws ServletException {
        flightDAO = new AddFlightDAO();  // Initialize the DAO object
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the flight number, departure date, and arrival date from the request
        String flightNumber = request.getParameter("flightNumber");
        String departureDateTime = request.getParameter("departureTime");
        String arrivalDateTime = request.getParameter("arrivalTime");

        // Create an instance of DeleteFlight with the flight number, departure date, and arrival date
        DeleteFlight flight = new DeleteFlight(flightNumber, departureDateTime, arrivalDateTime);

        // Call the deleteFlight method from DAO to delete the flight
        boolean isDeleted = flightDAO.deleteFlight(flight);

        // Redirect to the appropriate page based on the result
        if (isDeleted) {
            response.sendRedirect("deleteFlight/deleteFlightSuccess.jsp");
        } else {
            response.sendRedirect("deleteFlight/deleteFlightError.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the flight number from the request
        String flightNumber = request.getParameter("flightNumber");

        // Fetch flights by flight number
//        List<DeleteFlight> flights = AddFlightDAO.getFlightsByFlightNumber(flightNumber);

        // Set the flights as a request attribute
//        request.setAttribute("flights", flights);

        // Forward to the JSP
        request.getRequestDispatcher("deleteFlight/deleteFlight.jsp").forward(request, response);
    }
}