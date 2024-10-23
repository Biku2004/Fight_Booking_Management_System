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
            overflow: hidden; /* Prevent scrollbars caused by floating shapes */
        }

        .container {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            padding: 60px;
            width: 100%;
            max-width: 600px;
            position: relative; /* Position relative for absolute positioning of shapes */
            animation: slideIn 0.5s ease forwards;
            z-index: 1; /* Ensure form is above floating shapes */
        }

        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes float {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-15px); /* Adjust the height of the float */
            }
            100% {
                transform: translateY(0);
            }
        }

        .floating-shape {
            position: absolute;
            background-color: rgba(255, 255, 255, 0.25); /* Transparent shapes */
            border-radius: 50%;
            animation: float 6s ease-in-out infinite; /* Apply float animation */
            z-index: 0; /* Ensure shapes are below the form */
        }

        /* Define various shapes */
        .shape1 { width: 100px; height: 100px; top: 10%; left: 10%; }
        .shape2 { width: 80px; height: 80px; top: 20%; right: 15%; }
        .shape3 { width: 120px; height: 120px; bottom: 15%; left: 5%; }
        .shape4 { width: 90px; height: 90px; bottom: 25%; right: 10%; }

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
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus,
        input[type="date"]:focus,
        select:focus {
            border-color: #00796b;
            outline: none;
            box-shadow: 0 0 5px rgba(0, 121, 107, 0.5);
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
            transition: background-color 0.3s, transform 0.2s;
        }

        input[type="submit"]:hover {
            background-color: #005b4f;
            transform: scale(1.05);
        }

        .progress-container {
            width: 100%;
            background-color: #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            height: 8px;
            overflow: hidden; /* Ensure the animation is smooth */
        }

        .progress-bar {
            height: 100%;
            background-color: #00796b;
            width: 0;
            border-radius: 5px;
            transition: width 0.5s ease;
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
    <div class="progress-container">
        <div class="progress-bar" id="progressBar"></div>
    </div>

    <%-- Check if the admin object is present --%>
    <% Admin admin = (Admin) request.getAttribute("admin"); %>
    <% if (admin != null) { %>
    <form action="updateAdmin" method="post" id="updateForm" oninput="updateProgressBar()">
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

<!-- Floating Shapes -->
<div class="floating-shape shape1"></div>
<div class="floating-shape shape2"></div>
<div class="floating-shape shape3"></div>
<div class="floating-shape shape4"></div>

<script>
    function updateProgressBar() {
        const form = document.getElementById('updateForm');
        const progressBar = document.getElementById('progressBar');
        const totalFields = 6; // Total number of fields to track progress
        let filledFields = 0;

        // Count filled fields
        for (let i = 0; i < form.elements.length; i++) {
            if (form.elements[i].type !== "submit" && form.elements[i].value !== "") {
                filledFields++;
            }
        }

        // Calculate progress
        const progressPercentage = (filledFields / totalFields) * 100;
        progressBar.style.width = progressPercentage + '%';
    }
</script>
</body>
</html>
