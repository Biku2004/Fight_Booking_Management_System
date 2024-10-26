package com.flight.flight_booking_management_system.AddFlightServlet;

public class AddFlight {
    private int id;
    private String departureName;
    private String departureId;
    private String departureTime;
    private String arrivalName;
    private String arrivalId;
    private String arrivalTime;
    private int duration;
    private String airplane;
    private String airline;
    private String airlineLogo;
    private String travelClass;
    private String flightNumber;
    private String legroom;
    private String extensions;
    private int totalDuration;
    private double carbonEmissions;
    private double price;
    private String type;
    private String bookingToken;
    private String layovers;



    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

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

    public String getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(String departureAirport) {
        this.departureAirport = departureAirport;
    }

    public String getArrivalAirport() {
        return arrivalAirport;
    }

    public void setArrivalAirport(String arrivalAirport) {
        this.arrivalAirport = arrivalAirport;
    }

    public int getDuration() {
        return duration;
    }

    public void setDuration(int duration) {
        this.duration = duration;
    }

    public String getAirplane() {
        return airplane;
    }

    public void setAirplane(String airplane) {
        this.airplane = airplane;
    }

    public String getLegroom() {
        return legroom;
    }

    public void setLegroom(String legroom) {
        this.legroom = legroom;
    }

    public String getExtensions() {
        return extensions;
    }

    public void setExtensions(String extensions) {
        this.extensions = extensions;
    }

    public String getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(String travelClass) {
        this.travelClass = travelClass;
    }

    public int getLayoversDuration() {
        return layoversDuration;
    }

    public void setLayoversDuration(int layoversDuration) {
        this.layoversDuration = layoversDuration;
    }

    public double getCarbonEmissions() {
        return carbonEmissions;
    }

    public void setCarbonEmissions(double carbonEmissions) {
        this.carbonEmissions = carbonEmissions;
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

    public void setDepartureCity(String departureCity) {
        this.departureAirport = departureCity;
    }

    public void setArrivalCity(String arrivalCity) {
        this.arrivalAirport = arrivalCity;
    }
}



Old code

package com.flight.flight_booking_management_system.AddFlightServlet;

public class AddFlight {
    private String flightNumber;
    private String airline;
    private String departureCity;
    private String arrivalCity;
    private String departureTime;
    private String arrivalTime;
    private double price;

    // Getters and Setters for each field
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

    public String getDepartureCity() {
        return departureCity;
    }

    public void setDepartureCity(String departureCity) {
        this.departureCity = departureCity;
    }

    public String getArrivalCity() {
        return arrivalCity;
    }

    public void setArrivalCity(String arrivalCity) {
        this.arrivalCity = arrivalCity;
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
