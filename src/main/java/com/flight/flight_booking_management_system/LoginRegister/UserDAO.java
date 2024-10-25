// UserDAO.java
package com.flight.flight_booking_management_system.LoginRegister;

import java.sql.*;
import java.util.Arrays;

public class UserDAO {
    private Connection connection;

    public UserDAO(Connection connection) {
        this.connection = connection;
    }

    // Fetch user by email
    public User getUserByEmail(String email) throws SQLException {
        String sql = "SELECT * FROM register WHERE Email = ?";
        User user = null;

        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, email);
            ResultSet resultSet = statement.executeQuery();

            if (resultSet.next()) {
                user = new User(
                        resultSet.getInt("ID"),
                        resultSet.getString("FirstName"),
                        resultSet.getString("LastName"),
                        resultSet.getString("Email"),
                        resultSet.getString("Password"),
                        resultSet.getString("Phone"),
                        resultSet.getString("PassportNumber"),
                        resultSet.getString("Nationality"),
                        resultSet.getString("Gender"),
                        resultSet.getString("DateOfBirth"),
                        resultSet.getBlob("ProfilePhoto")
                );
            }
        }
        return user;
    }

    // Update user method
    public void updateUser(User user) throws SQLException {
        String sql = "UPDATE register SET FirstName = ?, LastName = ?, Phone = ?, PassportNumber = ?, Nationality = ?, Gender = ?, DateOfBirth = ?, ProfilePhoto = ? WHERE Email = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, user.getFirstName());
            statement.setString(2, user.getLastName());
            statement.setString(3, user.getPhone());
            statement.setString(4, user.getPassportNumber());
            statement.setString(5, user.getNationality());
            statement.setString(6, user.getGender());
            statement.setString(7, user.getDateOfBirth());
            statement.setBlob(8, user.getProfilePhoto());
            statement.setString(9, user.getEmail());

            // Logging the SQL query and parameters for debugging
            System.out.println("Executing SQL: " + sql);
            System.out.println("Parameters: " + Arrays.toString(new Object[]{
                    user.getFirstName(),
                    user.getLastName(),
                    user.getPhone(),
                    user.getPassportNumber(),
                    user.getNationality(),
                    user.getGender(),
                    user.getDateOfBirth(),
                    user.getProfilePhoto(),
                    user.getEmail()
            }));

            int rowsAffected = statement.executeUpdate();
            if (rowsAffected == 0) {
                throw new SQLException("Update failed, no rows affected.");
            }
        }
    }
}
