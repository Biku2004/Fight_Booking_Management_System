package com.flight.flight_booking_management_system.AddFlightServlet;

import com.flight.flight_booking_management_system.AdminFunctions.DeleteFlight;
import com.flight.flight_booking_management_system.AdminFunctions.ModifyFlight;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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

    // Method to add a flight
    public boolean addFlight(AddFlight flight) {
        String sql = "INSERT INTO flights1 (departure_name, departure_id, departure_time, arrival_name, arrival_id, arrival_time, duration, airplane, airline, airline_logo, travel_class, flight_number, legroom, extensions, total_duration, carbon_emissions, price, type, booking_token, layovers) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            // Set values for the prepared statement
            preparedStatement.setString(1, flight.getDepartureName());
            preparedStatement.setString(2, flight.getDepartureId());
            //null check
            if (flight.getDeparture_time() == null || flight.getDeparture_time().isEmpty()) {
                throw new IllegalArgumentException("Departure time cannot be null or empty");
            }
            preparedStatement.setTimestamp(3, Timestamp.valueOf(flight.getDeparture_time()));// Adjusted for Timestamp
            preparedStatement.setString(4, flight.getArrivalName());
            preparedStatement.setString(5, flight.getArrivalId());

            // Ensure arrival time is not null or empty
            if (flight.getArrivalTime() == null || flight.getArrivalTime().isEmpty()) {
                throw new IllegalArgumentException("Arrival time cannot be null or empty");
            }
            preparedStatement.setTimestamp(6, Timestamp.valueOf(flight.getArrivalTime())); // Adjusted for Timestamp
            preparedStatement.setInt(7, flight.getDuration());
            preparedStatement.setString(8, flight.getAirplane());
            preparedStatement.setString(9, flight.getAirline());
            preparedStatement.setString(10, flight.getAirlineLogo());
            preparedStatement.setString(11, flight.getTravelClass());
            preparedStatement.setString(12, flight.getFlight_number());
            preparedStatement.setString(13, flight.getLegroom());
            preparedStatement.setString(14, flight.getExtensions());
            preparedStatement.setInt(15, flight.getTotalDuration());
            preparedStatement.setFloat(16, (float) flight.getCarbonEmissions()); // Adjusted for float
            preparedStatement.setInt(17, (int)flight.getPrice());
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

    // Method to modify a flight
    public boolean modifyFlight(ModifyFlight flight) {
        String sql = "UPDATE flights1 SET airline = ?, departure_name = ?, arrival_name = ?, departure_time = ?, arrival_time = ?, price = ? WHERE flight_number = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, flight.getAirline());
            preparedStatement.setString(2, flight.getDepartureName()); // Assuming this is the departure name
            preparedStatement.setString(3, flight.getArrivalName()); // Assuming this is the arrival name
            preparedStatement.setTimestamp(4, Timestamp.valueOf(flight.getDepartureTime())); // Adjusted for Timestamp
            preparedStatement.setTimestamp(5, Timestamp.valueOf(flight.getArrivalTime())); // Adjusted for Timestamp
            preparedStatement.setDouble(6, flight.getPrice());
            preparedStatement.setString(7, flight.getFlightNumber());

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //Modify Flight form database
    public List<ModifyFlight> getFlightsByNumber(String flightNumber) {
        List<ModifyFlight> flights = new ArrayList<>();
        String sql = "SELECT * FROM flights1 WHERE flight_number = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, flightNumber);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ModifyFlight flight = new ModifyFlight(
                        resultSet.getString("flight_number"),
                        resultSet.getString("airline"),
                        resultSet.getString("departure_name"),
                        resultSet.getString("arrival_name"),
                        resultSet.getTimestamp("departure_time").toString(), // Convert to String if needed
                        resultSet.getTimestamp("arrival_time").toString(),   // Convert to String if needed
                        resultSet.getDouble("price")
                );
                flights.add(flight);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flights;
    }


    public List<DeleteFlight> getFlightsByFlightNumber(String flightNumber) {
        List<DeleteFlight> flights = new ArrayList<>();
        String sql = "SELECT flight_number, departure_time, arrival_time FROM flights1 WHERE flight_number = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, flightNumber);
            ResultSet resultSet = preparedStatement.executeQuery();
            while (resultSet.next()) {
                String departureDateTime = resultSet.getString("departure_time");
                String arrivalDateTime = resultSet.getString("arrival_time");
                flights.add(new DeleteFlight(flightNumber, departureDateTime, arrivalDateTime));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flights;
    }

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