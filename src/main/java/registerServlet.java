import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/register")  // This annotation replaces the need for web.xml mapping
public class registerServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        resp.setContentType("text/html");

        // Retrieving form parameters
        String firstName = req.getParameter("firstName");
        String lastName = req.getParameter("lastName");
        String email = req.getParameter("email");
        String password = req.getParameter("password");
        String phone = req.getParameter("phone");
        String passportNumber = req.getParameter("passportNumber");
        String nationality = req.getParameter("nationality");
        String gender = req.getParameter("gender");
        String dateOfBirth = req.getParameter("dateOfBirth");

        // JDBC connection setup
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "12345");

            // Insert query
            String query = "INSERT INTO register (FirstName, LastName, Email, Password, Phone, PassportNumber, Nationality, Gender, DateOfBirth) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";

            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, firstName);
            ps.setString(2, lastName);
            ps.setString(3, email);
            ps.setString(4, password);
            ps.setString(5, phone);
            ps.setString(6, passportNumber);
            ps.setString(7, nationality);
            ps.setString(8, gender);
            ps.setString(9, dateOfBirth);

            int rowsAffected = ps.executeUpdate();

            // Checking if insertion was successful
            if (rowsAffected > 0) {
                out.print("Register Successful");// Redirect to a success page after registration
            } else {
                RequestDispatcher rd = req.getRequestDispatcher("/error.jsp");
                rd.include(req, resp);
                out.print("<h1 style='color:red'>Registration failed, please try again!</h1>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            out.print("<h1 style='color:red'>Exception Occurred: " + e.getMessage() + "</h1>");
            RequestDispatcher rd = req.getRequestDispatcher("/register.jsp");
            rd.include(req, resp);
        }
    }
}
