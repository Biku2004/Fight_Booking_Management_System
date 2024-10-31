package com.flight.flight_booking_management_system.AddFlightServlet;

import com.flight.flight_booking_management_system.AdminFunctions.DeleteFlight;
import com.flight.flight_booking_management_system.AdminFunctions.ModifyFlight;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddFlightDAO {
    // Database connection parameters
    private static final String DB_URL = "jdbc:mysql://localhost:3306/flightregd";
    private static final String DB_USER = "Java-Project";
    private static final String DB_PASSWORD = "root@localhost";

    // Method to establish a database connection
    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Add Method for AddFlight
    public boolean addFlight(AddFlight flight) {
        String sql = "INSERT INTO flights1 (departure_name, " +
                "departure_id, " +
                "departure_time, " +
                "arrival_name," +
                " arrival_id, " +
                "arrival_time, " +
                "duration," +
                " airplane, " +
                "airline, " +
                "airline_logo," +
                " travel_class, " +
                "flight_number," +
                " legroom, " +
                "extensions," +
                " total_duration, " +
                "carbon_emissions," +
                " price, " +
                "type, " +
                "booking_token, " +
                "layovers) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Set values for the prepared statement
            preparedStatement.setString(1, flight.getDepartureName());
            preparedStatement.setString(2, flight.getDepartureId());
            preparedStatement.setString(3, flight.getDepartureTime());
            preparedStatement.setString(4, flight.getArrivalName());
            preparedStatement.setString(5, flight.getArrivalId());
            preparedStatement.setString(6, flight.getArrivalTime());
            preparedStatement.setInt(7, flight.getDuration());
            preparedStatement.setString(8, flight.getAirplane());
            preparedStatement.setString(9, flight.getAirline());
            preparedStatement.setString(10, flight.getAirlineLogo());
            preparedStatement.setString(11, flight.getTravelClass());
            preparedStatement.setString(12, flight.getFlightNumber());
            preparedStatement.setString(13, flight.getLegroom());
            preparedStatement.setString(14, flight.getExtensions());
            preparedStatement.setInt(15, flight.getTotalDuration());
            preparedStatement.setDouble(16, flight.getCarbonEmissions());
            preparedStatement.setDouble(17, flight.getPrice());
            preparedStatement.setString(18, flight.getType());
            preparedStatement.setString(19, flight.getBookingToken());
            preparedStatement.setString(20, flight.getLayovers());


            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Additional methods for update, delete, and fetch flights can be added here
    public boolean modifyFlight(ModifyFlight flight) {
        String sql = "UPDATE flights SET airline = ?, departure_city = ?, arrival_city = ?, departure_time = ?, arrival_time = ?, price = ? WHERE flight_number = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, flight.getAirline());
            preparedStatement.setString(2, flight.getDepartureCity());
            preparedStatement.setString(3, flight.getArrivalCity());
            preparedStatement.setString(4, flight.getDepartureTime());
            preparedStatement.setString(5, flight.getArrivalTime());
            preparedStatement.setDouble(6, flight.getPrice());
            preparedStatement.setString(7, flight.getFlightNumber());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    // Method to delete a flight from the database
    public boolean deleteFlight(DeleteFlight flight) {
        String sql = "DELETE FROM flights1 WHERE flight_number = ? AND departure_time = ? AND arrival_time = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, flight.getFlightNumber());
            preparedStatement.setString(2, flight.getDepartureTime());
            preparedStatement.setString(3, flight.getArrivalTime());

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
