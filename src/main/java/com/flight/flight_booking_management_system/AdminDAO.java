package com.flight.flight_booking_management_system;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
            Class.forName ( "com.mysql.cj.jdbc.Driver" );
            connection = DriverManager.getConnection ( jdbcURL , jdbcUsername , jdbcPassword );
        } catch (ClassNotFoundException e) {
            e.printStackTrace ( );
        }
        return connection;
    }

    // Inserts a new admin record into the database
    public void registerAdmin(Admin admin) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;

        try {
            connection = getConnection ( );
            preparedStatement = connection.prepareStatement ( INSERT_ADMIN_SQL );
            preparedStatement.setString ( 1 , admin.getFirstName ( ) );
            preparedStatement.setString ( 2 , admin.getLastName ( ) );
            preparedStatement.setString ( 3 , admin.getEmail ( ) );
            preparedStatement.setString ( 4 , admin.getPassword ( ) );
            preparedStatement.setString ( 5 , admin.getPhoneNumber ( ) );
            preparedStatement.setString ( 6 , admin.getNationality ( ) );
            preparedStatement.setString ( 7 , admin.getGender ( ) );
            preparedStatement.setString ( 8 , admin.getProfilePhotoPath ( ) );
            preparedStatement.setString ( 9 , admin.getDateOfBirth ( ) );

            preparedStatement.executeUpdate ( );
        } catch (SQLException e) {
            e.printStackTrace ( );

        } finally {
            try {
                if (preparedStatement != null) {
                    preparedStatement.close ( );
                }
                if (connection != null) {
                    connection.close ( );
                }
            } catch (SQLException e) {
                e.printStackTrace ( );
            }
        }
    }

    // Method to delete an admin based on email
    public boolean deleteAdmin(Admin admin) throws SQLException {
        String sql = "DELETE FROM admins WHERE email = ?";
        boolean rowDeleted = false;

        DatabaseMetaData DatabaseUtil = null;
        try (Connection connection = DatabaseUtil.getConnection(); // Make sure to manage your database connections correctly
             PreparedStatement preparedStatement = connection.prepareStatement(sql)) {
            preparedStatement.setString(1, admin.getEmail());

            int affectedRows = preparedStatement.executeUpdate();
            rowDeleted = affectedRows > 0;  // Check if any row was affected (deleted)
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;  // Re-throw exception to handle in the servlet
        }

        return rowDeleted;
    }

    public boolean updateAdmin(Admin admin) throws SQLException {
        String query = "UPDATE admin SET First_Name = ?, Last_Name = ?, Phone_Number = ?, Country = ?, Gender = ?, Profile_Photo_Path = ?, DOB = ? WHERE Email = ?";
        boolean rowUpdated = false;

        try (Connection conn = getConnection();
             PreparedStatement pstm = conn.prepareStatement(query)) {

            pstm.setString(1, admin.getFirstName());
            pstm.setString(2, admin.getLastName());
            pstm.setString(3, admin.getPhoneNumber());
            pstm.setString(4, admin.getNationality());
            pstm.setString(5, admin.getGender());
            pstm.setString(6, admin.getProfilePhotoPath());
            pstm.setString(7, admin.getDateOfBirth());
            pstm.setString(8, admin.getEmail());

            rowUpdated = pstm.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();

        }

        return rowUpdated;
    }
    public List<Admin> getAllAdmins() throws SQLException {
        List<Admin> admins = new ArrayList<> ();

        // Database query logic to fetch all admins
        String query = "SELECT * FROM admin";

        try (Connection conn = getConnection();
             PreparedStatement pstm = conn.prepareStatement(query);
             ResultSet rs = pstm.executeQuery()) {

            while (rs.next()) {
                Admin admin = new Admin();
                admin.setFirstName(rs.getString("First_Name"));
                admin.setLastName(rs.getString("Last_Name"));
                admin.setEmail(rs.getString("Email"));
                admin.setPhoneNumber(rs.getString("Phone_Number"));
                admin.setNationality(rs.getString("Country"));
                admin.setGender(rs.getString("Gender"));
                admin.setProfilePhotoPath(rs.getString("Profile_Photo_Path"));
                admin.setDateOfBirth(rs.getString("DOB"));

                admins.add(admin);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw e;
        }

        return admins;
    }


}
