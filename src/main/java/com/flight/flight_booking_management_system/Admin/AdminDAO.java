package com.flight.flight_booking_management_system.Admin;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AdminDAO {

    // Database connection parameters
    private String jdbcURL = "jdbc:mysql://localhost:3306/flightregd";
    private String jdbcUsername = "Java-Project";
    private String jdbcPassword = "root@localhost";

    // SQL queries
    private static final String INSERT_ADMIN_SQL = "INSERT INTO register (FirstName, LastName, Email, Password, Phone, Nationality, Gender, DateOfBirth,ProfilePhoto,UserType) " + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?,'admin')";

    private static final String DELETE_ADMIN_SQL = "DELETE FROM register WHERE Email = ? and UserType = 'admin'";
    private static final String UPDATE_ADMIN_SQL = "UPDATE register SET FirstName = ?, LastName = ?, Phone = ?, Nationality = ?, Gender = ?, DateOfBirth = ? WHERE Email = ? and UserType = 'admin'";
    private static final String SELECT_ADMIN_BY_EMAIL = "SELECT * FROM register WHERE Email = ? AND UserType = 'admin'";
    private static final String SELECT_ALL_ADMINS_SQL = "SELECT FirstName, LastName, Email, Phone, Nationality, Gender, DateOfBirth FROM register WHERE UserType = 'admin'";

    // Establishes a connection to the database
    protected Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            Class.forName ( "com.mysql.cj.jdbc.Driver" );
            connection = DriverManager.getConnection ( jdbcURL , jdbcUsername , jdbcPassword );
        } catch (ClassNotFoundException e) {
            e.printStackTrace ( );
            throw new SQLException ( "Database driver not found" , e );
        }
        return connection;
    }

    // Inserts a new admin record into the database
    public void registerAdmin(Admin admin) throws SQLException {
        try (Connection connection = getConnection ( ); PreparedStatement preparedStatement = connection.prepareStatement ( INSERT_ADMIN_SQL )) {
            preparedStatement.setString ( 1 , admin.getFirstName ( ) );
            preparedStatement.setString ( 2 , admin.getLastName ( ) );
            preparedStatement.setString ( 3 , admin.getEmail ( ) );
            preparedStatement.setString ( 4 , admin.getPassword ( ) );
            preparedStatement.setString ( 5 , admin.getPhoneNumber ( ) );
            preparedStatement.setString ( 6 , admin.getNationality ( ) );
            preparedStatement.setString ( 7 , admin.getGender ( ) );
            preparedStatement.setString ( 9 , admin.getProfilePhotoPath ( ) );
            preparedStatement.setString ( 8 , admin.getDateOfBirth ( ) );

            preparedStatement.executeUpdate ( );
        } catch (SQLException e) {
            e.printStackTrace ( );
        }
    }

    // Deletes an admin based on email
    public boolean deleteAdmin(String email) throws SQLException {
        boolean rowDeleted = false;

        try (Connection connection = getConnection ( ); PreparedStatement preparedStatement = connection.prepareStatement ( DELETE_ADMIN_SQL )) {
            preparedStatement.setString ( 1 , email );

            int affectedRows = preparedStatement.executeUpdate ( );
            rowDeleted = affectedRows > 0;  // Check if any row was affected (deleted)
        } catch (SQLException e) {
            e.printStackTrace ( );
            throw e;  // Re-throw exception to handle in the servlet
        }

        return rowDeleted;
    }

    // Updates an admin record
    public boolean updateAdmin(Admin admin) throws SQLException {
        boolean rowUpdated = false;

        try (Connection conn = getConnection ( ); PreparedStatement pstm = conn.prepareStatement ( UPDATE_ADMIN_SQL )) {
            pstm.setString ( 1 , admin.getFirstName ( ) );
            pstm.setString ( 2 , admin.getLastName ( ) );
            pstm.setString ( 3 , admin.getPhoneNumber ( ) );
            pstm.setString ( 4 , admin.getNationality ( ) );
            pstm.setString ( 5 , admin.getGender ( ) );
            pstm.setString ( 6 , admin.getDateOfBirth ( ) );
            pstm.setString ( 7 , admin.getEmail ( ) );

            rowUpdated = pstm.executeUpdate ( ) > 0;
        } catch (SQLException e) {
            e.printStackTrace ( );
            throw e; // Re-throw to handle in the servlet
        }

        return rowUpdated;
    }

    public Admin getAdminByEmail(String email) throws SQLException {
        Admin admin = null;
        try (Connection conn = getConnection ( ); PreparedStatement pstm = conn.prepareStatement ( SELECT_ADMIN_BY_EMAIL )) {
            pstm.setString ( 1 , email ); // Set the email parameter correctly
            ResultSet rs = pstm.executeQuery ( );

            if (rs.next ( )) {
                admin = new Admin ( );
                admin.setEmail ( rs.getString ( "Email" ) );
                admin.setFirstName ( rs.getString ( "FirstName" ) );
                admin.setLastName ( rs.getString ( "LastName" ) );
                admin.setPhoneNumber ( rs.getString ( "Phone" ) );
                admin.setNationality ( rs.getString ( "Nationality" ) );
                admin.setGender ( rs.getString ( "Gender" ) );
                admin.setDateOfBirth ( rs.getString ( "DateOfBirth" ) );
            }
        } catch (SQLException e) {
            e.printStackTrace ( );
            throw e; // Rethrow to handle in the servlet
        }
        return admin;
    }


    // Retrieves all admin records
    public List<Admin> getAllAdmins() throws SQLException {
        List<Admin> admins = new ArrayList<> ( );
        try (Connection conn = getConnection ( ); PreparedStatement pstm = conn.prepareStatement ( SELECT_ALL_ADMINS_SQL ); ResultSet rs = pstm.executeQuery ( )) {

            while (rs.next ( )) {
                Admin admin = new Admin ( );
                admin.setFirstName ( rs.getString ( "FirstName" ) );
                admin.setLastName ( rs.getString ( "LastName" ) );
                admin.setEmail ( rs.getString ( "Email" ) );
                admin.setPhoneNumber ( rs.getString ( "Phone" ) );
                admin.setNationality ( rs.getString ( "Nationality" ) );
                admin.setGender ( rs.getString ( "Gender" ) );
                admin.setDateOfBirth ( rs.getString ( "DateOfBirth" ) );
                admins.add ( admin );
            }
        } catch (SQLException e) {
            e.printStackTrace ( );
            throw e;
        }
        return admins;
    }


}

