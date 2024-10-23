<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Registration</title>
    <style>
        body {
            font-family: 'Verdana', sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            margin: 0;
        }

        .form-container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0px 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 650px;
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: scale(1.02);
        }

        h1 {
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
            color: #333;
        }

        label {
            color: #333;
            font-weight: bold;
            display: block;
            margin-bottom: 6px;
            position: relative;
            transition: all 0.3s ease;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="number"],
        input[type="date"],
        input[type="file"],
        select {
            width: 100%;
            padding: 14px;
            margin-bottom: 25px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #fafafa;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus,
        input[type="number"]:focus,
        input[type="date"]:focus,
        select:focus,
        input[type="file"]:focus {
            border-color: #333;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        input[type="submit"] {
            width: 100%;
            padding: 14px;
            background-color: #333;
            color: #fff;
            font-size: 1.2rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #555;
            transform: scale(1.05);
        }

        .form-container p {
            color: red;
            font-size: 0.9rem;
            text-align: center;
        }

        /* Additional Styles */
        input:focus, select:focus {
            border-color: #333;
            outline: none;
        }

        /* Placeholder animation */
        input:focus + label,
        input:not(:placeholder-shown) + label {
            top: -20px;
            font-size: 0.9rem;
            color: #555;
        }

        /* Form progress bar (for visual enhancement) */
        .progress-bar {
            width: 100%;
            height: 5px;
            background-color: #ddd;
            border-radius: 5px;
            margin-bottom: 20px;
            position: relative;
        }

        .progress-bar .progress {
            height: 100%;
            width: 0%;
            background-color: #333;
            border-radius: 5px;
            transition: width 0.4s ease;
        }

        /* JavaScript controlled progress */
    </style>
</head>
<body>
<div class="form-container">
    <h1>Admin Registration</h1>

    <!-- Progress Bar -->
    <div class="progress-bar">
        <div class="progress"></div>
    </div>

    <form action="${pageContext.request.contextPath}/registerAdmin" method="post" enctype="multipart/form-data" id="registrationForm">
        <label for="fname1">First Name</label>
        <input type="text" id="fname1" name="fname1" placeholder="First Name" required>

        <label for="lname1">Last Name</label>
        <input type="text" id="lname1" name="lname1" placeholder="Last Name" required>

        <label for="email1">Email</label>
        <input type="email" id="email1" name="email1" placeholder="hello@example.com" required>

        <label for="pass1">Password</label>
        <input type="password" id="pass1" name="pass1" placeholder="Password" required>

        <label for="pass2">Confirm Password</label>
        <input type="password" id="pass2" name="pass2" placeholder="Confirm Password" required>

        <label for="ph1">Phone Number</label>
        <input type="number" id="ph1" name="ph1" placeholder="Phone Number">

        <label for="nationality">Country</label>
        <input type="text" id="nationality" name="nationality" placeholder="Country">

        <label for="gender">Gender</label>
        <select id="gender" name="gender" required>
            <option value="Choose">Choose Gender</option>
            <option value="Male">Male</option>
            <option value="Female">Female</option>
            <option value="Other">Other</option>
        </select>

        <label for="profilePhoto">Profile Photo</label>
        <input type="file" id="profilePhoto" name="profilePhoto" accept="image/*" required>

        <label for="dateOfBirth">Date of Birth</label>
        <input type="date" id="dateOfBirth" name="dateOfBirth">

        <input type="submit" value="Register">

        <% if (request.getAttribute("errorMessage") != null) { %>
        <p><%= request.getAttribute("errorMessage") %></p>
        <% } %>
    </form>
</div>

<script>
    const form = document.getElementById('registrationForm');
    const progress = document.querySelector('.progress');

    form.addEventListener('input', () => {
        const filledInputs = [...form.querySelectorAll('input, select')].filter(input => input.value);
        const progressPercentage = (filledInputs.length / form.querySelectorAll('input, select').length) * 100;
        progress.style.width = progressPercentage + '%';
    });
</script>
</body>
</html>
