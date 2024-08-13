import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

@WebServlet("/login")
public class loginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req , HttpServletResponse resp) throws ServletException, IOException {
        PrintWriter out = resp.getWriter();
        String email = req.getParameter("email1");
        String pass = req.getParameter("pass1");

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/user", "root", "12345");

            PreparedStatement ps = con.prepareStatement("SELECT * FROM register WHERE Email=? AND Password=?");
            ps.setString(1, email);
            ps.setString(2, pass);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                HttpSession session = req.getSession();
                session.setAttribute("session_name", rs.getString("Firstname"));
//                // Redirect to profile page
                resp.sendRedirect("truehome.jsp");

            } else {
                RequestDispatcher rd = req.getRequestDispatcher("/error.jsp");
                rd.include(req, resp);
            }

        } catch (Exception e) {
            e.printStackTrace();
            resp.setContentType("text/html");
            out.print("<h1 style='color:red'>Exception Occurred: " + e.getMessage() + "</h1>");
            RequestDispatcher rd = req.getRequestDispatcher("/login.jsp");
            rd.include(req, resp);
        }
    }
}
