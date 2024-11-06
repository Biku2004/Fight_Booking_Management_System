package com.flight.flight_booking_management_system.AdminFunctions;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Timestamp;
import java.util.List;

@WebServlet("/ModifyFlightServlet")
public class ModifyFlightServlet extends HttpServlet {

    private ModifyFlightDAO dao = new ModifyFlightDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");
        if ("search".equals(action)) {
            searchFlights(request, response);
        } else if ("modify".equals(action)) {
            modifyFlight(request, response);
        } else if ("update".equals(action)) {
            updateFlight(request, response);
        }
    }

    private void searchFlights(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flightNumber = request.getParameter("flight_number");
        List<ModifyFlight> flights = dao.getFlightsByNumber(flightNumber);
        request.setAttribute("flights", flights);
        request.getRequestDispatcher("modifyFlight/modifyFlightList.jsp").forward(request, response);
    }

    private void modifyFlight(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flightNumber = request.getParameter("flight_number");
        String departureTime = request.getParameter("departure_time");

        List<ModifyFlight> flights = dao.getFlightDetailForModify(flightNumber,departureTime);
        if (flights != null && !flights.isEmpty()) {
            ModifyFlight flight = flights.get(0); // Get the first flight from the list
            request.setAttribute("flight", flight);
            request.getRequestDispatcher("modifyFlight/modifySingleFlight.jsp").forward(request, response);
        } else {
            request.setAttribute("message", "Flight not found.");
            request.getRequestDispatcher("modifyFlight/modifyFlightList.jsp").forward(request, response);
        }
    }

    private void updateFlight(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String flightNumber = request.getParameter("flight_number");
        String airline = request.getParameter("airline");
        String departureName = request.getParameter("departureName");
        String arrivalName = request.getParameter("arrivalName");
        String departureTimeStr = request.getParameter("departure_time");
        String arrivalTimeStr = request.getParameter("arrivalTime");
        double price = Double.parseDouble(request.getParameter("price"));

        // Format the timestamp fields
        Timestamp departureTime = Timestamp.valueOf(departureTimeStr.replace("T", " ") + ":00");
        Timestamp arrivalTime = Timestamp.valueOf(arrivalTimeStr.replace("T", " ") + ":00");

        ModifyFlight flight = new ModifyFlight(flightNumber, airline, departureName, arrivalName, departureTime.toString(), arrivalTime.toString(), price);
        boolean isUpdated = dao.modifyFlight(flight);

        if (isUpdated) {
            request.setAttribute("message", "Flight updated successfully.");
        } else {
            request.setAttribute("message", "Failed to update flight.");
        }
        request.getRequestDispatcher("modifyFlight/modifyFlightSuccess.jsp").forward(request, response);
    }
}