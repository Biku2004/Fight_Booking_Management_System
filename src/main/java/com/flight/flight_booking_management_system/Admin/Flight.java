package com.flight.flight_booking_management_system.Admin;

import java.sql.Timestamp;

public class Flight {
    private int id;
    private String flightNumber;
    private String airline;

    public String getDepartureAirport() {
        return departureAirport;
    }

    public void setDepartureAirport(String departureAirport) {
        this.departureAirport = departureAirport;
    }

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

    public float getCarbonEmissions() {
        return carbonEmissions;
    }

    public void setCarbonEmissions(float carbonEmissions) {
        this.carbonEmissions = carbonEmissions;
    }

    public Timestamp getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Timestamp createdAt) {
        this.createdAt = createdAt;
    }

    private String departureAirport;
    private String arrivalAirport;
    private int duration;
    private String airplane;
    private String legroom;
    private String extensions;
    private String travelClass;
    private int layoversDuration;
    private float carbonEmissions;
    private java.sql.Timestamp createdAt;


}
