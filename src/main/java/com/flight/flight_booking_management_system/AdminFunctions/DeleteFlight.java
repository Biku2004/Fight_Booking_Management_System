package com.flight.flight_booking_management_system.AdminFunctions;

public class DeleteFlight {
    private String flightNumber;
    private String departureTime;
    private String arrivalTime;

    public DeleteFlight(String flightNumber, String departureTime, String arrivalTime) {
        this.flightNumber = flightNumber;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
    }

    public String getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(String departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(String arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

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
