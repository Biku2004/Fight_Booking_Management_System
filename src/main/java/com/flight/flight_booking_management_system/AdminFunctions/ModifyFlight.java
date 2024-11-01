package com.flight.flight_booking_management_system.AdminFunctions;

public class ModifyFlight {
    private String flightNumber;
    private String airline;
    private String departureName;  // Changed from departureCity to departureName
    private String arrivalName;     // Changed from arrivalCity to arrivalName
    private String departureTime;   // Keep as is for datetime handling
    private String arrivalTime;      // Keep as is for datetime handling
    private double price;

    // Default constructor
    public ModifyFlight() {}

    // Parameterized constructor
    public ModifyFlight(String flightNumber,
                        String airline,
                        String departureName,
                        String arrivalName,
                        String departureTime,
                        String arrivalTime,
                        double price) {
        this.flightNumber = flightNumber;
        this.airline = airline;
        this.departureName = departureName;  // Updated field name
        this.arrivalName = arrivalName;       // Updated field name
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.price = price;
    }

    // Getter and Setter methods

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public String getDepartureName() {  // Updated getter method name
        return departureName;
    }

    public void setDepartureName(String departureName) {  // Updated setter method name
        this.departureName = departureName;
    }

    public String getArrivalName() {  // Updated getter method name
        return arrivalName;
    }

    public void setArrivalName(String arrivalName) {  // Updated setter method name
        this.arrivalName = arrivalName;
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

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}