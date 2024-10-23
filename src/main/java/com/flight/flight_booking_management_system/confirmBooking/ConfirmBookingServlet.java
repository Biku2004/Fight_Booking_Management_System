package com.flight.flight_booking_management_system.confirmBooking;

import com.mysql.cj.Session;
import com.mysql.cj.protocol.Message;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.PasswordAuthentication;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Properties;



@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightNumber = request.getParameter("flightNumber");
        String airline = request.getParameter("airline");
        String departure = request.getParameter("departure").trim();
        String arrival = request.getParameter("arrival");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String airplane = request.getParameter("airplane");
        String legroom = request.getParameter("legroom");
        String extensions = String.valueOf(request.getParameter("extensions"));
        String travelClass = request.getParameter("travel_class");
        String duration = request.getParameter("duration");
        String layovers = String.valueOf(request.getParameter("layovers"));
        String price = request.getParameter("price");
        String carbonEmissions = request.getParameter("carbon_emissions");
        String fullName = request.getParameter("fullName"); // Main Booker
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        System.out.println(departure);
        System.out.println(flightNumber);
        System.out.println(arrival);

        // Passenger details from form
        String[] passengerNames = request.getParameterValues("passengerName[]");
        String[] passengerTypes = request.getParameterValues("passengerType[]");

        // Database connection details
        String jdbcURL = "jdbc:mysql://localhost:3306/flightregd";
        String dbUser = "Java-Project";
        String dbPassword = "root@localhost";

        Connection connection = null;
        PreparedStatement bookingStmt = null;
        PreparedStatement passengerStmt = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Insert into the flight_bookings table
            String bookingQuery = "INSERT INTO bookings (flight_number, airline, departure, arrival, departure_time, arrival_time, airplane, legroom, extensions, travel_class, duration, layovers, price, carbon_emissions, full_name, email, phone, booking_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
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
            bookingStmt.executeUpdate();

            int rowsInserted = bookingStmt.executeUpdate();
            if (rowsInserted > 0) {
                // Insert passengers associated with the booking
                if (passengerNames != null && passengerTypes != null) {
                    String passengerSQL = "INSERT INTO passengers (booking_id, passenger_name, passenger_type) VALUES (LAST_INSERT_ID(), ?, ?)";
                    passengerStmt = connection.prepareStatement(passengerSQL);

                    for (int i = 0; i < passengerNames.length; i++) {
                        passengerStmt.setString(1, passengerNames[i]); // Passenger name
                        passengerStmt.setString(2, passengerTypes[i]); // Passenger type (Adult/Child)
                        passengerStmt.addBatch();

                        System.out.println(Arrays.toString(passengerNames));
                        System.out.println(Arrays.toString(passengerTypes));
                    }

                    // Execute batch insert for passengers
                    passengerStmt.executeBatch();
                }

                // Send confirmation email
//                String subject = "Booking Confirmation";
//                String messageText = "Dear " + fullName + ",\n\nYour booking for flight " + flightNumber + " has been confirmed.";
//                MailSender.sendEmail(email, subject, messageText);

                // Redirect to confirmation page
                request.setAttribute("fullName", fullName);
                request.setAttribute("flightNumber", flightNumber);
                request.getRequestDispatcher("bookFlight/tickets.jsp").forward(request, response);
            }
        } catch (SQLException | ClassNotFoundException e) {
            throw new ServletException("Booking failed!", e);
        } finally {
            try {
                if (bookingStmt != null) bookingStmt.close();
                if (passengerStmt != null) passengerStmt.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }

}
