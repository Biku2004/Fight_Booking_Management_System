package com.flight.flight_booking_management_system.ViewPassenger;

import java.sql.Timestamp;

public class Booking {
    private String flightNumber;
    private String airline;
    private String departure;
    private String arrival;
    private String fullName;
    private String email;
    private String phone;
    private Timestamp bookingTime;

    public Booking(String flightNumber, String airline, String departure, String arrival, String fullName, String email, String phone, Timestamp bookingTime) {
        this.flightNumber = flightNumber;
        this.airline = airline;
        this.departure = departure;
        this.arrival = arrival;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.bookingTime = bookingTime;
    }

    // Getters for each field
    public String getFlightNumber() { return flightNumber; }
    public String getAirline() { return airline; }
    public String getDeparture() { return departure; }
    public String getArrival() { return arrival; }
    public String getFullName() { return fullName; }
    public String getEmail() { return email; }
    public String getPhone() { return phone; }
    public Timestamp getBookingTime() { return bookingTime; }
}
