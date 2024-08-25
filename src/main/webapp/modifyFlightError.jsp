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
    <title>Flight Modification Failed</title>
    <link rel="stylesheet" href="styles.css"> <!-- Assuming you have a styles.css for styling -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            text-align: center;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
        }

        h1 {
            color: #f44336; /* Red color for error message */
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
            background-color: #f44336; /* Same red color */
            text-decoration: none;
            border-radius: 5px;
            margin: 5px;
        }

        a.button:hover {
            background-color: #d32f2f; /* Darker red on hover */
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Flight Modification Failed</h1>
    <p>There was an error while trying to update the flight details. Please try again.</p>
    <a class="button" href="HomeAdmin.jsp.jsp">Return to Dashboard</a>
    <a class="button" href="modifyFlight.jsp">Try Again</a>
</div>
</body>
</html>

