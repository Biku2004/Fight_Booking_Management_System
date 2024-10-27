<%--
  Created by IntelliJ IDEA.
  User: Atkum
  Date: 23-08-2024
  Time: 01:00
  To change this template use File | Settings | File Templates.
--%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Add Flight Error</title>
  <link rel="stylesheet" href="">
  <style>

    body {
      font-family: Arial, sans-serif;
      background-color: #e6f0ff;
      margin: 0;
      padding: 0;
    }

    header {
      background-color: #008cba;
      padding: 15px 0;
    }

    nav {
      display: flex;
      justify-content: center;
      align-items: center;
    }

    nav a {
      text-decoration: none;
      font-size: 18px;
      color: white;
      padding: 10px 20px;
      margin: 0 15px;
      border-radius: 5px;
      transition: background-color 0.3s ease;
    }

    nav a:hover {
      background-color: #005f5f;
    }

    .error-container {
      width: 80%;
      max-width: 600px;
      margin: auto;
      background-color: #ffffff;
      padding: 30px;
      border-radius: 10px;
      box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
      text-align: center;
    }

    h1 {
      color: #ff0000;
    }

    p {
      color: #333333;
    }

    .back-button {
      display: inline-block;
      margin-top: 20px;
      padding: 10px 15px;
      background-color: #008cba;
      color: white;
      border-radius: 5px;
      text-decoration: none;
    }

    .back-button:hover {
      background-color: #005f5f;
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

<div class="error-container">
  <h1>Error Adding Flight</h1>
  <p>There was an issue while trying to add the flight. Please check the details and try again.</p>


<%--  <% if (request.getAttribute("errorMessage") != null) { %>--%>
<%--  <p><strong><%= request.getAttribute("errorMessage") %></strong></p>--%>
<%--  <% } %>--%>

  <a class="back-button" href="../Admin/HomeAdmin.jsp">Go Back</a>
</div>
</body>
</html>


