package com.flight.flight_booking_management_system.AdminFunctions;

public class DeleteFlight {
    private String flightNumber;

    // Constructor
    public DeleteFlight(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    // Getter and Setter
    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }
}
