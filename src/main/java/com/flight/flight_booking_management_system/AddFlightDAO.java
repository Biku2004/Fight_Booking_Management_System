package com.flight.flight_booking_management_system;

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

    // Method to add a flight to the database
    public boolean addFlight(AddFlight flight) {
        String sql = "INSERT INTO flights (flight_number, airline, departure_city, arrival_city, departure_time, arrival_time, price) VALUES (?, ?, ?, ?, ?, ?, ?)";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, flight.getFlightNumber());
            preparedStatement.setString(2, flight.getAirline());
            preparedStatement.setString(3, flight.getDepartureCity());
            preparedStatement.setString(4, flight.getArrivalCity());
            preparedStatement.setString(5, flight.getDepartureTime());
            preparedStatement.setString(6, flight.getArrivalTime());
            preparedStatement.setDouble(7, flight.getPrice());

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
}
