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

    // Method to add a flight to the database
    // Method to add a flight to the database with the updated structure
    public boolean addFlight(AddFlight flight) {
        String sql = "INSERT INTO flights (flight_number, airline, departure_airport, arrival_airport, duration, airplane, legroom, extensions, travel_class, layovers_duration, carbon_emissions, departure_time, arrival_time, price) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Set values for the prepared statement
            preparedStatement.setString(1, flight.getFlightNumber());
            preparedStatement.setString(2, flight.getAirline());
            preparedStatement.setString(3, flight.getDepartureAirport());
            preparedStatement.setString(4, flight.getArrivalAirport());
            preparedStatement.setInt(5, flight.getDuration());
            preparedStatement.setString(6, flight.getAirplane());
            preparedStatement.setString(7, flight.getLegroom());
            preparedStatement.setString(8, flight.getExtensions());
            preparedStatement.setString(9, flight.getTravelClass());
            preparedStatement.setInt(10, flight.getLayoversDuration());
            preparedStatement.setDouble(11, flight.getCarbonEmissions());
            preparedStatement.setString(12, flight.getDepartureTime());
            preparedStatement.setString(13, flight.getArrivalTime());
            preparedStatement.setDouble(14, flight.getPrice());

            // Execute update
            int rowsInserted = preparedStatement.executeUpdate();
            return rowsInserted > 0; // Return true if the flight was added successfully
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
        String sql = "DELETE FROM flights WHERE flight_number = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, flight.getFlightNumber());

            int rowsDeleted = preparedStatement.executeUpdate();
            return rowsDeleted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

}
