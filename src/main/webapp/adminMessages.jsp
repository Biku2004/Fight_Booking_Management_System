<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 02-11-2024
  Time: 15:06
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.sql.*" %>
<%@ page import="com.flight.flight_booking_management_system.LoginRegister.DatabaseConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Admin - Manage Messages</title>
    <style>
        /* Styling for the entire body */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
            text-align: center;
        }

        /* Header for the messages table */
        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        /* Table styling */
        table {
            width: 80%;
            margin: 0 auto;
            border-collapse: collapse;
            background-color: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Table headers styling */
        th {
            background-color: #4CAF50;
            color: white;
            padding: 12px;
            text-align: left;
            font-weight: bold;
        }

        /* Table cells styling */
        td {
            padding: 12px;
            text-align: center;
            border-bottom: 1px solid #ddd;
            color: #333;
        }

        /* Row hover effect */
        tr:hover {
            background-color: #f1f1f1;
        }

        /* Styling for delete button */
        button {
            padding: 8px 12px;
            font-size: 14px;
            color: white;
            background-color: #f44336; /* Red for delete action */
            border: none;
            border-radius: 4px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        /* Button hover effect */
        button:hover {
            background-color: #d32f2f; /* Darker red on hover */
        }

        /* Alternate row colors */
        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

    </style>
</head>
<body>
<h2>Messages</h2>
<table border="1">
    <tr>
        <th>ID</th>
        <th>Name</th>
        <th>Email</th>
        <th>Message</th>
        <th>Timestamp</th>
        <th>Action</th>
    </tr>

    <%
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT * FROM messages";
            Statement stmt = conn.createStatement();
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                String email = rs.getString("email");
                String message = rs.getString("message");
                String timestamp = rs.getString("timestamp");
    %>
    <tr>
        <td><%= id %></td>
        <td><%= name %></td>
        <td><%= email %></td>
        <td><%= message %></td>
        <td><%= timestamp %></td>
        <td>
            <form action="deleteMessage" method="post">
                <input type="hidden" name="id" value="<%= id %>">
                <button type="submit">Delete</button>
            </form>
        </td>
    </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
    %>
</table>
</body>
</html>