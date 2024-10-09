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
import java.util.List;

@WebServlet("/viewAllAdmins")
public class ViewAllAdminsServlet extends HttpServlet {
    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            List<Admin> admins = adminDAO.getAllAdmins();
            req.setAttribute("admins", admins);
        } catch (SQLException e) {
            req.setAttribute("message", "Error retrieving admin data. Please try again.");
            e.printStackTrace();
        }
        req.getRequestDispatcher("viewAllAdmins.jsp").forward(req, resp);
    }
}
