package com.flight.flight_booking_management_system.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;

@WebServlet("/registerAdmin")
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10,      // 10MB
        maxRequestSize = 1024 * 1024 * 50    // 50MB
)
public class AdminServlet extends HttpServlet {
    private AdminDAO adminDAO;

    @Override
    public void init() {
        adminDAO = new AdminDAO();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Set request encoding to handle UTF-8 characters
        request.setCharacterEncoding("UTF-8");

        // Retrieve form parameters
        String firstName = request.getParameter("fname1");
        String lastName = request.getParameter("lname1");
        String email = request.getParameter("email1");
        String password = request.getParameter("pass1");
        String confirmPassword = request.getParameter("pass2");
        String phoneNumber = request.getParameter("ph1");
        String nationality = request.getParameter("nationality");
        String gender = request.getParameter("gender");
        String userType = request.getParameter("UserType");
        String dateOfBirth = request.getParameter("dateOfBirth");

        Part filePart = request.getPart("profilePhoto");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        String uploadPath = System.getProperty("user.home") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        String filePath = uploadPath + File.separator + fileName;
        // Save the file to the server
        filePart.write(filePath);

        // Check if passwords match
        if (!password.equals(confirmPassword)) {
            // Set error message and forward to registration page
            request.setAttribute("errorMessage", "Passwords do not match.");
            request.getRequestDispatcher("registration/aregdError.jsp").forward(request, response);
            return;
        }

        // Create an Admin object and set its properties
        Admin admin = new Admin();
        admin.setFirstName(firstName);
        admin.setLastName(lastName);
        admin.setEmail(email);
        admin.setPassword(password); // Consider hashing passwords before storing them
        admin.setPhoneNumber(phoneNumber);
        admin.setNationality(nationality);
        admin.setGender(gender);
        admin.setDateOfBirth(dateOfBirth);
        admin.setProfilePhotoPath("uploads/" + fileName); /// Relative path to the uploaded file
        admin.setUserType("admin");

        // Use DAO to save the admin data
        try {
            adminDAO.registerAdmin(admin);
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        // Redirect or forward to a success page
        response.sendRedirect("registration/aregistrationSuccess.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        // Optionally handle GET requests
        response.sendRedirect("register.jsp");
    }
}
