package com.flight.flight_booking_management_system.LoginRegister;
import java.io.InputStream;
import java.sql.Blob;

public class User {
    private int id;
    private String firstName;
    private String lastName;
    private String email;
    private String password;
    private String phoneNumber;
    private String passportNumber;
    private String nationality;
    private String gender;
    private String dateOfBirth;
    private Blob profilePhoto;

    public User(String firstName, String lastName, String email, String phone, String passportNumber, String nationality, String gender, String dateOfBirth, InputStream inputStream) {
    }

    public User(int id, String firstName, String lastName, String email, String password, String phone, String passportNumber, String nationality, String gender, String dateOfBirth, Blob profilePhoto) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.password = password;
        this.phoneNumber = phone;
        this.passportNumber = passportNumber;
        this.nationality = nationality;
        this.gender = gender;
        this.dateOfBirth = dateOfBirth;
        this.profilePhoto = profilePhoto;
    }

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phoneNumber;
    }

    public void setPhone(String phone) {
        this.phoneNumber = phone;
    }

    public String getPassportNumber() {
        return passportNumber;
    }

    public void setPassportNumber(String passportNumber) {
        this.passportNumber = passportNumber;
    }

    public String getNationality() {
        return nationality;
    }

    public void setNationality(String nationality) {
        this.nationality = nationality;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Blob getProfilePhoto() {
        return profilePhoto;
    }

    public void setProfilePhoto(Blob profilePhoto) {
        this.profilePhoto = profilePhoto;
    }
}
