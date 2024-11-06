<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 25-08-2024
  Time: 12:47
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flight Modification Error</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #e6f0ff; /* Background color */
            margin: 0;
            padding: 0;
        }

        header {
            background-color: #008cba; /* Navbar background */
            padding: 15px 0; /* Padding for navbar */
        }

        nav {
            display: flex;
            justify-content: center; /* Centering nav items */
            align-items: center; /* Vertically center items */
        }

        nav a {
            text-decoration: none;
            font-size: 18px;
            color: white; /* Text color */
            padding: 10px 20px; /* Padding around links */
            margin: 0 15px; /* Margin between links */
            border-radius: 5px; /* Rounded corners */
            transition: background-color 0.3s ease; /* Smooth transition effect */
        }

        nav a:hover {
            background-color: #005f5f; /* Darker shade on hover */
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            margin: auto; /* Center the container */
            margin-top: 50px; /* Space from top */
        }

        h1 {
            color: #ff0000; /* Red color for error message */
            font-size: 24px;
            margin-bottom: 20px;
        }

        p {
            color: #333;
            font-size: 18px;
            margin-bottom: 30px;
        }

        a.button {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: #fff;
            background-color: #ff0000; /* Red color for error button */
            text-decoration: none;
            border-radius: 5px;
            margin: 5px;
        }

        a.button:hover {
            background-color: #cc0000; /* Darker red on hover */
        }
    </style>
</head>
<body>

<header>
    <nav>
        <a href="../Admin/HomeAdmin.jsp">SkyWay</a>
        <a href="../ViewPassenger/searchBooking.jsp">Passenger</a>
        <a href="../bookFlight/tickets.jsp">Ticket</a>
        <a href="../Admin/adminregd.jsp">Admin</a>
        <a href="../Admin/adminDelete.jsp">Delete Admin</a>
    </nav>
</header>

<div class="container">
    <h1>Error Modifying Flight!</h1>
    <p>There was an issue while trying to modify the flight details. Please check the information and try again.</p>

    <%-- Optionally display specific error messages --%>
    <% if (request.getAttribute("errorMessage") != null) { %>
    <p><strong><%= request.getAttribute("errorMessage") %></strong></p>
    <% } %>

    <a class="button" href="${pageContext.request.contextPath}/modifyFlight/modifyFlight.jsp">Try Again</a>
    <a class="button" href="${pageContext.request.contextPath}/Admin/HomeAdmin.jsp">Return to Dashboard</a>
</div>

</body>
</html>
