package com.flight.flight_booking_management_system.confirmBooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightNumber = request.getParameter("flightNumber");
        String airline = request.getParameter("airline");
        String departure = request.getParameter("departure");
        String arrival = request.getParameter("arrival");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String airplane = request.getParameter("airplane");
        String legroom = request.getParameter("legroom");
        String extensions = request.getParameter("extensions");
        String travelClass = request.getParameter("travel_class");
        String duration = request.getParameter("duration");
        String layovers = request.getParameter("layovers");
        String price = request.getParameter("price");
        String carbonEmissions = request.getParameter("carbon_emissions");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String seat = request.getParameter("Seats");

        String[] passengerNames = request.getParameterValues("passengerName[]");
        String[] passengerTypes = request.getParameterValues("passengerType[]");

        String jdbcURL = "jdbc:mysql://localhost:3306/flightregd";
        String dbUser = "Java-Project";
        String dbPassword = "root@localhost";

        Connection connection = null;
        PreparedStatement checkSeatStmt = null;
        PreparedStatement bookingStmt = null;
        PreparedStatement passengerStmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String checkSeatQuery = "SELECT * FROM bookings WHERE flight_number = ? AND seat = ?";
            checkSeatStmt = connection.prepareStatement(checkSeatQuery);
            checkSeatStmt.setString(1, flightNumber);
            checkSeatStmt.setString(2, seat);
            ResultSet seatResultSet = checkSeatStmt.executeQuery();

            if (seatResultSet.next()) {
                // Seat is already booked - Set error message in session and redirect to error page
                HttpSession session = request.getSession();
                session.setAttribute("errorMessage", "The selected seat is already booked. Please choose another seat.");
                response.sendRedirect(request.getContextPath() + "/bookFlight/BookingError.jsp");
                return;
            }

            String bookingQuery = "INSERT INTO bookings (flight_number, airline, departure, arrival, departure_time, arrival_time, airplane, legroom, extensions, travel_class, duration, layovers, price, carbon_emissions, full_name, email, phone, booking_time, seat) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW(), ?)";
            bookingStmt = connection.prepareStatement(bookingQuery);
            bookingStmt.setString(1, flightNumber);
            bookingStmt.setString(2, airline);
            bookingStmt.setString(3, departure);
            bookingStmt.setString(4, arrival);
            bookingStmt.setString(5, departureTime);
            bookingStmt.setString(6, arrivalTime);
            bookingStmt.setString(7, airplane);
            bookingStmt.setString(8, legroom);
            bookingStmt.setString(9, extensions);
            bookingStmt.setString(10, travelClass);
            bookingStmt.setString(11, duration);
            bookingStmt.setString(12, layovers);
            bookingStmt.setString(13, price);
            bookingStmt.setString(14, carbonEmissions);
            bookingStmt.setString(15, fullName);
            bookingStmt.setString(16, email);
            bookingStmt.setString(17, phone);
            bookingStmt.setString(18, seat);
            bookingStmt.executeUpdate();

            if (passengerNames != null && passengerTypes != null) {
                String passengerSQL = "INSERT INTO passengers (booking_id, passenger_name, passenger_type) VALUES (LAST_INSERT_ID(), ?, ?)";
                passengerStmt = connection.prepareStatement(passengerSQL);

                for (int i = 0; i < passengerNames.length; i++) {
                    passengerStmt.setString(1, passengerNames[i]);
                    passengerStmt.setString(2, passengerTypes[i]);
                    passengerStmt.addBatch();
                }
                passengerStmt.executeBatch();
            }

            // Redirect to a success page or confirmation page
            response.sendRedirect("BookingConfirmation.jsp");

        } catch (SQLException | ClassNotFoundException e) {
            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Booking failed due to a server error. Please try again later.");
            response.sendRedirect("BookingError.jsp");
            e.printStackTrace();
        } finally {
            try {
                if (checkSeatStmt != null) checkSeatStmt.close();
                if (bookingStmt != null) bookingStmt.close();
                if (passengerStmt != null) passengerStmt.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
