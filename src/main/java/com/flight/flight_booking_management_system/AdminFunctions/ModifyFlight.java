package com.flight.flight_booking_management_system.AdminFunctions;

public class ModifyFlight {
    private String flight_number;
    private String airline;
    private String departureName;
    private String arrivalName;     // Changed from arrivalCity to arrivalName
    private String departure_time;   // Keep as is for datetime handling
    private String arrivalTime;      // Keep as is for datetime handling
    private double price;

    // Default constructor
    public ModifyFlight() {}

    // Parameterized constructor
    public ModifyFlight(String flight_number,
                        String airline,
                        String departureName,
                        String arrivalName,
                        String departure_time,
                        String arrivalTime,
                        double price) {
        this.flight_number = flight_number;
        this.airline = airline;
        this.departureName = departureName;  // Updated field name
        this.arrivalName = arrivalName;       // Updated field name
        this.departure_time = departure_time;
        this.arrivalTime = arrivalTime;
        this.price = price;
    }

    // Getter and Setter methods

    public String getFlight_number() {
        return flight_number;
    }

    public void setFlight_number(String flight_number) {
        this.flight_number = flight_number;
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

    public String getDeparture_time() {
        return departure_time;
    }

    public void setDeparture_time(String departure_time) {
        this.departure_time = departure_time;
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