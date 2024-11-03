package com.flight.flight_booking_management_system.LoginRegister;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email1");
        String pass = req.getParameter("pass1");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightregd", "Java-Project", "root@localhost");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE Email=? AND Password=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("session_name", rs.getString("FirstName"));
                session.setAttribute("email", email); // Storing the email in session

                // Retrieve the profile photo as a byte array
                InputStream photoInputStream = rs.getBinaryStream("ProfilePhoto");
                if (photoInputStream != null) {
                    byte[] profilePhoto = photoInputStream.readAllBytes();
                    session.setAttribute("profile_photo", profilePhoto);
                }

                // Check the role of the user and redirect accordingly
                String role = rs.getString("UserType");  // Assuming 'UserType' is a column in your database

                if ("admin".equalsIgnoreCase(role)) {
                    resp.sendRedirect("Admin/HomeAdmin.jsp");  // Redirect to admin home page
                } else {
                    resp.sendRedirect("login/home.jsp");  // Redirect to user home page
                }
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("/error.jsp");
                rd.include(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().print("<h1 style='color:red'>Exception Occurred: " + e.getMessage() + "</h1>");
            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
            rd.include(req, resp);
        }
    }
}