<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>
    <link rel="stylesheet" type="text/css" href="../cssFile/adminregd.css">
</head>
<body>
<div class="form-container">
    <h1>Admin Registration</h1>
    <form action="${pageContext.request.contextPath}/registerAdmin" method="post" enctype="multipart/form-data">
        <label for="fname1">First Name</label>
        <input type="text" id="fname1" name="fname1" placeholder="First Name" required/><br>

        <label for="lname1">Last Name</label>
        <input type="text" id="lname1" name="lname1" placeholder="Last Name" required/><br>

        <label for="email1">Email</label>
        <input type="email" id="email1" name="email1" placeholder="hello@example.com" required/><br>

        <label for="pass1">Password</label>
        <input type="password" id="pass1" name="pass1" placeholder="Password" required/><br>

        <label for="pass2">Confirm Password</label>
        <input type="password" id="pass2" name="pass2" placeholder="Confirm Password" required/><br>

        <label for="ph1">Phone Number</label>
        <input type="number" id="ph1" name="ph1" placeholder="Phone Number"/><br>

        <label for="nationality">Country</label>
        <input type="text" id="nationality" name="nationality" placeholder="Country"/><br>

        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
            <option value="Choose">Choose Gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select><br>

        <label for="profilePhoto">Profile Photo</label>
        <input type="file" id="profilePhoto" name="profilePhoto" accept="image/*" required/><br>

        <label for="dateOfBirth">Date of Birth</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth"/><br>

        <input type="submit" value="Register"/>

        <% if (request.getAttribute("errorMessage") != null) { %>
        <p style="color: red;"><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </form>
</div>
</body>
</html>
