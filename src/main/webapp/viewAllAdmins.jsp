<%--
  Created by IntelliJ IDEA.
  User: rbstu
  Date: 25-08-2024
  Time: 20:31
  To change this template use File | Settings | File Templates.
--%>
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
    </tbody>
</table>

<p><a href="HomeAdmin.jsp">Back To Home</a></p>
</body>
</html>
