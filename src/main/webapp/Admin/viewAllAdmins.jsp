<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.flight.flight_booking_management_system.Admin.Admin" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
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
    <c:choose>
        <c:when test="${not empty admins}">
            <c:forEach var="admin" items="${admins}">
                <tr>
                    <td>${admin.firstName}</td>
                    <td>${admin.lastName}</td>
                    <td>${admin.email}</td>
                    <td>${admin.phoneNumber}</td>
                    <td>${admin.nationality}</td>
                    <td>${admin.gender}</td>
                    <td>${admin.dateOfBirth}</td>
                </tr>
            </c:forEach>
        </c:when>
        <c:otherwise>
            <tr>
                <td colspan="7">No admins found.</td>
            </tr>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>

<p><a href="HomeAdmin.jsp">Back To Home</a></p>
</body>
</html>
