<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Admin Details</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        h1 {
            color: #333;
            text-align: center;
        }
        form {
            background: #0c95be;
            padding: 40px 30px;
            border-radius: 12px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            position: relative;
        }
        .form-control {
            position: relative;
            margin-bottom: 20px;
            width: 100%;
        }
        .form-control input {
            width: 100%;
            padding: 10px 15px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background-color: #f4f4f4;
            outline: none;
            transition: border-color 0.3s ease, background-color 0.3s ease;
        }
        .form-control input:focus {
            border-color: #007bff;
            background-color: white;
        }
        .form-control label {
            position: absolute;
            top: 14px;
            left: 15px;
            font-size: 16px;
            color: #999;
            pointer-events: none;
            transition: 0.3s;
        }
        .form-control input:focus + label,
        .form-control input:not(:placeholder-shown) + label {
            top: -12px;
            left: 12px;
            font-size: 12px;
            color: #007bff;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            border: none;
            padding: 12px;
            font-size: 18px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s;
            width: 100%;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
            transform: scale(1.02);
        }
        .validation-message {
            display: none;
            font-size: 14px;
            color: red;
            margin-top: -10px;
            margin-bottom: 10px;
        }
        .form-success {
            display: none;
            text-align: center;
            color: green;
            margin-top: 20px;
        }
        .form-error {
            display: none;
            text-align: center;
            color: red;
            margin-top: 20px;
        }
    </style>
</head>
<body>

<form id="updateForm" action="<%=request.getContextPath()%>/showUpdateForm" method="post">
    <h1>Update Admin Details</h1>

    <div class="form-control">
        <input type="email" id="email" name="email" placeholder=" " required>
        <label for="email">Email</label>
        <div class="validation-message" id="emailValidation">Please enter a valid email address.</div>
    </div>

    <input type="submit" value="Submit">

    <div class="form-success" id="formSuccess">Admin details updated successfully!</div>
    <div class="form-error" id="formError">Failed to update admin details. Try again.</div>
</form>

<script>
    const form = document.getElementById('updateForm');
    const emailInput = document.getElementById('email');
    const emailValidation = document.getElementById('emailValidation');
    const formSuccess = document.getElementById('formSuccess');
    const formError = document.getElementById('formError');

    form.addEventListener('submit', function(event) {
        const email = emailInput.value;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;

        if (!emailRegex.test(email)) {
            emailValidation.style.display = 'block';
            event.preventDefault();
        } else {
            emailValidation.style.display = 'none';
        }

        // Simulate success or error response
        setTimeout(function() {
            formSuccess.style.display = 'block';  // Replace with actual backend response logic
            formError.style.display = 'none';    // Use error message on failure
        }, 500);
    });

    emailInput.addEventListener('input', function() {
        const email = emailInput.value;
        const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
        if (!emailRegex.test(email)) {
            emailValidation.style.display = 'block';
        } else {
            emailValidation.style.display = 'none';
        }
    });
</script>

</body>
</html>
