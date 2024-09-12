package com.flight.flight_booking_management_system.LoginRegister;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@MultipartConfig(maxFileSize = 16177215) // Set max file size to around 16MB
@WebServlet("/register")
public class registerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException, IOException {
        resp.setContentType("text/html");

        // Retrieving form parameters
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String passportNumber = req.getParameter("passportNumber");
        String nationality = req.getParameter("nationality");
        String gender = req.getParameter("gender");
        String dateOfBirth = req.getParameter("dateOfBirth");

        // Retrieving the profile photo
        Part filePart = req.getPart("profilePhoto");
        InputStream profilePhotoStream = null;

        if (filePart != null) {
            profilePhotoStream = filePart.getInputStream(); // Get the input stream of the uploaded file
        }

        // JDBC connection setup
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightregd", "Java-Project", "root@localhost");

            // Insert query with BLOB for profile photo
            String query = "INSERT INTO register (FirstName, LastName, Email, Password, Phone, PassportNumber, Nationality, Gender, DateOfBirth, ProfilePhoto,UserType) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?,'user')";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, phone);
            ps.setString(6, passportNumber);
            ps.setString(7, nationality);
            ps.setString(8, gender);
            ps.setString(9, dateOfBirth);

            if (profilePhotoStream != null) {
                ps.setBlob(10, profilePhotoStream); // Store the profile photo as a BLOB
            } else {
                ps.setNull(10, java.sql.Types.BLOB); // Handle the case where no photo was uploaded
            }

            int rowsAffected = ps.executeUpdate();

            // Checking if insertion was successful
            if (rowsAffected > 0) {
                resp.sendRedirect("login/login.jsp");
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("/error.jsp");
                rd.include(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().print("<h1 style='color:red'>Exception Occurred: " + e.getMessage() + "</h1>");
            RequestDispatcher rd = req.getRequestDispatcher("registration/register.jsp");
            rd.include(req, resp);
        }
    }
}
