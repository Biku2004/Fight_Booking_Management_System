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

        String[] passengerNames = request.getParameterValues("passengerName");
        String[] passengerAges = request.getParameterValues("passengerAge");
        String[] passengerSeats = request.getParameterValues("passengerSeat");

//        request.setAttribute("flightNumber", flightNumber);
//        request.setAttribute("airline", airline);
//        request.setAttribute("departure", departure);
//        request.setAttribute("arrival", arrival);
//        request.setAttribute("departureTime", departureTime);
//        request.setAttribute("arrivalTime", arrivalTime);
//        request.setAttribute("airplane", airplane);
//        request.setAttribute("legroom", legroom);
//        request.setAttribute("extensions", extensions);
//        request.setAttribute("travelClass", travelClass);
//        request.setAttribute("duration", duration);
//        request.setAttribute("layovers", layovers);
//        request.setAttribute("price", price);
//        request.setAttribute("carbonEmissions", carbonEmissions);
//        request.setAttribute("fullName", fullName);
//        request.setAttribute("email", email);
//        request.setAttribute("phone", phone);
//        request.setAttribute("passengerName", passengerNames);
//        request.setAttribute("passengerAge", passengerAges);
//        request.setAttribute("passengerSeat", passengerSeats);

        HttpSession session = request.getSession();
        session.setAttribute("flightNumber", flightNumber);
        session.setAttribute("airline", airline);
        session.setAttribute("departure", departure);
        session.setAttribute("arrival", arrival);
        session.setAttribute("departureTime", departureTime);
        session.setAttribute("arrivalTime", arrivalTime);
        session.setAttribute("airplane", airplane);
        session.setAttribute("legroom", legroom);
        session.setAttribute("extensions", extensions);
        session.setAttribute("travelClass", travelClass);
        session.setAttribute("duration", duration);
        session.setAttribute("layovers", layovers);
        session.setAttribute("price", price);
        session.setAttribute("carbonEmissions", carbonEmissions);
        session.setAttribute("fullName", fullName);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("passengerNames", passengerNames);
        session.setAttribute("passengerAges", passengerAges);
        session.setAttribute("passengerSeats", passengerSeats);

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

            String bookingQuery = "INSERT INTO bookings (flight_number, airline, departure, arrival, departure_time, arrival_time, airplane, legroom, extensions, travel_class, duration, layovers, price, carbon_emissions, full_name, email, phone, booking_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
            bookingStmt = connection.prepareStatement(bookingQuery, PreparedStatement.RETURN_GENERATED_KEYS);
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

            ResultSet generatedKeys = bookingStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                long bookingId = generatedKeys.getLong(1);

                String passengerSQL = "INSERT INTO passengers (booking_id, passenger_name, passenger_age, seat) VALUES (?, ?, ?, ?)";
                passengerStmt = connection.prepareStatement(passengerSQL);

                for (int i = 0; i < passengerNames.length; i++) {
                    String passengerName = passengerNames[i];
                    String passengerAge = passengerAges[i];
                    String passengerSeat = passengerSeats[i];

//                    String checkSeatQuery = "SELECT * FROM passengers WHERE flight_number = ? AND seat = ?";
//                    checkSeatStmt = connection.prepareStatement(checkSeatQuery);
//                    checkSeatStmt.setString(1, flightNumber);
//                    checkSeatStmt.setString(2, passengerSeat);
//                    ResultSet seatResultSet = checkSeatStmt.executeQuery();

//                    if (seatResultSet.next()) {
//                        HttpSession session = request.getSession();
//                        session.setAttribute("errorMessage", "The selected seat " + passengerSeat + " is already booked. Please choose another seat.");
//                        response.sendRedirect(request.getContextPath() + "/bookFlight/BookingError.jsp");
//                        return;
//                    }

                    passengerStmt.setLong(1, bookingId);
                    passengerStmt.setString(2, passengerName);
                    passengerStmt.setString(3, passengerAge);
                    passengerStmt.setString(4, passengerSeat);
                    passengerStmt.addBatch();

//                    checkSeatStmt.close(); // Close the statement after each iteration
                }
                passengerStmt.executeBatch();
            }

            response.sendRedirect("bookFlight/bookingConfirmation.jsp");

        } catch (SQLException | ClassNotFoundException e) {
//            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Booking failed due to a server error. Please try again later.");
            response.sendRedirect("bookFlight/BookingError.jsp");
            e.printStackTrace();
        } finally {
            try {
//                if (checkSeatStmt != null) checkSeatStmt.close();
                if (bookingStmt != null) bookingStmt.close();
                if (passengerStmt != null) passengerStmt.close();
                if (connection != null) connection.close();
            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }
    }
}
