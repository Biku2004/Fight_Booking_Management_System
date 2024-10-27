<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 25-08-2024
  Time: 12:41
  To change this template use File | Settings | File Templates.
--%>
<%--<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%--<!DOCTYPE html>--%>
<%--<html lang="en">--%>
<%--<head>--%>
<%--    <meta charset="UTF-8">--%>
<%--    <title>Flight Modification Success</title>--%>
<%--    <link rel="stylesheet" href="../cssFile/styles.css"> <!-- Assuming you have a styles.css for styling -->--%>
<%--    <style>--%>
<%--        body {--%>
<%--            font-family: Arial, sans-serif;--%>
<%--            background-color: #f4f4f9;--%>
<%--            display: flex;--%>
<%--            justify-content: center;--%>
<%--            align-items: center;--%>
<%--            height: 100vh;--%>
<%--            margin: 0;--%>
<%--        }--%>

<%--        .container {--%>
<%--            text-align: center;--%>
<%--            background-color: #fff;--%>
<%--            padding: 30px;--%>
<%--            border-radius: 8px;--%>
<%--            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);--%>
<%--            max-width: 400px;--%>
<%--            width: 100%;--%>
<%--        }--%>

<%--        h1 {--%>
<%--            color: #4caf50; /* Green color for success message */--%>
<%--            font-size: 24px;--%>
<%--            margin-bottom: 20px;--%>
<%--        }--%>

<%--        p {--%>
<%--            color: #333;--%>
<%--            font-size: 18px;--%>
<%--            margin-bottom: 30px;--%>
<%--        }--%>

<%--        a.button {--%>
<%--            display: inline-block;--%>
<%--            padding: 10px 20px;--%>
<%--            font-size: 16px;--%>
<%--            color: #fff;--%>
<%--            background-color: #4caf50; /* Same green color */--%>
<%--            text-decoration: none;--%>
<%--            border-radius: 5px;--%>
<%--            margin: 5px;--%>
<%--        }--%>

<%--        a.button:hover {--%>
<%--            background-color: #45a049; /* Darker green on hover */--%>
<%--        }--%>
<%--    </style>--%>
<%--</head>--%>
<%--<body>--%>
<%--<div class="container">--%>
<%--    <h1>Flight Modification Successful!</h1>--%>
<%--    <p>The flight details have been successfully updated in the database.</p>--%>
<%--    <a class="button" href="../Admin/HomeAdmin.jsp">Return to Dashboard</a>--%>
<%--    <a class="button" href="modifyFlight.jsp">Modify Another Flight</a>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>


<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Flight Modification Error</title>

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

    <a class="button" href="modifyFlight.jsp">Try Again</a>
    <a class="button" href="../Admin/HomeAdmin.jsp">Return to Dashboard</a>
</div>

</body>
</html>
