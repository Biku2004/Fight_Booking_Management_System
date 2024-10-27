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

  <!-- Optionally display specific error messages -->
  <% if (request.getAttribute("errorMessage") != null) { %>
  <p><strong><%= request.getAttribute("errorMessage") %></strong></p>
  <% } %>

  <a class="back-button" href="../Admin/HomeAdmin.jsp">Go Back</a>
</div>
</body>
</html>


