<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 29-09-2024
  Time: 23:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
  <title>Search Booking</title>
  <style>
    body {
      font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
      background: linear-gradient(135deg, #33A1FF, #6DD5FA, #ffffff);
      background-size: 400% 400%;
      animation: gradientAnimation 10s ease infinite;
      margin: 0;
      padding: 0;
    }

    @keyframes gradientAnimation {
      0%, 100% {
        background-position: 0% 50%;
      }
      50% {
        background-position: 100% 50%;
      }
    }

    /* New fade-in animation */
    @keyframes fadeIn {
      0% {
        opacity: 0;
        transform: translateY(30px); /* Slide from below */
      }
      100% {
        opacity: 1;
        transform: translateY(0); /* Set it in place */
      }
    }

    .container {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      padding: 20px;
    }

    .form-container {
      max-width: 400px;
      width: 100%;
      background: white;
      padding: 40px;
      border-radius: 16px;
      box-shadow: 0 6px 30px rgba(0, 0, 0, 0.15);
      text-align: center;
      opacity: 0; /* Initial opacity for fade-in */
      animation: fadeIn 1.5s ease forwards; /* Fade-in effect */
    }

    .form-container:hover {
      transform: translateY(-5px);
    }

    h2 {
      color: #333;
      font-size: 2em;
      margin-bottom: 30px;
      letter-spacing: 0.5px;
    }

    label {
      display: block;
      margin-bottom: 12px;
      font-size: 1.1em;
      color: #555;
    }

    input[type="text"] {
      width: 100%;
      padding: 14px;
      margin: 15px 0 25px 0;
      border: 1px solid #ced4da;
      border-radius: 8px;
      font-size: 1.1em;
      box-sizing: border-box;
      transition: border-color 0.3s ease, box-shadow 0.3s ease;
    }

    input[type="text"]:focus {
      border-color: #007bff;
      box-shadow: 0 0 8px rgba(0, 123, 255, 0.2);
      outline: none;
    }

    input[type="submit"] {
      background-color: #007bff;
      color: white;
      padding: 14px 20px;
      border: none;
      border-radius: 8px;
      cursor: pointer;
      width: 100%;
      font-size: 1.1em;
      transition: background-color 0.3s ease, transform 0.2s ease;
      box-shadow: 0 4px 12px rgba(0, 123, 255, 0.3);
    }

    input[type="submit"]:hover {
      background-color: #0056b3;
      transform: scale(1.05);
    }

    input[type="submit"]:active {
      background-color: #004080;
      transform: scale(1);
    }
  </style>


</head>
<body>
<div class="container">
  <div class="form-container">
    <h2>Search Booking by Flight Number</h2>
    <form action="<%=request.getContextPath()%>/ViewPassenger/BookingServlet" method="get">
      <label for="flightNumber">Flight Number:</label>
      <input type="text" name="flightNumber" id="flightNumber" required>
      <input type="submit" value="Search">
    </form>
  </div>
</div>
</body>
</html>
