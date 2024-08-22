package com.flight.flight_booking_management_system;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
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
        String dateOfBirth = request.getParameter("dateOfBirth");

        // Handle file upload
        Part filePart = request.getPart("profilePhoto");
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString(); // MSIE fix.
        String uploadPath = getServletContext().getRealPath("") + File.separator + "uploads";
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) uploadDir.mkdir();
        String filePath = uploadPath + File.separator + fileName;
        // Save the file to the server
        filePart.write(filePath);

        // Here, you might want to add validation, such as checking if password and confirmPassword match

        if (!password.equals(confirmPassword)) {
            // Handle password mismatch
            request.setAttribute("message", "Passwords do not match.");
            request.getRequestDispatcher("/registration.jsp").forward(request, response);
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
        admin.setProfilePhotoPath("uploads/" + fileName); // Relative path to the uploaded file
        admin.setDateOfBirth(dateOfBirth);

        // Use DAO to save the admin data
        try {
            adminDAO.registerAdmin(admin);
        } catch (SQLException e) {
            throw new ServletException(e);
        }

        // Redirect or forward to a success page
        response.sendRedirect("aregistrationSuccess.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Optionally handle GET requests
        response.sendRedirect("registration.jsp");
    }
}
