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
        List<Admin> admins = null;
        try {
            admins = adminDAO.getAllAdmins();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (admins != null && !admins.isEmpty()) {
            req.setAttribute("admins", admins);
        } else {
            req.setAttribute("message", "No admins found.");
        }
        req.getRequestDispatcher("viewAllAdmins.jsp").forward(req, resp);
    }
}
