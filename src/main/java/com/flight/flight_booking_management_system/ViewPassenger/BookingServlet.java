package com.flight.flight_booking_management_system.ViewPassenger;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

@WebServlet("/ViewPassenger/BookingServlet")
public class BookingServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightNumber = request.getParameter("flightNumber");

        // Database connection details
        String dbUrl = "jdbc:mysql://localhost:3306/flightregd";
        String dbUser = "Java-Project";
        String dbPassword = "root@localhost";

        // Register JDBC driver (optional but can be included for clarity)
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Driver not found: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("errorPage.jsp");
            dispatcher.forward(request, response);
            return; // Exit the method early
        }

        // Query to fetch booking details
        String query = "SELECT * FROM bookings WHERE flight_number = ?";

        try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
             PreparedStatement stmt = con.prepareStatement(query)) {

            stmt.setString(1, flightNumber);
            ResultSet rs = stmt.executeQuery();

            // List to hold booking details
            List<Booking> bookings = new ArrayList<>();

            while (rs.next()) {
                Booking booking = new Booking(
                        rs.getString("flight_number"),
                        rs.getString("airline"),
                        rs.getString("departure"),
                        rs.getString("arrival"),
                        rs.getString("full_name"),
                        rs.getString("email"),
                        rs.getString("phone"),
                        rs.getTimestamp("booking_time")
                );
                bookings.add(booking);
            }

            // Set bookings as request attribute
            request.setAttribute("bookings", bookings);
            request.setAttribute("flightNumber", flightNumber); // Also set the flight number

            // Forward to JSP
            RequestDispatcher dispatcher = request.getRequestDispatcher("bookingResult.jsp");
            dispatcher.forward(request, response);

        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Database error: " + e.getMessage());
            RequestDispatcher dispatcher = request.getRequestDispatcher("errorPage.jsp");
            dispatcher.forward(request, response);
        }
    }
}
