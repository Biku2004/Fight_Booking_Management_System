package com.flight.flight_booking_management_system.Admin;


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
import java.sql.*;
import java.io.File;
import java.io.IOException;

import jakarta.servlet.http.HttpSession;
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
//    private static final String JSON_FILE_PATH = "D:/Study/Java1/Maven/5_project/Flight_Booking_Management_System/src/main/resources/JsonData/file.json";

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
                    "&currency=USD&hl=en&api_key=2e6ff4c799c82804bf56ffd1e046a88d9727e21c78a087394d81c43e5cf7e36b";
        } else {
            // One-way flight search
            apiUrl = "https://serpapi.com/search?engine=google_flights&departure_id=" + from +
                    "&arrival_id=" + to +
                    "&outbound_date=" + departure +
                    "&type=2&currency=INR&hl=en&api_key=2e6ff4c799c82804bf56ffd1e046a88d9727e21c78a087394d81c43e5cf7e36b";
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
        storeFlightsInDatabase(fileContent,request,response);

        // Parse and store the flights in the database
//        storeFlightsInDatabase(jsonResponse);

        request.setAttribute("flightData", jsonResponse);
        request.setAttribute("tripType", tripType);

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
        // Ensure the directories exist
        if (!file.getParentFile().exists()) {
            file.getParentFile().mkdirs(); // Create directories if they don't exist
        }

        if (!file.exists()) {
            file.createNewFile();  // Create the file if it doesn't exist
        }

        JSONObject json = new JSONObject(jsonResponse);
        String prettyJson = json.toString(4); // Indent with 4 spaces for pretty-printing

        try (BufferedWriter writer = new BufferedWriter(new FileWriter(file))) {
            writer.write(prettyJson);  // Write the JSON data to the file
        }
    }


    private void storeFlightsInDatabase(String fileContent, HttpServletRequest request, HttpServletResponse response) throws IOException {
        try {
            JSONObject jsonObject = new JSONObject(fileContent);
            JSONArray rootArray = jsonObject.getJSONArray("other_flights");

            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
                String insertSQL = "INSERT INTO flights1 (departure_name, departure_id, departure_time, arrival_name, arrival_id, arrival_time, duration, airplane, airline, airline_logo, travel_class, flight_number, legroom, extensions, total_duration, carbon_emissions, price, type, booking_token, layovers) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                String checkSQL = "SELECT COUNT(*) FROM flights1 WHERE departure_id = ? AND arrival_id = ? AND departure_time = ? AND arrival_time = ? AND flight_number = ?";

                for (int i = 0; i < rootArray.length(); i++) {
                    JSONObject rootObject = rootArray.getJSONObject(i);

                    int totalDuration = rootObject.optInt("total_duration", 0);
                    JSONObject carbonEmissions = rootObject.optJSONObject("carbon_emissions");
                    float carbonEmissionsThisFlight = (carbonEmissions != null) ? (float) carbonEmissions.optDouble("this_flight", 0.0) : 0.0f;
                    int price = rootObject.optInt("price", -1); // Default to -1 if price is not available
                    String type = rootObject.optString("type");
                    String bookingToken = rootObject.optString("booking_token");

                    JSONArray layoversArray = rootObject.optJSONArray("layovers");
                    StringBuilder layoversBuilder = new StringBuilder();
                    if (layoversArray != null) {
                        for (int j = 0; j < layoversArray.length(); j++) {
                            JSONObject layover = layoversArray.getJSONObject(j);
                            int layoverDuration = layover.optInt("duration", 0);
                            String layoverName = layover.optString("name", "N/A");
                            String layoverId = layover.optString("id", "N/A");
                            layoversBuilder.append(String.format("{\"duration\": %d, \"name\": \"%s\", \"id\": \"%s\"}", layoverDuration, layoverName, layoverId));
                            if (j < layoversArray.length() - 1) {
                                layoversBuilder.append(",");
                            }
                        }
                    }
                    String layovers = "[" + layoversBuilder + "]";

                    JSONArray flightsArray = rootObject.optJSONArray("flights");

                    for (int j = 0; j < flightsArray.length(); j++) {
                        JSONObject flightJson = flightsArray.getJSONObject(j);
                        JSONObject departureAirport = flightJson.optJSONObject("departure_airport");
                        JSONObject arrivalAirport = flightJson.optJSONObject("arrival_airport");

                        String departureName = (departureAirport != null) ? departureAirport.optString("name", "N/A") : "N/A";
                        String departureId = (departureAirport != null) ? departureAirport.optString("id", "N/A") : "N/A";
                        String departureTime = (departureAirport != null) ? departureAirport.optString("time", "N/A") : "N/A";

                        String arrivalName = (arrivalAirport != null) ? arrivalAirport.optString("name", "N/A") : "N/A";
                        String arrivalId = (arrivalAirport != null) ? arrivalAirport.optString("id", "N/A") : "N/A";
                        String arrivalTime = (arrivalAirport != null) ? arrivalAirport.optString("time", "N/A") : "N/A";

                        int duration = flightJson.optInt("duration", 0);
                        String airplane = flightJson.optString("airplane", "N/A");
                        String airline = flightJson.optString("airline", "N/A");
                        String airlineLogo = flightJson.optString("airline_logo", "N/A");
                        String travelClass = flightJson.optString("travel_class", "N/A");
                        String flightNumber = flightJson.optString("flight_number", "N/A");
                        String legroom = flightJson.optString("legroom", "N/A");
                        JSONArray extensions = flightJson.optJSONArray("extensions");

                        // Check for duplicate entries
                        try (PreparedStatement checkStmt = conn.prepareStatement(checkSQL)) {
                            checkStmt.setString(1, departureId);
                            checkStmt.setString(2, arrivalId);
                            checkStmt.setString(3, departureTime);
                            checkStmt.setString(4, arrivalTime);
                            checkStmt.setString(5, flightNumber);

                            try (ResultSet rs = checkStmt.executeQuery()) {
                                if (rs.next() && rs.getInt(1) > 0) {
                                    // Duplicate entry found, skip insertion
                                    continue;
                                }
                            }
                        }

                        // Insert new flight record
                        try (PreparedStatement pstmt = conn.prepareStatement(insertSQL)) {
                            pstmt.setString(1, departureName);
                            pstmt.setString(2, departureId);
                            pstmt.setString(3, departureTime);
                            pstmt.setString(4, arrivalName);
                            pstmt.setString(5, arrivalId);
                            pstmt.setString(6, arrivalTime);
                            pstmt.setInt(7, duration);
                            pstmt.setString(8, airplane);
                            pstmt.setString(9, airline);
                            pstmt.setString(10, airlineLogo);
                            pstmt.setString(11, travelClass);
                            pstmt.setString(12, flightNumber);
                            pstmt.setString(13, legroom);
                            pstmt.setString(14, (extensions != null) ? extensions.toString() : "[]");
                            pstmt.setInt(15, totalDuration);
                            pstmt.setFloat(16, carbonEmissionsThisFlight);
                            pstmt.setInt(17, price);
                            pstmt.setString(18, type);
                            pstmt.setString(19, bookingToken);
                            pstmt.setString(20, layovers);

                            pstmt.executeUpdate();
                        }
                    }
                }
            }
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        redirectToFetchDataToTable(request, response);
    }

    private void redirectToFetchDataToTable(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String date = request.getParameter("departure");

        HttpSession session = request.getSession();
        session.setAttribute("lastSearchFrom", from);
        session.setAttribute("lastSearchTo", to);
        session.setAttribute("lastSearchDate", date);

        response.sendRedirect(request.getContextPath() + "/fetchDataToTable?from=" + from + "&to=" + to+"&date="+date);
    }

}



