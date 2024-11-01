package com.flight.flight_booking_management_system.confirmBooking;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/ConfirmPaymentServlet")
public class ConfirmPaymentServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        String paymentId = request.getParameter("paymentId");

        if (paymentId != null) {
            session.setAttribute("paymentId", paymentId);
            response.sendRedirect("ConfirmBookingServlet");
        } else {
            session.setAttribute("errorMessage", "Payment verification failed. Please try again.");
            response.sendRedirect("bookFlight/BookingError.jsp");
        }
    }
}