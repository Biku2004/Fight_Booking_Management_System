package com.flight.flight_booking_management_system.LoginRegister;

import com.flight.flight_booking_management_system.Admin.Admin;
import com.flight.flight_booking_management_system.Admin.AdminDAO;
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
        String email = req.getParameter ( "email" );
        System.out.println("Received email: " + email);
        Admin admin = null;

        try {
            admin = adminDAO.getAdminByEmail(email);
            System.out.println (admin );
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (admin != null) {
            req.setAttribute("admin", admin);
            req.getRequestDispatcher("UpdateFlight/updateForm.jsp").forward(req, resp); // Forward to the correct update form
        } else {
            req.setAttribute("message", "No admin found with the given email.");
            req.getRequestDispatcher("UpdateFlight/updateAdminError.jsp").forward(req, resp);
        }


    }
    }
