package com.flight.flight_booking_management_system.ViewPassenger;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/bookFlight1")
public class BookFlightServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/flightregd";
    private static final String DB_USER = "Java-Project";
    private static final String DB_PASSWORD = "root@localhost";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightNumber = request.getParameter("flightNumber");

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String sql = "SELECT * FROM flights1 WHERE flight_number = ?";
            try (PreparedStatement stmt = conn.prepareStatement(sql)) {
                stmt.setString(1, flightNumber);
                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        request.setAttribute("flightNumber", rs.getString("flight_number"));
                        request.setAttribute("airline", rs.getString("airline"));
                        request.setAttribute("departure", rs.getString("departure_name"));
                        request.setAttribute("arrival", rs.getString("arrival_name"));
                        request.setAttribute("departureTime", rs.getString("departure_time"));
                        request.setAttribute("arrivalTime", rs.getString("arrival_time"));
                        request.setAttribute("airplane", rs.getString("airplane"));
                        request.setAttribute("legroom", rs.getString("legroom"));
                        request.setAttribute("extensions", rs.getString("extensions"));
                        request.setAttribute("travelClass", rs.getString("travel_class"));
                        request.setAttribute("duration", String.valueOf(rs.getInt("duration")));
                        request.setAttribute("layovers", rs.getString("layovers"));
                        request.setAttribute("price", String.valueOf(rs.getDouble("price")));
                        request.setAttribute("carbonEmissions", String.valueOf(rs.getDouble("carbon_emissions")));

                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        request.getRequestDispatcher("bookFlight/bookFlight.jsp").forward(request, response);
    }
}