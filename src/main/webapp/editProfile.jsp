<%@ page import="com.flight.flight_booking_management_system.LoginRegister.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - Airline Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <div class="registration-wrapper">
        <h2 class="text-center">Edit Your Profile</h2>
        <p class="text-center mb-4">Update your information</p>
        <% User user = (User) request.getAttribute("user"); %>
        <% if (user != null) { %>
        <!-- Corrected form action with proper JSP syntax -->
        <form action="<%= request.getContextPath() %>/editProfile" method="post" enctype="multipart/form-data">
            <!-- Use only the readonly input for email -->
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="<%= user.getEmail() %>" readonly>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" value="<%= user.getFirstName() %>" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" value="<%= user.getLastName() %>" required>
                </div>
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" value="<%= user.getPhone() %>">
            </div>
            <div class="form-group">
                <label for="passportNumber">Passport Number</label>
                <input type="text" class="form-control" id="passportNumber" name="passportNumber" value="<%= user.getPassportNumber() %>">
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="nationality">Nationality</label>
                    <input type="text" class="form-control" id="nationality" name="nationality" value="<%= user.getNationality() %>">
                </div>
                <div class="form-group col-md-6">
                    <label for="gender">Gender</label>
                    <select class="form-control" id="gender" name="gender">
                        <option value="Male" <%= "Male".equals(user.getGender()) ? "selected" : "" %>>Male</option>
                        <option value="Female" <%= "Female".equals(user.getGender()) ? "selected" : "" %>>Female</option>
                        <option value="Other" <%= "Other".equals(user.getGender()) ? "selected" : "" %>>Other</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="profilePhoto">Profile Photo</label>
                <input type="file" class="form-control" id="profilePhoto" name="profilePhoto" accept="image/*">
            </div>

            <div class="form-group">
                <label for="dateOfBirth">Date of Birth</label>
                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="<%= user.getDateOfBirth() %>">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Update Profile</button>
        </form>
        <% } else { %>
        <p class="text-center text-danger">User details could not be retrieved. Please try again later.</p>
        <% } %>
    </div>
</div>
</body>
</html>
