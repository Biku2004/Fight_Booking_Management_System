package com.flight.flight_booking_management_system;

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
            if (admins.isEmpty()) {
                req.setAttribute("message", "No admins found.");
            } else {
                req.setAttribute("admins", admins);
            }
            req.getRequestDispatcher("viewAllAdmins.jsp").forward(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("message", "Error occurred: " + e.getMessage());
            req.getRequestDispatcher("viewAllAdmins.jsp").forward(req, resp);
        }
    }
}
