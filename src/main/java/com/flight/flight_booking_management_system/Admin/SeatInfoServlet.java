
package com.flight.flight_booking_management_system.Admin;
import com.google.gson.Gson;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
@WebServlet("/SeatInfoServlet")
public class SeatInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightNumber = request.getParameter("flightNumber");
        System.out.println("Received flight number: " + flightNumber);
        String dbUrl = "jdbc:mysql://localhost:3306/flightregd";
        String dbUser = "Java-Project";
        String dbPassword = "root@localhost";
        List<String> occupiedSeats = new ArrayList<>();
        String query = "SELECT seat FROM bookings WHERE flight_number = ? UNION SELECT seat FROM passengers WHERE booking_id IN (SELECT booking_id FROM bookings WHERE flight_number = ?)";
        System.out.println("Query: " + query);
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            System.out.println("MySQL JDBC Driver loaded successfully.");
            try (Connection con = DriverManager.getConnection(dbUrl, dbUser, dbPassword);
                 PreparedStatement stmt = con.prepareStatement(query)) {
                System.out.println("Database connection established.");
                stmt.setString(1, flightNumber);
                stmt.setString(2, flightNumber);
                System.out.println("Prepared statement parameters set.");
                ResultSet rs = stmt.executeQuery();
                System.out.println("Query executed.");
                while (rs.next()) {
                    String seat = rs.getString("seat");
                    occupiedSeats.add(seat);
                    System.out.println("Occupied seat: " + seat);
                }
            } catch (SQLException e) {
                System.err.println("SQL Exception: " + e.getMessage());
                e.printStackTrace();
            }
        } catch (ClassNotFoundException e) {
            System.err.println("Class Not Found Exception: " + e.getMessage());
            e.printStackTrace();
        }
        request.setAttribute("occupiedSeats", occupiedSeats.toArray(new String[0]));
        request.getRequestDispatcher("Admin/SeatInfo.jsp").forward(request, response);
    }
}