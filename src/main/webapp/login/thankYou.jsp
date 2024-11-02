<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 02-11-2024
  Time: 15:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <title>Thank You</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
      background-color: #f4f4f4;
      justify-content: center; /* Center horizontally */
      align-items: center;
      text-align: center;
    }
    .container {
      max-width: 600px;
      margin: 50px auto;
      padding: 20px;
      background-color: white;
      border-radius: 8px;
      box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
    }
    h1 {
      color: #333;
      margin-bottom: 10px;
    }
    p {
      font-size: 18px;
      color: #4CAF50; /* Green for success messages */
      margin: 20px 0;
    }
    a {
      display: inline-block;
      padding: 12px 24px;
      font-size: 16px;
      color: white;
      background-color: #007BFF; /* Blue color for the button */
      text-decoration: none;
      border-radius: 4px;
      transition: background-color 0.3s ease, transform 0.3s ease;
    }
    a:hover {
      background-color: #0056b3; /* Darker blue for hover effect */
      transform: translateY(-2px); /* Lift effect on hover */
    }
  </style>
</head>
<body>
<div class="container">
  <h1>Thank You!</h1>
  <p>Your message has been received. We will get back to you soon.</p>
  <a href="home.jsp">Return to Home 🏠</a>
</div>
</body>
</html>