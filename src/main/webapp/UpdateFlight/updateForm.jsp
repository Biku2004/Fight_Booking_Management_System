<%@ page import="com.flight.flight_booking_management_system.Admin.Admin" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Admin Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(to right, #e0f7fa, #80deea);
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .container {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            padding: 40px;
            width: 100%;
            max-width: 500px;
        }

        h1 {
            color: #00796b;
            text-align: center;
            margin-bottom: 20px;
        }

        label {
            font-weight: bold;
            margin-bottom: 8px;
            display: block;
            color: #555;
        }

        input[type="text"],
        input[type="date"],
        select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            font-size: 16px;
            transition: border-color 0.3s;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #00796b;
            outline: none;
        }

        input[type="submit"] {
            background-color: #00796b;
            color: white;
            border: none;
            padding: 12px 20px;
            text-align: center;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s;
        }

        input[type="submit"]:hover {
            background-color: #005b4f;
        }

        p {
            text-align: center;
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>Update Admin Details</h1>

    <%-- Check if the admin object is present --%>
    <% Admin admin = (Admin) request.getAttribute("admin"); %>
    <% if (admin != null) { %>
    <form action="updateAdmin" method="post">
        <input type="hidden" name="email" value="<%= admin.getEmail() %>">

        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName" placeholder="First Name" value="<%= admin.getFirstName() %>" required>

        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName" placeholder="Last Name" value="<%= admin.getLastName() %>" required>

        <label for="phoneNumber">Phone Number:</label>
        <input type="text" id="phoneNumber" name="phoneNumber" placeholder="Phone Number" value="<%= admin.getPhoneNumber() %>" required>

        <label for="country">Country:</label>
        <input type="text" id="country" name="country" placeholder="e.g: India" value="<%= admin.getNationality() %>" required>

        <label for="gender">Gender:</label>
        <select id="gender" name="gender" required>
            <option value="">Select Gender</option>
            <option value="Male" <%= "Male".equals(admin.getGender()) ? "selected" : "" %>>Male</option>
            <option value="Female" <%= "Female".equals(admin.getGender()) ? "selected" : "" %>>Female</option>
            <option value="Other" <%= "Other".equals(admin.getGender()) ? "selected" : "" %>>Other</option>
        </select>

        <label for="dob">Date of Birth:</label>
        <input type="date" id="dob" name="dob" value="<%= admin.getDateOfBirth() %>" required>

        <input type="submit" value="Update Admin">
    </form>
    <% } else { %>
    <p>Admin details could not be retrieved.</p>
    <% } %>
</div>
</body>
</html>
