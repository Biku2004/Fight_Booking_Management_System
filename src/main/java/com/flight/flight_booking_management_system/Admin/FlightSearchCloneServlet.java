package com.flight.flight_booking_management_system.Admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.json.JSONArray;
import org.json.JSONObject;

import java.io.*;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.sql.*;

@WebServlet("/flightSearchClone")
public class FlightSearchCloneServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/flightregd";
    private static final String DB_USER = "Java-Project";
    private static final String DB_PASSWORD = "root@localhost";
    private static final String JSON_FILE_PATH = "D:/Study/Java1/Maven/5_project/Flight_Booking_Management_System/src/main/resources/JsonData/file.json";

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


        String from = request.getParameter("from");
        String to = request.getParameter("to");
        String departure = request.getParameter("departure");
        String returnDate = request.getParameter("return");
        String tripType = request.getParameter("trip");

        System.out.println("Trip Type: " + tripType);
        HttpSession session = request.getSession();
        try{
            if (isFlightDataPresent(from, to, departure,session)) {
                redirectToFetchDataToTable(request, response);
            }
            else {
                // Perform the search and save operation
                performSearchAndSave(request, response, session, from, to, departure,returnDate, tripType);
            }
        }catch (Exception e){
            e.printStackTrace();
        }

    }

    private boolean isFlightDataPresent(String from, String to, String departure, HttpSession session) {
        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
            String query = "SELECT COUNT(*) FROM flights1 WHERE departure_id = ? AND arrival_id = ? AND DATE(departure_time) = ?";
            try (PreparedStatement stmt = connection.prepareStatement(query)) {
                stmt.setString(1, from);
                stmt.setString(2, to);
                stmt.setString(3, departure);
//                stmt.setString(4, tripType);

                System.out.println("Executing query: " + stmt);

                try (ResultSet rs = stmt.executeQuery()) {
                    if (rs.next()) {
                        int count = rs.getInt(1);
                        System.out.println("Flight data count: " + count);
                        return count > 0;
                    }
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

//    private void fetchFlightData(String from, String to, String departure, HttpSession session) {
//        try (Connection connection = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD)) {
//            String query = "SELECT * FROM flights1 WHERE departure_id = ? AND arrival_id = ? AND DATE(departure_time) = ?";
//            try (PreparedStatement stmt = connection.prepareStatement(query)) {
//                stmt.setString(1, from);
//                stmt.setString(2, to);
//                stmt.setString(3, departure);
////                stmt.setString(4, returnDate);
////                stmt.setString(4, tripType);
//
//                try (ResultSet rs = stmt.executeQuery()) {
//                    if (rs.next()) {
//                        session.setAttribute("flightNumber", rs.getString("flight_number"));
//                        session.setAttribute("airline", rs.getString("airline"));
//                        session.setAttribute("departure", rs.getString("departure"));
//                        session.setAttribute("arrival", rs.getString("arrival"));
//                        session.setAttribute("departureTime", rs.getString("departure_time"));
//                        session.setAttribute("arrivalTime", rs.getString("arrival_time"));
//                        session.setAttribute("airplane", rs.getString("airplane"));
//                        session.setAttribute("legroom", rs.getString("legroom"));
//                        session.setAttribute("extensions", rs.getString("extensions"));
//                        session.setAttribute("travelClass", rs.getString("travel_class"));
//                        session.setAttribute("duration", rs.getString("duration"));
//                        session.setAttribute("layovers", rs.getString("layovers"));
//                        session.setAttribute("price", rs.getString("price"));
//                        session.setAttribute("carbonEmissions", rs.getString("carbon_emissions"));
//                    }
//                }
//            }
//        } catch (SQLException e) {
//            e.printStackTrace();
//        }
//    }

    private void performSearchAndSave(HttpServletRequest request, HttpServletResponse response, HttpSession session, String from, String to, String departure, String returnDate, String tripType) throws IOException {
        String apiUrl;

        if ("roundtrip".equalsIgnoreCase(tripType.trim())) {
            // Two-way flight search
            apiUrl = "https://serpapi.com/search.json?engine=google_flights&departure_id=" + from +
                    "&arrival_id=" + to +
                    "&outbound_date=" + departure +
                    "&return_date=" + returnDate +
                    "&currency=USD&hl=en&api_key=0ed4bbbf6e1c9f2ac7ccf7aa01284fe6000075d9f7f0a63f0e6aff0e33c7b653";

        } else {
            // One-way flight search
            apiUrl = "https://serpapi.com/search?engine=google_flights&departure_id=" + from +
                    "&arrival_id=" + to +
                    "&outbound_date=" + departure +
                    "&type=2&currency=INR&hl=en&api_key=0ed4bbbf6e1c9f2ac7ccf7aa01284fe6000075d9f7f0a63f0e6aff0e33c7b653";
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
        storeFlightsInDatabase(fileContent, request, response);

        request.setAttribute("flightData", jsonResponse);
        request.setAttribute("tripType", tripType);
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

                    if (flightsArray != null && flightsArray.length() > 0) {
                        JSONObject firstFlight = flightsArray.getJSONObject(0);
                        JSONObject lastFlight = flightsArray.getJSONObject(flightsArray.length() - 1);

                        JSONObject firstDepartureAirport = firstFlight.optJSONObject("departure_airport");
                        JSONObject lastArrivalAirport = lastFlight.optJSONObject("arrival_airport");

                        String departureName = (firstDepartureAirport != null) ? firstDepartureAirport.optString("name", "N/A") : "N/A";
                        String departureId = (firstDepartureAirport != null) ? firstDepartureAirport.optString("id", "N/A") : "N/A";
                        String departureTime = (firstDepartureAirport != null) ? firstDepartureAirport.optString("time", "N/A") : "N/A";

                        String arrivalName = (lastArrivalAirport != null) ? lastArrivalAirport.optString("name", "N/A") : "N/A";
                        String arrivalId = (lastArrivalAirport != null) ? lastArrivalAirport.optString("id", "N/A") : "N/A";
                        String arrivalTime = (lastArrivalAirport != null) ? lastArrivalAirport.optString("time", "N/A") : "N/A";

                        int duration = 0;
                        String airplane = "";
                        String airline = "";
                        String airlineLogo = "";
                        String travelClass = "";
                        String flightNumber = "";
                        String legroom = "";
                        JSONArray extensions = new JSONArray();

                        for (int j = 0; j < flightsArray.length(); j++) {
                            JSONObject flightJson = flightsArray.getJSONObject(j);
                            duration += flightJson.optInt("duration", 0);
                            airplane = flightJson.optString("airplane", "N/A");
                            airline = flightJson.optString("airline", "N/A");
                            airlineLogo = flightJson.optString("airline_logo", "N/A");
                            travelClass = flightJson.optString("travel_class", "N/A");
                            flightNumber = flightJson.optString("flight_number", "N/A");
                            legroom = flightJson.optString("legroom", "N/A");
                            JSONArray flightExtensions = flightJson.optJSONArray("extensions");
                            if (flightExtensions != null) {
                                for (int k = 0; k < flightExtensions.length(); k++) {
                                    extensions.put(flightExtensions.get(k));
                                }
                            }
                        }

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
                            pstmt.setString(14, extensions.toString());
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

        response.sendRedirect(request.getContextPath() + "/fetchDataToTable?from=" + from + "&to=" + to + "&date=" + date);
    }
}