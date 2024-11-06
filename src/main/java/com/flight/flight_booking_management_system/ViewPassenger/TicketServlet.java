package com.flight.flight_booking_management_system.ViewPassenger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;

@WebServlet("/bookFlight/ViewTicketServlet")
public class TicketServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int bookingId = Integer.parseInt(request.getParameter("bookingId"));

        String jdbcUrl = "jdbc:mysql://localhost:3306/flightregd";
        String jdbcUser = "Java-Project";
        String jdbcPassword = "root@localhost";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword)) {
            String query = "SELECT * FROM bookings WHERE booking_id = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setInt(1, bookingId);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                request.setAttribute("ticket", rs);
                request.getRequestDispatcher("ticket_details.jsp").forward(request, response);
            } else {
                response.getWriter().println("Booking not found.");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}