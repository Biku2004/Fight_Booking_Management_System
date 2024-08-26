package com.flight.flight_booking_management_system;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/deleteAdmin")
public class DeleteAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private AdminDAO adminDAO = new AdminDAO(); // Initialize your DAO class

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email1");
        String message;

        // Validate the email input
        if (email == null || email.trim().isEmpty()) {
            message = "Email ID cannot be empty.";
        } else {
            try {
                boolean isDeleted = adminDAO.deleteAdmin(email); // Perform deletion

                if (isDeleted) {
                    message = "Data Deleted Successfully.";
                } else {
                    message = "No Data Found to Delete.";
                }

            } catch (Exception e) {
                message = "Error occurred: " + e.getMessage();
                e.printStackTrace();
            }
        }

        // Set the message as a request attribute
        req.setAttribute("message", message);

        // Forward the request to the JSP page to display the message
        req.getRequestDispatcher("deleteAdminResult.jsp").forward(req, resp);
    }
}
