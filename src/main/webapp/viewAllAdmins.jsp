<%@ page import="com.flight.flight_booking_management_system.Admin" %>
<%@ page import="java.util.List" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View All Admins</title>
    <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
<h1>All Registered Admins</h1>

<table>
    <thead>
    <tr>
        <th>First Name</th>
        <th>Last Name</th>
        <th>Email</th>
        <th>Phone Number</th>
        <th>Country</th>
        <th>Gender</th>
        <th>Date of Birth</th>
    </tr>
    </thead>
    <tbody>
    <%
        List<Admin> admins = (List<Admin>) request.getAttribute("admins");
        if (admins != null && !admins.isEmpty()) {
            for (Admin admin : admins) {
    %>
    <tr>
        <td><%= admin.getFirstName() %></td>
        <td><%= admin.getLastName() %></td>
        <td><%= admin.getEmail() %></td>
        <td><%= admin.getPhoneNumber() %></td>
        <td><%= admin.getNationality() %></td>
        <td><%= admin.getGender() %></td>
        <td><%= admin.getDateOfBirth() %></td>
    </tr>
    <%
        }
    } else {
    %>
    <tr>
        <td colspan="7">No admins found.</td>
    </tr>
    <%
        }
    %>
    </tbody>
</table>

<p><a href="HomeAdmin.jsp">Back To Home</a></p>
</body>
</html>
