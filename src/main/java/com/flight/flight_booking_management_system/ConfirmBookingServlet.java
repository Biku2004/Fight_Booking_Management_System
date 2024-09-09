package com.flight.flight_booking_management_system;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightNumber = request.getParameter("flightNumber");
        String airline = request.getParameter("airline");
        String departure = request.getParameter("departure");
        String arrival = request.getParameter("arrival");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/flightregd";
        String dbUser = "Java-Project";
        String dbPassword = "root@localhost";

        Connection connection = null;
        PreparedStatement statement = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Insert booking details into the database
            String sql = "INSERT INTO bookings (flight_number, airline, departure, arrival, full_name, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
            statement = connection.prepareStatement(sql);
            statement.setString(1, flightNumber);
            statement.setString(2, airline);
            statement.setString(3, departure);
            statement.setString(4, arrival);
            statement.setString(5, fullName);
            statement.setString(6, email);
            statement.setString(7, phone);

            int rowsInserted = statement.executeUpdate();
            if (rowsInserted > 0) {
                request.setAttribute("fullName", fullName);
                request.setAttribute("flightNumber", flightNumber);
                request.getRequestDispatcher("bookingConfirmation.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Booking failed!", e);
        } finally {
            try {
                if (statement != null) statement.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
