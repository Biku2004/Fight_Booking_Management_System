package com.flight.flight_booking_management_system.AdminFunctions;

import com.flight.flight_booking_management_system.AddFlightServlet.AddFlightDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

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

        // Retrieve parameters from the request for searching
        String flightNumber = request.getParameter("flight_number");

        // Check if we are searching for a flight or modifying an existing one
        if (request.getParameter("action") != null && request.getParameter("action").equals("search")) {
            List<ModifyFlight> flights = flightDAO.getFlightsByNumber(flightNumber);

            if (flights != null && !flights.isEmpty()) {
                if (flights.size() == 1) {
                    // Only one flight found, forward directly to modifySingleFlight.jsp
                    request.setAttribute("flight", flights.get(0));
                    request.getRequestDispatcher("/modifyFlight/modifySingleFlight.jsp").forward(request, response);
                } else {
                    // Multiple flights found, forward to modifyFlightList.jsp
                    request.setAttribute("flights", flights);
                    request.getRequestDispatcher("/modifyFlight/modifyFlightList.jsp").forward(request, response);
                }
            } else {
                // No flights found, show an error message on the original page
                request.setAttribute("errorMessage", "No flight found with the provided number.");
                request.getRequestDispatcher("/modifyFlight/modifyFlight.jsp").forward(request, response);
            }
            return;
        }


        // Retrieve parameters for modification
        String airline = request.getParameter("airline");
        String departureCity = request.getParameter("departureCity");
        String arrivalCity = request.getParameter("arrivalCity");
        String arrivalTimeStr = request.getParameter("arrivalTime");
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

        // Convert departure and arrival times to Timestamp
        Timestamp departureTime;
        Timestamp arrivalTime;

        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");

        try {
            departureTime = new Timestamp(dateFormat.parse(request.getParameter("departure_time")).getTime());
            arrivalTime = new Timestamp(dateFormat.parse(arrivalTimeStr).getTime());
        } catch (ParseException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Invalid date format. Please use 'yyyy-MM-dd HH:mm:ss'.");
            request.getRequestDispatcher("/modifyFlight/modifyFlight.jsp").forward(request, response);
            return;
        }

        // Create a ModifyFlight object to encapsulate the updated flight details
        ModifyFlight flight = new ModifyFlight(flightNumber, airline, departureCity, arrivalCity, departureTime.toString(), arrivalTime.toString(), price);

        // Call the DAO method to modify the flight details in the database
        boolean isModified = flightDAO.modifyFlight(flight);

        // Handle the result of the modification operation
        if (isModified) {
            // If modification is successful, redirect to success page
            response.sendRedirect(request.getContextPath() + "/modifyFlight/modifyFlightSuccess.jsp");
        } else {
            // If modification fails, show error message on the modify page
            request.setAttribute("errorMessage", "Failed to modify flight details. Please try again.");
            request.getRequestDispatcher("/modifyFlight/modifyFlightError.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // For now, redirect GET requests to the modification form page
        response.sendRedirect(request.getContextPath() + "/modifyFlight/modifyFlight.jsp");
    }
}