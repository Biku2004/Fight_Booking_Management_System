////package com.flight.flight_booking_management_system.confirmBooking;
////
////import jakarta.servlet.ServletException;
////import jakarta.servlet.annotation.WebServlet;
////import jakarta.servlet.http.HttpServlet;
////import jakarta.servlet.http.HttpServletRequest;
////import jakarta.servlet.http.HttpServletResponse;
////import java.io.IOException;
////import java.sql.Connection;
////import java.sql.DriverManager;
////import java.sql.PreparedStatement;
////import java.sql.SQLException;
////
////@WebServlet("/ConfirmBookingServlet")
////public class ConfirmBookingServlet extends HttpServlet {
////
////    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
////        String flightNumber = request.getParameter("flightNumber");
////        String airline = request.getParameter("airline");
////        String departure = request.getParameter("departure");
////        String arrival = request.getParameter("arrival");
////        String fullName = request.getParameter("fullName");
////        String email = request.getParameter("email");
////        String phone = request.getParameter("phone");
////
////        // Database connection details
////        String jdbcURL = "jdbc:mysql://localhost:3306/flightregd";
////        String dbUser = "Java-Project";
////        String dbPassword = "root@localhost";
////
////        Connection connection = null;
////        PreparedStatement statement = null;
////
////        try {
////            // Connect to the database
////            Class.forName("com.mysql.cj.jdbc.Driver");
////            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
////
////            // Insert booking details into the database
////            String sql = "INSERT INTO bookings (flight_number, airline, departure, arrival, full_name, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
////            statement = connection.prepareStatement(sql);
////            statement.setString(1, flightNumber);
////            statement.setString(2, airline);
////            statement.setString(3, departure);
////            statement.setString(4, arrival);
////            statement.setString(5, fullName);
////            statement.setString(6, email);
////            statement.setString(7, phone);
////
////            int rowsInserted = statement.executeUpdate();
////            if (rowsInserted > 0) {
////                request.setAttribute("fullName", fullName);
////                request.setAttribute("flightNumber", flightNumber);
////                request.getRequestDispatcher("bookFlight/bookingConfirmation.jsp").forward(request, response);
////            }
////        } catch (SQLException | ClassNotFoundException e) {
////            throw new ServletException("Booking failed!", e);
////        } finally {
////            try {
////                if (statement != null) statement.close();
////                if (connection != null) connection.close();
////            } catch (SQLException ex) {
////                ex.printStackTrace();
////            }
////        }
////    }
////
////
////}
//
//
//
//package com.flight.flight_booking_management_system.confirmBooking;
//
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.SQLException;
//import java.util.ArrayList;
//import java.util.List;
//
//@WebServlet("/ConfirmBookingServlet")
//public class ConfirmBookingServlet extends HttpServlet {
//
//    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String flightNumber = request.getParameter("flightNumber");
//        String airline = request.getParameter("airline");
//        String departure = request.getParameter("departure");
//        String arrival = request.getParameter("arrival");
//        String fullName = request.getParameter("fullName"); // Main Booker
//        String email = request.getParameter("email");
//        String phone = request.getParameter("phone");
//
//        // Passenger details from form
//        String[] passengerNames = request.getParameterValues("passengerName[]");
//        String[] passengerTypes = request.getParameterValues("passengerType[]");
//
//        // Database connection details
//        String jdbcURL = "jdbc:mysql://localhost:3306/flightregd";
//        String dbUser = "Java-Project";
//        String dbPassword = "root@localhost";
//
//        Connection connection = null;
//        PreparedStatement bookingStmt = null;
//        PreparedStatement passengerStmt = null;
//
//        try {
//            // Connect to the database
//            Class.forName("com.mysql.cj.jdbc.Driver");
//            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);
//
//            // Insert into the bookings table
//            String bookingSQL = "INSERT INTO bookings (flight_number, airline, departure, arrival, full_name, email, phone) VALUES (?, ?, ?, ?, ?, ?, ?)";
//            bookingStmt = connection.prepareStatement(bookingSQL, PreparedStatement.RETURN_GENERATED_KEYS);
//            bookingStmt.setString(1, flightNumber);
//            bookingStmt.setString(2, airline);
//            bookingStmt.setString(3, departure);
//            bookingStmt.setString(4, arrival);
//            bookingStmt.setString(5, fullName);
//            bookingStmt.setString(6, email);
//            bookingStmt.setString(7, phone);
//
//            int rowsInserted = bookingStmt.executeUpdate();
//            if (rowsInserted > 0) {
//                // Get the generated booking ID
//                var generatedKeys = bookingStmt.getGeneratedKeys();
//                int bookingId = 0;
//                if (generatedKeys.next()) {
//                    bookingId = generatedKeys.getInt(1);
//                }
//
//                // Insert passengers associated with the booking
//                if (passengerNames != null && passengerTypes != null) {
//                    String passengerSQL = "INSERT INTO passengers (booking_id, passenger_name, passenger_type) VALUES (?, ?, ?)";
//                    passengerStmt = connection.prepareStatement(passengerSQL);
//
//                    for (int i = 0; i < passengerNames.length; i++) {
//                        passengerStmt.setInt(1, bookingId); // Foreign key to the booking table
//                        passengerStmt.setString(2, passengerNames[i]); // Passenger name
//                        passengerStmt.setString(3, passengerTypes[i]); // Passenger type (Adult/Child)
//                        passengerStmt.addBatch();
//                    }
//
//                    // Execute batch insert for passengers
//                    passengerStmt.executeBatch();
//                }
//
//                // Redirect to confirmation page
//                request.setAttribute("fullName", fullName);
//                request.setAttribute("flightNumber", flightNumber);
//                request.getRequestDispatcher("bookFlight/bookingConfirmation.jsp").forward(request, response);
//            }
//        } catch (SQLException | ClassNotFoundException e) {
//            throw new ServletException("Booking failed!", e);
//        } finally {
//            try {
//                if (bookingStmt != null) bookingStmt.close();
//                if (passengerStmt != null) passengerStmt.close();
//                if (connection != null) connection.close();
//            } catch (SQLException ex) {
//                ex.printStackTrace();
//            }
//        }
//    }
//}




package com.flight.flight_booking_management_system.confirmBooking;

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
import java.util.ArrayList;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightNumber = request.getParameter("flightNumber");
        String airline = request.getParameter("airline");
        String departure = request.getParameter("departure").trim();
        String arrival = request.getParameter("arrival");
        String fullName = request.getParameter("fullName"); // Main Booker
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");

        // Additional flight details
        String duration = request.getParameter("duration");
        String price = request.getParameter("price");
        String legroom = request.getParameter("legroom");
        String carbonEmissions = request.getParameter("carbonEmissions");

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
            String bookingSQL = "INSERT INTO flight_bookings (flight_number, airline, departure, arrival, full_name, email, phone, duration, price, legroom, carbon_emissions) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            bookingStmt = connection.prepareStatement(bookingSQL, PreparedStatement.RETURN_GENERATED_KEYS);
            bookingStmt.setString(1, flightNumber);
            bookingStmt.setString(2, airline);
            bookingStmt.setString(3, departure);
            bookingStmt.setString(4, arrival);
            bookingStmt.setString(5, fullName);
            bookingStmt.setString(6, email);
            bookingStmt.setString(7, phone);
            bookingStmt.setString(8, duration); // Duration of the flight
            bookingStmt.setString(9, (price)); // Price of the flight
            bookingStmt.setString(10, legroom); // Legroom information
            bookingStmt.setString(11, carbonEmissions); // Carbon emissions

            int rowsInserted = bookingStmt.executeUpdate();
            if (rowsInserted > 0) {
                // Get the generated booking ID
                var generatedKeys = bookingStmt.getGeneratedKeys();
                int bookingId = 0;
                if (generatedKeys.next()) {
                    bookingId = generatedKeys.getInt(1);
                }

                // Insert passengers associated with the booking
                if (passengerNames != null && passengerTypes != null) {
                    String passengerSQL = "INSERT INTO passengers (booking_id, passenger_name, passenger_type) VALUES (?, ?, ?)";
                    passengerStmt = connection.prepareStatement(passengerSQL);

                    for (int i = 0; i < passengerNames.length; i++) {
                        passengerStmt.setInt(1, bookingId); // Foreign key to the booking table
                        passengerStmt.setString(2, passengerNames[i]); // Passenger name
                        passengerStmt.setString(3, passengerTypes[i]); // Passenger type (Adult/Child)
                        passengerStmt.addBatch();
                    }

                    // Execute batch insert for passengers
                    passengerStmt.executeBatch();
                }

                // Redirect to confirmation page
                request.setAttribute("fullName", fullName);
                request.setAttribute("flightNumber", flightNumber);
                request.getRequestDispatcher("bookFlight/bookingConfirmation.jsp").forward(request, response);
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
