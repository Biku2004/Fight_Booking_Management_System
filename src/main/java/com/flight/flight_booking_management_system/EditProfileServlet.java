package com.flight.flight_booking_management_system;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@MultipartConfig(maxFileSize = 16177215) // Set max file size to around 16MB
@WebServlet("/editProfile")
public class EditProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightregd", "Java-Project", "root@localhost");

            String query = "SELECT * FROM register WHERE Email = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                req.setAttribute("firstName", rs.getString("FirstName"));
                req.setAttribute("lastName", rs.getString("LastName"));
                req.setAttribute("email", rs.getString("Email"));
                req.setAttribute("phone", rs.getString("Phone"));
                req.setAttribute("passportNumber", rs.getString("PassportNumber"));
                req.setAttribute("nationality", rs.getString("Nationality"));
                req.setAttribute("gender", rs.getString("Gender"));
                req.setAttribute("dateOfBirth", rs.getString("DateOfBirth"));
            }

            RequestDispatcher rd = req.getRequestDispatcher("/editProfile.jsp");
            rd.forward(req, resp);

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().print("<h1 style='color:red'>Exception Occurred: " + e.getMessage() + "</h1>");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String phone = req.getParameter("phone");
        String passportNumber = req.getParameter("passportNumber");
        String nationality = req.getParameter("nationality");
        String gender = req.getParameter("gender");
        String dateOfBirth = req.getParameter("dateOfBirth");

        Part filePart = req.getPart("profilePhoto");
        InputStream profilePhotoStream = null;

        if (filePart != null && filePart.getSize() > 0) {
            profilePhotoStream = filePart.getInputStream();
        }

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/flightregd", "Java-Project", "root@localhost");

            String query = "UPDATE register SET FirstName = ?, LastName = ?, Phone = ?, PassportNumber = ?, Nationality = ?, Gender = ?, DateOfBirth = ?"
                    + (profilePhotoStream != null ? ", ProfilePhoto = ?" : "")
                    + " WHERE Email = ?";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, phone);
            ps.setString(4, passportNumber);
            ps.setString(5, nationality);
            ps.setString(6, gender);
            ps.setString(7, dateOfBirth);

            if (profilePhotoStream != null) {
                ps.setBlob(8, profilePhotoStream);
                ps.setString(9, email);
            } else {
                ps.setString(8, email);
            }

            int rowsAffected = ps.executeUpdate();

            if (rowsAffected > 0) {
                resp.sendRedirect("profile.jsp"); // Redirect to the profile page or another page after successful update
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("/error.jsp");
                rd.include(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.getWriter().print("<h1 style='color:red'>Exception Occurred: " + e.getMessage() + "</h1>");
        }
    }
}
