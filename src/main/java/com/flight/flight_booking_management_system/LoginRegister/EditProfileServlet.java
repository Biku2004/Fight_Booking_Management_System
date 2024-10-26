package com.flight.flight_booking_management_system.LoginRegister;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.*;
import java.sql.*;
import java.util.Arrays;

@WebServlet("/editProfile")
@MultipartConfig(maxFileSize = 16177215) // Set a limit for file upload size (15MB in this case)
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

        if (email == null || email.isEmpty()) {
            response.sendRedirect("updateUserError.jsp?message=Invalid email.");
            return;
        }

        try {
            User user = userDAO.getUserByEmail(email);
            if (user != null) {
                request.setAttribute("user", user);
                request.getRequestDispatcher("editProfile.jsp").forward(request, response);
            } else {
                response.sendRedirect("updateUserError.jsp?message=User not found.");
            }
        } catch (SQLException e) {
            System.err.println("SQL Exception during user fetch: " + e.getMessage());
            response.sendRedirect("updateUserError.jsp?message=Database error.");
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
                response.sendRedirect("updateUserError.jsp?message=User not found.");
                return;
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
            InputStream profilePhotoInputStream = (filePart != null && filePart.getSize() > 0) ? filePart.getInputStream() : null;

            // Create a new user object for the update
            User user = new User(existingUser.getId(), firstName, lastName, email, existingUser.getPassword(), phone, passportNumber, nationality, gender, dateOfBirth, existingUser.getProfilePhoto());

            // Update the profile photo if a new one was uploaded
            if (profilePhotoInputStream != null) {
                byte[] profilePhotoBytes = profilePhotoInputStream.readAllBytes();
                user.setProfilePhoto(new javax.sql.rowset.serial.SerialBlob(profilePhotoBytes));
                profilePhotoInputStream.close(); // Close input stream after reading
            }

            // Update user in the database
            userDAO.updateUser(user);
            response.sendRedirect("updateUserSuccess.jsp");
        } catch (SQLException e) {
            System.err.println("SQL Exception during user update: " + e.getMessage());
            response.sendRedirect("updateUserError.jsp?message=Database error.");
        } catch (IOException e) {
            System.err.println("File upload error: " + e.getMessage());
            response.sendRedirect("updateUserError.jsp?message=File upload error.");
        }
    }
}
