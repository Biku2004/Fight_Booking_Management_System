<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Success</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
            text-align: center;
        }
        h1 {
            color: #333;
        }
        p {
            font-size: 18px;
            color: #4CAF50; /* Green for success messages */
            margin: 20px 0;
        }
        a {
            display: inline-block;
            padding: 10px 20px;
            font-size: 16px;
            color: white;
            background-color: #007BFF; /* Blue color for the button */
            text-decoration: none;
            border-radius: 4px;
        }
        a:hover {
            background-color: #0056b3; /* Darker blue for hover effect */
        }
    </style>
</head>
<body>
<h1>Update Status</h1>
<p><%= request.getAttribute("message") %></p>
<a href="../Admin/HomeAdmin.jsp">Go To Admin Home 🏠</a>
</body>
</html>
