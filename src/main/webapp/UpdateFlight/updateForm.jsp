<%@ page import="com.flight.flight_booking_management_system.Admin.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Admin Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(to right, #ffffff, #63fadd);
            background-size: 400% 400%;
            animation: gradientAnimation 10s ease infinite;
        }
        @keyframes gradientAnimation {
            0% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
            100% {
                background-position: 0% 50%;
            }
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            max-width: 600px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 8px;
        }
        input[type="text"],
        input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 16px;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            border: none;
            padding: 10px 20px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        p {
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>
<h1>Update Admin Details</h1>

<%-- Check if the admin object is present --%>
<% Admin admin = (Admin) request.getAttribute("admin"); %>
<% if (admin != null) { %>
<form action="updateAdmin" method="post">
    <input type="hidden" name="email" value="<%= admin.getEmail() %>">

    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" placeholder="First Name" value="<%= admin.getFirstName() %>" required><br>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" placeholder="Last Name" value="<%= admin.getLastName() %>" required><br>

    <label for="phoneNumber">Phone Number:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Phone Number" value="<%= admin.getPhoneNumber() %>" required><br>

    <label for="country">Country:</label>
    <input type="text" id="country" name="country" placeholder="e.g:India" value="<%= admin.getNationality() %>" required><br>

    <label for="gender">Gender:</label>
    <select id="gender" name="gender" required>
        <option value="">Select Gender</option>
        <option value="Male" <%= "Male".equals(admin.getGender()) ? "selected" : "" %>>Male</option>
        <option value="Female" <%= "Female".equals(admin.getGender()) ? "selected" : "" %>>Female</option>
        <option value="Other" <%= "Other".equals(admin.getGender()) ? "selected" : "" %>>Other</option>
    </select><br>

    <label for="dob">Date of Birth:</label>
    <input type="date" id="dob" name="dob" value="<%= admin.getDateOfBirth() %>" required><br>

    <input type="submit" value="Update Admin">
</form>
<% } else { %>
<p>Admin details could not be retrieved.</p>
<% } %>
</body>
</html>
