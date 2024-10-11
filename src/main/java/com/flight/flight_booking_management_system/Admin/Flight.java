//package com.flight.flight_booking_management_system.Admin;
//
//import java.sql.Timestamp;
//
//public class Flight {
//    private int id;
//    private String flightNumber;
//    private String airline;
//
//    public String getDepartureAirport() {
//        return departureAirport;
//    }
//
//    public void setDepartureAirport(String departureAirport) {
//        this.departureAirport = departureAirport;
//    }
//
//    public int getId() {
//        return id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }
//
//    public String getFlightNumber() {
//        return flightNumber;
//    }
//
//    public void setFlightNumber(String flightNumber) {
//        this.flightNumber = flightNumber;
//    }
//
//    public String getAirline() {
//        return airline;
//    }
//
//    public void setAirline(String airline) {
//        this.airline = airline;
//    }
//
//    public String getArrivalAirport() {
//        return arrivalAirport;
//    }
//
//    public void setArrivalAirport(String arrivalAirport) {
//        this.arrivalAirport = arrivalAirport;
//    }
//
//    public int getDuration() {
//        return duration;
//    }
//
//    public void setDuration(int duration) {
//        this.duration = duration;
//    }
//
//    public String getAirplane() {
//        return airplane;
//    }
//
//    public void setAirplane(String airplane) {
//        this.airplane = airplane;
//    }
//
//    public String getLegroom() {
//        return legroom;
//    }
//
//    public void setLegroom(String legroom) {
//        this.legroom = legroom;
//    }
//
//    public String getExtensions() {
//        return extensions;
//    }
//
//    public void setExtensions(String extensions) {
//        this.extensions = extensions;
//    }
//
//    public String getTravelClass() {
//        return travelClass;
//    }
//
//    public void setTravelClass(String travelClass) {
//        this.travelClass = travelClass;
//    }
//
//    public int getLayoversDuration() {
//        return layoversDuration;
//    }
//
//    public void setLayoversDuration(int layoversDuration) {
//        this.layoversDuration = layoversDuration;
//    }
//
//    public float getCarbonEmissions() {
//        return carbonEmissions;
//    }
//
//    public void setCarbonEmissions(float carbonEmissions) {
//        this.carbonEmissions = carbonEmissions;
//    }
//
//    public Timestamp getCreatedAt() {
//        return createdAt;
//    }
//
//    public void setCreatedAt(Timestamp createdAt) {
//        this.createdAt = createdAt;
//    }
//
//    private String departureAirport;
//    private String arrivalAirport;
//    private int duration;
//    private String airplane;
//    private String legroom;
//    private String extensions;
//    private String travelClass;
//    private int layoversDuration;
//    private float carbonEmissions;
//    private java.sql.Timestamp createdAt;
//
//    public void setDepartureName(String departureName) {
//    }
//
//    public void setDepartureId(String departureId) {
//    }
//
//    public void setDepartureTime(Timestamp departureTime) {
//    }
//
//    public void setArrivalName(String arrivalName) {
//    }
//
//    public void setArrivalId(String arrivalId) {
//    }
//
//    public void setArrivalTime(Timestamp arrivalTime) {
//    }
//
//    public void setAirlineLogo(String airlineLogo) {
//    }
//
//    public void setTotalDuration(int totalDuration) {
//    }
//
//    public void setPrice(int price) {
//    }
//
//    public void setType(String type) {
//    }
//
//    public void setBookingToken(String bookingToken) {
//    }
//}


package com.flight.flight_booking_management_system.Admin;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.sql.Timestamp;
import java.util.List;

public class Flight {
    private int id;
    private String departureName;
    private String departureId;
    private Timestamp departureTime;
    private String arrivalName;
    private String arrivalId;
    private Timestamp arrivalTime;
    private int duration;
    private String airplane;
    private String airline;
    private String airlineLogo;
    private String travelClass;
    private String flightNumber;
    private String legroom;
    private String extensions;
    private int totalDuration;
    private float carbonEmissions;
    private int price;
    private String type;
    private String bookingToken;
    private String layovers;

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getDepartureName() {
        return departureName;
    }

    public void setDepartureName(String departureName) {
        this.departureName = departureName;
    }

    public String getDepartureId() {
        return departureId;
    }

    public void setDepartureId(String departureId) {
        this.departureId = departureId;
    }

    public Timestamp getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Timestamp departureTime) {
        this.departureTime = departureTime;
    }

    public String getArrivalName() {
        return arrivalName;
    }

    public void setArrivalName(String arrivalName) {
        this.arrivalName = arrivalName;
    }

    public String getArrivalId() {
        return arrivalId;
    }

    public void setArrivalId(String arrivalId) {
        this.arrivalId = arrivalId;
    }

    public Timestamp getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Timestamp arrivalTime) {
        this.arrivalTime = arrivalTime;
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

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public String getAirlineLogo() {
        return airlineLogo;
    }

    public void setAirlineLogo(String airlineLogo) {
        this.airlineLogo = airlineLogo;
    }

    public String getTravelClass() {
        return travelClass;
    }

    public void setTravelClass(String travelClass) {
        this.travelClass = travelClass;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
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

    public int getTotalDuration() {
        return totalDuration;
    }

    public void setTotalDuration(int totalDuration) {
        this.totalDuration = totalDuration;
    }

    public float getCarbonEmissions() {
        return carbonEmissions;
    }

    public void setCarbonEmissions(float carbonEmissions) {
        this.carbonEmissions = carbonEmissions;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getBookingToken() {
        return bookingToken;
    }

    public void setBookingToken(String bookingToken) {
        this.bookingToken = bookingToken;
    }
    public String getLayovers() {
        return layovers;
    }

    public void setLayovers(String layovers) {
        this.layovers = layovers;
    }

    public List<Layover> getLayoversList() {
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            return objectMapper.readValue(layovers, new TypeReference<List<Layover>>() {});
        } catch (Exception e) {
            e.printStackTrace();
            return null;
        }
    }

}