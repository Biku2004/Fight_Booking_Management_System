package com.flight.flight_booking_management_system;

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

@WebServlet("/fetchDataToTable")
public class FetchDataToTable extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Flight> flightList = new ArrayList<>();

        // Database connection settings
        String url = "jdbc:mysql://localhost:3306/flightregd";
        String user = "Java-Project";
        String password = "root@localhost";

        try (Connection conn = DriverManager.getConnection(url, user, password);
             PreparedStatement pstmt = conn.prepareStatement("SELECT * FROM flights");
             ResultSet rs = pstmt.executeQuery()) {

            while (rs.next()) {
                Flight flight = new Flight();
                flight.setId(rs.getInt("id"));
                flight.setFlightNumber(rs.getString("flight_number"));
                flight.setAirline(rs.getString("airline"));
                flight.setDepartureAirport(rs.getString("departure_airport"));
                flight.setArrivalAirport(rs.getString("arrival_airport"));
                flight.setDuration(rs.getInt("duration"));
                flight.setAirplane(rs.getString("airplane"));
                flight.setLegroom(rs.getString("legroom"));
                flight.setExtensions(rs.getString("extensions"));
                flight.setTravelClass(rs.getString("travel_class"));
                flight.setLayoversDuration(rs.getInt("layovers_duration"));
                flight.setCarbonEmissions(rs.getFloat("carbon_emissions"));
                flight.setCreatedAt(rs.getTimestamp("created_at"));

                flightList.add(flight);
            }

        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "Error retrieving flight data.");
        }

        request.setAttribute("flightList", flightList);
        request.getRequestDispatcher("dataFromdb.jsp").forward(request, response);
    }
}
