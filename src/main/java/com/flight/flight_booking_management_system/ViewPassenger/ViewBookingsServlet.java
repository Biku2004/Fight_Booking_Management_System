package com.flight.flight_booking_management_system.ViewPassenger;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.*;

@WebServlet("/bookFlight/ViewBookingsServlet")
public class ViewBookingsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();

        String userEmail = (String) session.getAttribute("email");
        if (userEmail == null) {
            System.out.println("No user email found in session.");
        } else {
            System.out.println("User email from session: " + userEmail);
        }        // Get logged-in user's email


        String jdbcUrl = "jdbc:mysql://localhost:3306/flightregd";
        String jdbcUser = "Java-Project";
        String jdbcPassword = "root@localhost";

        try (Connection conn = DriverManager.getConnection(jdbcUrl, jdbcUser, jdbcPassword)) {
            String query = "SELECT booking_id, flight_number, airline, departure, arrival, departure_time, arrival_time, price, seat FROM bookings WHERE email = ?";
            PreparedStatement stmt = conn.prepareStatement(query);
            stmt.setString(1, userEmail);

            ResultSet rs = stmt.executeQuery();
            request.setAttribute("bookings", rs);
            request.getRequestDispatcher("view_bookings.jsp").forward(request, response);
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}