package com.flight.flight_booking_management_system.AdminFunctions;

import com.flight.flight_booking_management_system.Admin.Admin;
import com.flight.flight_booking_management_system.Admin.AdminDAO;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/updateAdmin")
public class UpdateAdminForm extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Initialize AdminDAO object
    private AdminDAO adminDAO;

    // Initialize the AdminDAO object in the constructor
    public UpdateAdminForm() {
        this.adminDAO = new AdminDAO();
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        // Retrieve admin details from the request
        String email = req.getParameter("email");
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String phoneNumber = req.getParameter("phoneNumber");
        String country = req.getParameter("country");
        String gender = req.getParameter("gender");
        String dob = req.getParameter("dob");
        String message;

        // Validate required fields
        if (email == null || email.isEmpty()) {
            message = "Email is required to update admin details.";
            req.setAttribute("message", message);
            req.getRequestDispatcher("updateAdminSuccess.jsp").forward(req, resp);
            return;
        }

        // Create and set admin object properties
        Admin admin = new Admin();
        admin.setEmail(email);
        admin.setFirstName(firstName);
        admin.setLastName(lastName);
        admin.setPhoneNumber(phoneNumber);
        admin.setNationality(country);
        admin.setGender(gender);
        admin.setDateOfBirth(dob);

        try {
            // Attempt to update admin in the database
            boolean isUpdated = adminDAO.updateAdmin(admin);

            if (isUpdated) {
                message = "Admin details updated successfully.";
            } else {
                message = "Failed to update admin details. Admin may not exist.";
            }
        } catch (SQLException e) {
            // Log error and set error message
            e.printStackTrace();
            message = "An error occurred while updating admin details: " + e.getMessage();
        }

        // Set the message attribute and forward to the success page
        req.setAttribute("message", message);
        req.getRequestDispatcher("UpdateFlight/updateAdminSuccess.jsp").forward(req, resp);
    }
}
