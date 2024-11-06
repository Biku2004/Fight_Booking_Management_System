package com.flight.flight_booking_management_system.AdminFunctions;

//package com.flight.com.flight.flight_booking_management_system.AdminFunctions;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ModifyFlightDAO {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/flightregd";
    private static final String DB_USER = "Java-Project";
    private static final String DB_PASSWORD = "root@localhost";

    protected static Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }

    public boolean modifyFlight(ModifyFlight flight) {
        String sql = "UPDATE flights1 SET airline = ?, departure_name = ?, arrival_name = ?, departure_time = ?, arrival_time = ?, price = ? WHERE flight_number = ? AND departure_time = ?";
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, flight.getAirline());
            preparedStatement.setString(2, flight.getDepartureName());
            preparedStatement.setString(3, flight.getArrivalName());
            preparedStatement.setTimestamp(4, Timestamp.valueOf(flight.getDeparture_time()));
            preparedStatement.setTimestamp(5, Timestamp.valueOf(flight.getArrivalTime()));
            preparedStatement.setDouble(6, flight.getPrice());
            preparedStatement.setString(7, flight.getFlight_number());
            preparedStatement.setTimestamp(8, Timestamp.valueOf(flight.getDeparture_time()));

            int rowsUpdated = preparedStatement.executeUpdate();
            return rowsUpdated > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    public List<ModifyFlight> getFlightDetailForModify(String flightNumber, String departureTime) {
        List<ModifyFlight> flights = new ArrayList<>();
        String sql = "SELECT * FROM flights1 WHERE flight_number = ? AND departure_time = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {

            preparedStatement.setString(1, flightNumber);
            preparedStatement.setString(2, departureTime);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                ModifyFlight flight = new ModifyFlight(
                        resultSet.getString("flight_number"),
                        resultSet.getString("airline"),
                        resultSet.getString("departure_name"),
                        resultSet.getString("arrival_name"),
                        resultSet.getTimestamp("departure_time").toString(),
                        resultSet.getTimestamp("arrival_time").toString(),
                        resultSet.getDouble("price")
                );
                flights.add(flight);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flights;
    }


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
                        resultSet.getTimestamp("departure_time").toString(),
                        resultSet.getTimestamp("arrival_time").toString(),
                        resultSet.getDouble("price")
                );
                flights.add(flight);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flights;
    }
}