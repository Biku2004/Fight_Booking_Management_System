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
    private static final String INSERT_ADMIN_SQL =
            "INSERT INTO admin (First_Name, Last_Name, Email, Password, Phone_Number, Country, Gender, Profile_Photo_Path, DOB) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

    // Establishes a connection to the database
    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Inserts a new admin record into the database
    public void registerAdmin(Admin admin) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = getConnection();
            preparedStatement = connection.prepareStatement(INSERT_ADMIN_SQL);
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
            e.printStackTrace();
            throw e;
        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close();
                }
                if (connection != null) {
                    connection.close();
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
    public void updateAdmin(Admin admin) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        
    }
}
