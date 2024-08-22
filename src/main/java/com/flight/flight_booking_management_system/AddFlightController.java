package com.flight.flight_booking_management_system;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.rmi.ServerException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/AddFlightController")
public class AddFlightController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/flightregd";
    private static final String DB_USER = "Java-Project";
    private static final String DB_PASSWORD = "root@localhost";

    protected void doPost(HttpServletRequest request , HttpServletResponse response) throws ServerException, IOException {
        String flightNumber = request.getParameter("flightNumber");
        String airline = request.getParameter("airline");
        String departureCity = request.getParameter("departureCity");
        String arrivalCity = request.getParameter("arrivalCity");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String priceStr = request.getParameter("price");


        // Convert price to double
        double price = 0;
        try {
            price = Double.parseDouble(priceStr);
        } catch (NumberFormatException e) {
            System.out.println("Invalid price format: " + e.getMessage());
            response.sendRedirect("addFlightError.jsp");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("Driver loaded successfully");

            conn = DriverManager.getConnection(DB_URL , DB_USER , DB_PASSWORD);
            System.out.println("Database connection established");


            String sql = "INSERT INTO flights(flight_number, airline, departure_city, arrival_city, departure_time, arrival_time, price)"
                   + "VALUES (?,?,?,?,?,?,?)";


            stmt = conn.prepareStatement(sql);
            stmt.setString(1, flightNumber);
            stmt.setString(2, airline);
            stmt.setString(3, departureCity);
            stmt.setString(4, arrivalCity);
            stmt.setString(5, departureTime);
            stmt.setString(6, arrivalTime);
            stmt.setDouble(7, price);

            int rowsInserted = stmt.executeUpdate();

            if(rowsInserted > 0) {
                System.out.println("Flight added successfully");
                response.sendRedirect("addFlightSuccess.jsp");
            } else {
                System.out.println("Failed to add flight");
                response.sendRedirect("addFlightError.jsp");
            }
        } catch (SQLException e) {
            System.out.println("SQL Exception: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("addFlightError.jsp");
        } catch (ClassNotFoundException e) {
            System.out.println("Class Not Found Exception: " + e.getMessage());
            e.printStackTrace();
            response.sendRedirect("addFlightError.jsp");
        }finally  {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            }catch (SQLException e){
                e.printStackTrace();
            }
        }
    }
}
