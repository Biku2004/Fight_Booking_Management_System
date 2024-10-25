package com.flight.flight_booking_management_system.LoginRegister;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Arrays;

@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() {
        Connection connection = DatabaseConnection.getConnection();
        userDAO = new UserDAO(connection);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email"); // This should come from the query string or form submission
        System.out.println("Fetching user with email: " + email); // Debugging log

        try {
            User user = userDAO.getUserByEmail(email);
            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            } else {
                response.sendRedirect("updateUserError.jsp");
            }
        } catch (SQLException e) {
            throw new ServletException(e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Log all request parameters for debugging
        request.getParameterMap().forEach((key, value) -> {
            System.out.println(key + ": " + Arrays.toString(value));
        });

        String email = request.getParameter("email");
        System.out.println("Email received: " + email); // Log the received email

        if (email == null || email.isEmpty()) {
            response.sendRedirect("updateUserError.jsp?message=Email is missing.");
            return;
        }

        try {
            User existingUser = userDAO.getUserByEmail(email);
            if (existingUser == null) {
                throw new ServletException("User not found for email: " + email);
            }

            // Retrieve user data from form
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String phone = request.getParameter("phone");
            String passportNumber = request.getParameter("passportNumber");
            String nationality = request.getParameter("nationality");
            String gender = request.getParameter("gender");
            String dateOfBirth = request.getParameter("dateOfBirth");

            // Handle file upload for profile photo
            Part filePart = request.getPart("profilePhoto");
            InputStream profilePhoto = (filePart != null) ? filePart.getInputStream() : null;

            User user = new User(0, firstName, lastName, email, null, phone, passportNumber, nationality, gender, dateOfBirth, null);
            user.setProfilePhoto(profilePhoto != null ? new javax.sql.rowset.serial.SerialBlob(profilePhoto.readAllBytes()) : null);

            // Update user in the database
            userDAO.updateUser(user);
            response.sendRedirect("updateUserSuccess.jsp");
        } catch (SQLException e) {
            System.err.println("SQL Exception: " + e.getMessage());
            throw new ServletException(e);
        }
    }
}
