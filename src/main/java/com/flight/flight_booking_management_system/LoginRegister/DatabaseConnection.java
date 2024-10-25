package com.flight.flight_booking_management_system.LoginRegister;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DatabaseConnection {
    // JDBC URL, username, and password
    private static final String URL = "jdbc:mysql://localhost:3306/flightregd";
    private static final String USERNAME = "Java-Project";
    private static final String PASSWORD = "root@localhost";

    // Method to establish a connection
    public static Connection getConnection() {
        Connection connection = null;
        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection
            connection = DriverManager.getConnection(URL, USERNAME, PASSWORD);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
