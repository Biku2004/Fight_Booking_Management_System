<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 29-09-2024
  Time: 23:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #ff0000, #ffffff);
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
        .error-container {
            background-color: #ffebee; /* Lighter red for the container */
            padding: 30px;
            border: 2px solid #f44336; /* Stronger border color */
            border-radius: 8px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2); /* Shadow for depth */
            animation: fadeIn 0.5s; /* Animation for a smooth appearance */
        }
        h1 {
            font-size: 28px; /* Larger font size for the header */
            margin-bottom: 15px;
            color: #d8000c; /* Consistent strong red */
        }
        p {
            font-size: 20px; /* Larger font size for the paragraph */
            margin: 5px 0;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
            to {
                opacity: 1;
            }
        }
        .btn {
            display: inline-block;
            margin-top: 20px;
            padding: 10px 20px;
            background-color: #d8000c; /* Button background color */
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s ease, transform 0.2s ease; /* Transition for hover effect */
        }
        .btn:hover {
            background-color: #b0000a; /* Darker red on hover */
            transform: scale(1.05); /* Slightly scale up on hover */
        }
    </style>
</head>
<body>
<div class="error-container">
    <h1>Error</h1>
    <p>Oops! Something went wrong.</p>
    <p>Please try again later.</p>
    <a href="<%=request.getContextPath()%>" class="btn">Go Back Home</a> <!-- Added a button to return home -->
</div>
</body>
</html>
