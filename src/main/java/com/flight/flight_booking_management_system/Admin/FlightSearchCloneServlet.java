package com.flight.flight_booking_management_system.Admin;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;
import java.io.File;
import java.io.IOException;

import org.json.JSONArray;
import org.json.JSONObject;

@WebServlet("/flightSearchClone")
public class FlightSearchCloneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/flightregd";
    private static final String DB_USER = "Java-Project";
    private static final String DB_PASSWORD = "root@localhost";
//    private static final String JSON_FILE_PATH = "D:/Study/Java1/Maven/file.json";
    private static final String JSON_FILE_PATH = "D:/Study/Java1/Maven/5_project/Flight_Booking_Management_System/src/main/resources/JsonData/file.json";

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departure = request.getParameter("departure");
        String returnDate = request.getParameter("return");
        String tripType = request.getParameter("trip");

        String apiUrl;

        if ("roundtrip".equalsIgnoreCase(tripType.trim())) {
            // Two-way flight search
            apiUrl = "https://serpapi.com/search.json?engine=google_flights&departure_id=" + from +
                    "&arrival_id=" + to +
                    "&outbound_date=" + departure +
                    "&return_date=" + returnDate +
                    "&currency=USD&hl=en&api_key=1efb9512df0ef6d56fa82a5a49da7d1f7c6a55a06cc167b712f0811ee3747d25";
        } else {
            // One-way flight search
            apiUrl = "https://serpapi.com/search?engine=google_flights&departure_id=" + from +
                    "&arrival_id=" + to +
                    "&outbound_date=" + departure +
                    "&type=2&currency=INR&hl=en&api_key=1efb9512df0ef6d56fa82a5a49da7d1f7c6a55a06cc167b712f0811ee3747d25";
        }

        // Fetch flight data from the API
        URL url = new URL(apiUrl);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");

        // Read the response
        BufferedReader in = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        StringBuilder responseBuilder = new StringBuilder();
        String line;
        while ((line = in.readLine()) != null) {
            responseBuilder.append(line);
        }
        in.close();

        // Convert the response to JSON
        String jsonResponse = responseBuilder.toString();

        // Print the JSON response

        System.out.println("JSON Response: " + jsonResponse);
        saveJsonToFile(jsonResponse, JSON_FILE_PATH);

        // Read the JSON file and insert data into the database
        String fileContent = new String(Files.readAllBytes(Paths.get(JSON_FILE_PATH)));
        storeFlightsInDatabase(fileContent);

        // Parse and store the flights in the database
        storeFlightsInDatabase(jsonResponse);

        request.setAttribute("flightData", jsonResponse);
        request.setAttribute("tripType", tripType);

        // Forward to JSP page
        String jspPage = "Admin/allFile.jsp";
        RequestDispatcher dispatcher = request.getRequestDispatcher(jspPage);
        dispatcher.forward(request, response);

        System.out.println("Trip Type: " + tripType);
    }

    public static class FilePermission {
        public static void main(String[] args) {
            File file = new File("D:/Study/Java1/Maven/5_project/Flight_Booking_Management_System/src/main/resources/JsonData/file.json");

            // Check if file exists
            if (!file.exists()) {
                try {
                    file.createNewFile();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }

            // Set read and write permissions
            boolean isReadable = file.setReadable(true);
            boolean isWritable = file.setWritable(true);

            if (isReadable && isWritable) {
                System.out.println("File permissions set successfully.");
            } else {
                System.out.println("Failed to set file permissions.");
            }
        }
    }
    private void saveJsonToFile(String jsonResponse, String filePath) throws IOException {
        File file = new File(filePath);
        if (!file.exists()) {
            file.createNewFile();
        }
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            writer.write(jsonResponse);
        }
    }
    private void storeFlightsInDatabase(String jsonResponse) {
        try {
            JSONObject jsonObject = new JSONObject(jsonResponse);
            JSONArray flightsArray = jsonObject.getJSONArray("other_flights");

            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish database connection
            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String insertSQL = "INSERT INTO flights (flight_number, airline, departure_airport, arrival_airport, duration, airplane, legroom, extensions, travel_class, layovers_duration, carbon_emissions) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

                for (int i = 0; i < flightsArray.length(); i++) {
                    JSONObject flightJson = flightsArray.getJSONObject(i).getJSONArray("flights").getJSONObject(0);
                    String flightNumber = flightJson.getString("flight_number");
                    String airline = flightJson.getString("airline");
                    String departureAirport = flightJson.getJSONObject("departure_airport").getString("name");
                    String arrivalAirport = flightJson.getJSONObject("arrival_airport").getString("name");
                    int duration = flightJson.getInt("duration");
                    String airplane = flightJson.optString("airplane", "N/A");
                    String legroom = flightJson.optString("legroom", "N/A");
                    String extensions = flightJson.optString("extensions", "N/A");
                    String travelClass = flightJson.optString("travel_class", "N/A");
                    int layoversDuration = flightJson.optJSONArray("layovers") != null ? flightJson.getJSONArray("layovers").getJSONObject(0).getInt("duration") : 0;
                    float carbonEmissions = flightJson.optJSONObject("carbon_emissions") != null ? (float) flightJson.getJSONObject("carbon_emissions").getDouble("this_flight") : 0.0f;

                    try (PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {
                        pstmt.setString(1, flightNumber);
                        pstmt.setString(2, airline);
                        pstmt.setString(3, departureAirport);
                        pstmt.setString(4, arrivalAirport);
                        pstmt.setInt(5, duration);
                        pstmt.setString(6, airplane);
                        pstmt.setString(7, legroom);
                        pstmt.setString(8, extensions);
                        pstmt.setString(9, travelClass);
                        pstmt.setInt(10, layoversDuration);
                        pstmt.setFloat(11, carbonEmissions);

                        pstmt.executeUpdate();
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } catch (ClassNotFoundException e) {
            throw new RuntimeException(e);
        }
    }
}



