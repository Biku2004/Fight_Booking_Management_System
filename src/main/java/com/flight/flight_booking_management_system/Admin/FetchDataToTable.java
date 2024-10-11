//package com.flight.flight_booking_management_system.Admin;
//
//import java.io.IOException;
//import java.sql.Connection;
//import java.sql.DriverManager;
//import java.sql.PreparedStatement;
//import java.sql.ResultSet;
//import java.util.ArrayList;
//import java.util.List;
//import jakarta.servlet.ServletException;
//import jakarta.servlet.annotation.WebServlet;
//import jakarta.servlet.http.HttpServlet;
//import jakarta.servlet.http.HttpServletRequest;
//import jakarta.servlet.http.HttpServletResponse;
//import jakarta.servlet.http.HttpSession;
//
//@WebServlet("/fetchDataToTable")
//public class FetchDataToTable extends HttpServlet {
//    private static final long serialVersionUID = 1L;
//
//    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        System.out.println("Servlet called"); // Debug statement
//
//        // Retrieve parameters
//        String fromIata = request.getParameter("from");
//        String toIata = request.getParameter("to");
//
//        HttpSession session = request.getSession();
//        session.setAttribute("lastSearchFrom", fromIata);
//        session.setAttribute("lastSearchTo", toIata);
//
//        // Database connection settings
//        String url = "jdbc:mysql://localhost:3306/flightregd";
//        String user = "Java-Project";
//        String password = "root@localhost";
//
//        List<Flight> flightList = new ArrayList<>();
//
//        try {
//            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
//            try (Connection conn = DriverManager.getConnection(url, user, password)) {
//
//                // Retrieve full names for departure and arrival airports
//                String mappingQuery = "SELECT full_name FROM airport_mapping WHERE iata_code = ?";
//                String fromFullName = null;
//                String toFullName = null;
//
//                try (PreparedStatement mappingStmt = conn.prepareStatement(mappingQuery)) {
//                    // Get full name for 'from' airport
//                    mappingStmt.setString(1, fromIata);
//                    try (ResultSet rs = mappingStmt.executeQuery()) {
//                        if (rs.next()) {
//                            fromFullName = rs.getString("full_name");
//                        }
//                    }
//
//                    // Get full name for 'to' airport
//                    mappingStmt.setString(1, toIata);
//                    try (ResultSet rs = mappingStmt.executeQuery()) {
//                        if (rs.next()) {
//                            toFullName = rs.getString("full_name");
//                        }
//                    }
//                }
//
//                // Check if full names were found
//                if (fromFullName == null || toFullName == null) {
//                    request.setAttribute("errorMessage", "Airport names could not be resolved.");
//                    request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
//                    return;
//                }
//
//                // Prepare SQL statement with parameters
//                String sql = "SELECT * FROM flights1 WHERE departure_airport = ? AND arrival_airport = ?";
//                try (PreparedStatement pre = conn.prepareStatement(sql)) {
//                    pre.setString(1, fromFullName);
//                    pre.setString(2, toFullName);
//
//                    try (ResultSet rs = pre.executeQuery()) {
//                        while (rs.next()) {
//                            Flight flight = new Flight();
//                            flight.setId(rs.getInt("id"));
//                            flight.setFlightNumber(rs.getString("flight_number"));
//                            flight.setAirline(rs.getString("airline"));
//                            flight.setDepartureAirport(rs.getString("departure_airport"));
//                            flight.setArrivalAirport(rs.getString("arrival_airport"));
//                            flight.setDuration(rs.getInt("duration"));
//                            flight.setAirplane(rs.getString("airplane"));
//                            flight.setLegroom(rs.getString("legroom"));
//                            flight.setExtensions(rs.getString("extensions"));
//                            flight.setTravelClass(rs.getString("travel_class"));
//                            flight.setLayoversDuration(rs.getInt("layovers_duration"));
//                            flight.setCarbonEmissions(rs.getFloat("carbon_emissions"));
//
//
//                            flightList.add(flight);
//                        }
//                    }
//                }
//            }
//        } catch (Exception e) {
//            e.printStackTrace();
//            request.setAttribute("errorMessage", "Error retrieving flight data: " + e.getMessage());
//            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
//            return;
//        }
//
//        System.out.println("Number of flights: " + flightList.size()); // Debug statement
//
//        request.setAttribute("flightList", flightList);
//        request.getRequestDispatcher("bookFlight/dataFromdb.jsp").forward(request, response);
//    }
//}



package com.flight.flight_booking_management_system.Admin;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/fetchDataToTable")
public class FetchDataToTable extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.out.println("Servlet called"); // Debug statement

        // Retrieve parameters
        String fromIata = request.getParameter("from");
        String toIata = request.getParameter("to");

        HttpSession session = request.getSession();
        session.setAttribute("lastSearchFrom", fromIata);
        session.setAttribute("lastSearchTo", toIata);

        // Database connection settings
        String url = "jdbc:mysql://localhost:3306/flightregd";
        String user = "Java-Project";
        String password = "root@localhost";

        List<Flight> flightList = new ArrayList<>();

        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Load MySQL driver
            try (Connection conn = DriverManager.getConnection(url, user, password)) {

                // Prepare SQL statement with parameters
                String sql = "SELECT * FROM flights1 WHERE departure_id = ? AND arrival_id = ?";
                try (PreparedStatement pre = conn.prepareStatement(sql)) {
                    pre.setString(1, fromIata);
                    pre.setString(2, toIata);

                    try (ResultSet rs = pre.executeQuery()) {
                        while (rs.next()) {
                            Flight flight = new Flight();
                            flight.setId(rs.getInt("id"));
                            flight.setDepartureName(rs.getString("departure_name"));
                            flight.setDepartureId(rs.getString("departure_id"));
                            flight.setDepartureTime(rs.getTimestamp("departure_time"));
                            flight.setArrivalName(rs.getString("arrival_name"));
                            flight.setArrivalId(rs.getString("arrival_id"));
                            flight.setArrivalTime(rs.getTimestamp("arrival_time"));
                            flight.setDuration(rs.getInt("duration"));
                            flight.setAirplane(rs.getString("airplane"));
                            flight.setAirline(rs.getString("airline"));
                            flight.setAirlineLogo(rs.getString("airline_logo"));
                            flight.setTravelClass(rs.getString("travel_class"));
                            flight.setFlightNumber(rs.getString("flight_number"));
                            flight.setLegroom(rs.getString("legroom"));
                            flight.setExtensions(rs.getString("extensions"));
                            flight.setTotalDuration(rs.getInt("total_duration"));
                            flight.setCarbonEmissions(rs.getFloat("carbon_emissions"));
                            flight.setPrice(rs.getInt("price"));
                            flight.setType(rs.getString("type"));
                            flight.setBookingToken(rs.getString("booking_token"));

                            flightList.add(flight);
                        }
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving flight data: " + e.getMessage());
            request.getRequestDispatcher("/errorPage.jsp").forward(request, response);
            return;
        }

        System.out.println("Number of flights: " + flightList.size()); // Debug statement

        request.setAttribute("flightList", flightList);
        request.getRequestDispatcher("bookFlight/dataFromdb.jsp").forward(request, response);
    }
}