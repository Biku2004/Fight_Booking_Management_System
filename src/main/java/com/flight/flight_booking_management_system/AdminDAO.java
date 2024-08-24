package com.flight.flight_booking_management_system;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AdminDAO {
    // Database connection parameters
    private String jdbcURL = "jdbc:mysql://localhost:3306/flightregd"; // Replace with your DB URL
    private String jdbcUsername = "Java-Project"; // Replace with your DB username
    private String jdbcPassword = "root@localhost"; // Replace with your DB password

    // SQL query to insert a new admin
    private static final String INSERT_ADMIN_SQL =  "INSERT INTO admin (First_Name, Last_Name, Email, Password, Phone_Number, Country, Gender,Profile_Photo_Path,DOB) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    public AdminDAO() {}

    // Establishes a connection to the database
    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            // Load the JDBC driver (optional for newer JDBC versions)
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish the connection
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            // Handle errors for Class.forName
            e.printStackTrace();
        }
        return connection;
    }

    // Inserts a new admin record into the database
    public void registerAdmin(Admin admin) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ADMIN_SQL)) {
            preparedStatement.setString(1, admin.getFirstName());
            preparedStatement.setString(2, admin.getLastName());
            preparedStatement.setString(3, admin.getEmail());
            preparedStatement.setString(4, admin.getPassword());
            preparedStatement.setString(5, admin.getPhoneNumber());
            preparedStatement.setString(6, admin.getNationality());
            preparedStatement.setString(7, admin.getGender());
            preparedStatement.setString(8, admin.getProfilePhotoPath());
            preparedStatement.setString(9, admin.getDateOfBirth());

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            printSQLException(e);
            throw e;
        }
    }

    // Utility method to print SQL exceptions
    private void printSQLException(SQLException ex) {
        for (Throwable e : ex) {
            if (e instanceof SQLException) {
                e.printStackTrace(System.err);
                System.err.println("SQLState: " + ((SQLException) e).getSQLState());
                System.err.println("Error Code: " + ((SQLException) e).getErrorCode());
                System.err.println("Message: " + e.getMessage());
                Throwable t = ex.getCause();
                while (t != null) {
                    System.out.println("Cause: " + t);
                    t = t.getCause();
                }
            }
        }
    }
}
