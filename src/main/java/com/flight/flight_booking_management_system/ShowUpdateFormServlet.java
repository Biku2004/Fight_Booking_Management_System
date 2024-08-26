package com.flight.flight_booking_management_system;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.SQLException;

@WebServlet("/showUpdateForm")
public class ShowUpdateFormServlet extends HttpServlet {
    private AdminDAO adminDAO = new AdminDAO();

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        Admin admin = null;

        try {
            admin = adminDAO.getAdminByEmail(email);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (admin != null) {
            req.setAttribute("admin", admin);
            req.getRequestDispatcher("updateForm.jsp").forward(req, resp);
        } else {
            req.setAttribute("message", "No admin found with the given email.");
            req.getRequestDispatcher("updateAdminError.jsp").forward(req, resp);
        }
    }
}
