<%--
  Created by IntelliJ IDEA.
  User: rbstu
  Date: 25-08-2024
  Time: 20:15
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Admin Details</title>
</head>
<body>
<h1>Update Admin Details</h1>
<form action="updateAdmin" method="post">
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" required><br><br>

    <label for="firstName">First Name:</label>
    <input type="text" id="firstName" name="firstName" required><br><br>

    <label for="lastName">Last Name:</label>
    <input type="text" id="lastName" name="lastName" required><br><br>

    <label for="phoneNumber">Phone Number:</label>
    <input type="text" id="phoneNumber" name="phoneNumber" required><br><br>

    <label for="country">Country:</label>
    <input type="text" id="country" name="country" required><br><br>

    <label for="gender">Gender:</label>
    <input type="text" id="gender" name="gender" required><br><br>

    <label for="profilePhotoPath">Profile Photo Path:</label>
    <input type="text" id="profilePhotoPath" name="profilePhotoPath" required><br><br>

    <label for="dob">Date of Birth:</label>
    <input type="date" id="dob" name="dob" required><br><br>

    <input type="submit" value="Update Admin">
</form>
</body>
</html>
