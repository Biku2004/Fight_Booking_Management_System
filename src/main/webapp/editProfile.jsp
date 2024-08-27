<%--
  Created by IntelliJ IDEA.
  User: lenovo
  Date: 8/27/2024
  Time: 7:22 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - Airline Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<%--    <link rel="stylesheet" href="Registrationstyle.css">--%>
</head>
<body>
<div class="container">
    <div class="registration-wrapper">
        <h2 class="text-center">Edit Your Profile</h2>
        <p class="text-center mb-4">Update your information</p>

        <form action="editProfile" method="post" enctype="multipart/form-data"> <!-- 'editProfile' should map to the servlet -->
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" value="${firstName}" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" value="${lastName}" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" value="${email}" readonly> <!-- Email cannot be edited -->
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <input type="text" class="form-control" id="phone" name="phone" value="${phone}">
            </div>
            <div class="form-group">
                <label for="passportNumber">Passport Number</label>
                <input type="text" class="form-control" id="passportNumber" name="passportNumber" value="${passportNumber}">
            </div>
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="nationality">Nationality</label>
                    <input type="text" class="form-control" id="nationality" name="nationality" value="${nationality}">
                </div>
                <div class="form-group col-md-6">
                    <label for="gender">Gender</label>
                    <select class="form-control" id="gender" name="gender">
                        <option value="Male" ${gender == 'Male' ? 'selected' : ''}>Male</option>
                        <option value="Female" ${gender == 'Female' ? 'selected' : ''}>Female</option>
                        <option value="Other" ${gender == 'Other' ? 'selected' : ''}>Other</option>
                    </select>
                </div>
            </div>

            <div class="form-group">
                <label for="profilePhoto">Profile Photo</label>
                <input type="file" class="form-control" id="profilePhoto" name="profilePhoto" accept="image/*">
            </div>

            <div class="form-group">
                <label for="dateOfBirth">Date of Birth</label>
                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth" value="${dateOfBirth}">
            </div>
            <button type="submit" class="btn btn-primary btn-block">Update Profile</button>
        </form>
    </div>
</div>
</body>
</html>

