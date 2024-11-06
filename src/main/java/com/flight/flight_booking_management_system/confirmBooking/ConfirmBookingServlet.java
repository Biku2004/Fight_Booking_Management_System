package com.flight.flight_booking_management_system.confirmBooking;

import com.razorpay.Order;
import com.razorpay.RazorpayClient;
import com.razorpay.RazorpayException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONObject;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

@WebServlet("/ConfirmBookingServlet")
public class ConfirmBookingServlet extends HttpServlet {

    private static final String RAZORPAY_KEY_ID = "rzp_test_E96YctEGlH3EcE";
    private static final String RAZORPAY_KEY_SECRET = "asqJUTrmLx0aodnuFyCA8pzD";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String paymentId = request.getParameter("paymentId");

        if (paymentId != null) {
            session.setAttribute("paymentId", paymentId);
            // Proceed with booking insertion
            insertBooking(request, response, session);
        } else {
            session.setAttribute("errorMessage", "Payment verification failed. Please try again.");
            response.sendRedirect("bookFlight/BookingError.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String flightNumber = request.getParameter("flightNumber");
        String airline = request.getParameter("airline");
        String departure = request.getParameter("departure");
        String arrival = request.getParameter("arrival");
        String departureTime = request.getParameter("departureTime");
        String arrivalTime = request.getParameter("arrivalTime");
        String airplane = request.getParameter("airplane");
        String legroom = request.getParameter("legroom");
        String extensions = request.getParameter("extensions");
        String travelClass = request.getParameter("travel_class");
        String duration = request.getParameter("duration");
        String layovers = request.getParameter("layovers");
        String price = request.getParameter("price");
        String carbonEmissions = request.getParameter("carbon_emissions");
        String fullName = request.getParameter("fullName");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String seat = request.getParameter("Seats");

        String[] passengerNames = request.getParameterValues("passengerName");
        String[] passengerAges = request.getParameterValues("passengerAge");
        String[] passengerSeats = request.getParameterValues("passengerSeat");

        HttpSession session = request.getSession();
        session.setAttribute("flightNumber", flightNumber);
        session.setAttribute("airline", airline);
        session.setAttribute("departure", departure);
        session.setAttribute("arrival", arrival);
        session.setAttribute("departureTime", departureTime);
        session.setAttribute("arrivalTime", arrivalTime);
        session.setAttribute("airplane", airplane);
        session.setAttribute("legroom", legroom);
        session.setAttribute("extensions", extensions);
        session.setAttribute("travelClass", travelClass);
        session.setAttribute("duration", duration);
        session.setAttribute("layovers", layovers);
        session.setAttribute("price", price);
        session.setAttribute("carbonEmissions", carbonEmissions);
        session.setAttribute("fullName", fullName);
        session.setAttribute("email", email);
        session.setAttribute("phone", phone);
        session.setAttribute("seat", seat);
        session.setAttribute("passengerNames", passengerNames);
        session.setAttribute("passengerAges", passengerAges);
        session.setAttribute("passengerSeats", passengerSeats);

        // Debug lines to log the values
        System.out.println("Debug: Flight Number: " + flightNumber);
        System.out.println("Debug: Price: " + price);

        double totalPrice = Double.parseDouble(price);
        if (passengerNames != null) {
            totalPrice *= (passengerNames.length + 1); // +1 for the main passenger
        }

        if (session.getAttribute("paymentId") == null) {
            try {
                RazorpayClient razorpay = new RazorpayClient(RAZORPAY_KEY_ID, RAZORPAY_KEY_SECRET);

                JSONObject orderRequest = new JSONObject();
                orderRequest.put("amount", (int) (totalPrice) * 100); // amount in the smallest currency unit
                orderRequest.put("currency", "INR");
                orderRequest.put("receipt", "order_rcptid_11");

                Order order = razorpay.orders.create(orderRequest);

                String razorpayOrderId = order.get("id");
                session.setAttribute("razorpayOrderId", razorpayOrderId);

                // Debug line to log the Razorpay Order ID
                System.out.println("Debug: Razorpay Order ID: " + razorpayOrderId);

                response.sendRedirect("bookFlight/payment.jsp");

            } catch (RazorpayException e) {
                e.printStackTrace();
                session.setAttribute("errorMessage", "Payment initiation failed. Please try again.");
                response.sendRedirect("bookFlight/BookingError.jsp");
            }
        }
    }

    private void insertBooking(HttpServletRequest request, HttpServletResponse response, HttpSession session) throws IOException {

        String flightNumber = (String) session.getAttribute("flightNumber");
        String airline = (String) session.getAttribute("airline");
        String departure = (String) session.getAttribute("departure");
        String arrival = (String) session.getAttribute("arrival");
        String departureTime = (String) session.getAttribute("departureTime");
        String arrivalTime = (String) session.getAttribute("arrivalTime");
        String airplane = (String) session.getAttribute("airplane");
        String legroom = (String) session.getAttribute("legroom");
        String extensions = (String) session.getAttribute("extensions");
        String travelClass = (String) session.getAttribute("travelClass");
        String duration = (String) session.getAttribute("duration");
        String layovers = (String) session.getAttribute("layovers");
        String price = (String) session.getAttribute("price");
        String carbonEmissions = (String) session.getAttribute("carbonEmissions");
        String fullName = (String) session.getAttribute("fullName");
        String email = (String) session.getAttribute("email");
        String phone = (String) session.getAttribute("phone");
        String seat = (String) session.getAttribute("seat");

        String[] passengerNames = (String[]) session.getAttribute("passengerNames");
        String[] passengerAges = (String[]) session.getAttribute("passengerAges");
        String[] passengerSeats = (String[]) session.getAttribute("passengerSeats");

//        if(session.getAttribute("paymentId") != null) {
        String jdbcURL = "jdbc:mysql://localhost:3306/flightregd";
        String dbUser = "Java-Project";
        String dbPassword = "root@localhost";

        Connection connection = null;
        PreparedStatement bookingStmt = null;
        PreparedStatement passengerStmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            String bookingQuery = "INSERT INTO bookings (flight_number, airline, departure, arrival, departure_time, arrival_time, airplane, legroom, extensions, travel_class, duration, layovers, price, carbon_emissions, full_name, email, phone, seat, booking_time) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NOW())";
            bookingStmt = connection.prepareStatement(bookingQuery, PreparedStatement.RETURN_GENERATED_KEYS);
            bookingStmt.setString(1, flightNumber);
            bookingStmt.setString(2, airline);
            bookingStmt.setString(3, departure);
            bookingStmt.setString(4, arrival);
            bookingStmt.setString(5, departureTime);
            bookingStmt.setString(6, arrivalTime);
            bookingStmt.setString(7, airplane);
            bookingStmt.setString(8, legroom);
            bookingStmt.setString(9, extensions);
            bookingStmt.setString(10, travelClass);
            bookingStmt.setString(11, duration);
            bookingStmt.setString(12, layovers);
            bookingStmt.setString(13, price);
            bookingStmt.setString(14, carbonEmissions);
            bookingStmt.setString(15, fullName);
            bookingStmt.setString(16, email);
            bookingStmt.setString(17, phone);
            bookingStmt.setString(18, seat);
            bookingStmt.executeUpdate();

            ResultSet generatedKeys = bookingStmt.getGeneratedKeys();
            if (generatedKeys.next()) {
                long bookingId = generatedKeys.getLong(1);

                String passengerSQL = "INSERT INTO passengers (booking_id, passenger_name, passenger_age, seat) VALUES (?, ?, ?, ?)";
                passengerStmt = connection.prepareStatement(passengerSQL);

                if (passengerNames != null) {
                    for (int i = 0; i < passengerNames.length; i++) {
                        String passengerName = passengerNames[i];
                        String passengerAge = passengerAges[i];
                        String passengerSeat = passengerSeats[i];

                        passengerStmt.setLong(1, bookingId);
                        if (passengerName != null && !passengerName.isEmpty()) {
                            passengerStmt.setString(2, passengerName);
                        } else {
                            passengerStmt.setNull(2, java.sql.Types.VARCHAR);
                        }
                        passengerStmt.setString(3, passengerAge);
                        passengerStmt.setString(4, passengerSeat);
                        passengerStmt.addBatch();
                    }
                    passengerStmt.executeBatch();
                }
            }

            response.sendRedirect("bookFlight/bookingConfirmation.jsp");

//            session.removeAttribute("flightNumber");
//            session.removeAttribute("price");
//            session.removeAttribute("passengerNames");
            session.removeAttribute("paymentId");

        } catch (SQLException | ClassNotFoundException e) {
//            HttpSession session = request.getSession();
            session.setAttribute("errorMessage", "Booking failed due to a server error. Please try again later.");
            response.sendRedirect("bookFlight/BookingError.jsp");
            e.printStackTrace();
        } finally {
            try {
//                if (checkSeatStmt != null) checkSeatStmt.close();
                if (bookingStmt != null) bookingStmt.close();
                if (passengerStmt != null) passengerStmt.close();
                if (connection != null) connection.close();

            } catch (SQLException ex) {
                ex.printStackTrace();
            }
        }

    }
}