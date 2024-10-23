<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Delete Admin</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(135deg, #ff5f6d, #ffc371); /* Gradient background */
            background-size: 400% 400%;
            animation: gradientAnimation 10s ease infinite;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            position: relative;
            overflow: hidden;
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

        .form-container {
            background-color: rgba(255, 255, 255, 0.9); /* Slight transparency */
            padding: 40px;
            border-radius: 10px;
            max-width: 500px;
            width: 100%;
            text-align: center;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.15);
            transition: transform 0.3s ease;
        }

        .form-container:hover {
            transform: scale(1.03); /* Slight hover effect */
        }

        h1 {
            margin-bottom: 30px;
            font-size: 2rem;
            color: #333;
        }

        input[type="email"] {
            width: 100%;
            padding: 15px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
            background-color: #fafafa;
            transition: all 0.3s ease;
        }

        input[type="email"]:focus {
            border-color: #333;
            box-shadow: 0 0 8px rgba(0, 0, 0, 0.1);
            background-color: #fff;
        }

        input[type="submit"] {
            width: 100%;
            padding: 15px;
            background-color: #d9534f;
            color: #fff;
            font-size: 1.2rem;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #c9302c;
            transform: scale(1.05);
        }

        /* Floating animated shapes for interactivity */
        .floating-shape {
            position: absolute;
            background-color: rgba(255, 255, 255, 0.25); /* Transparent shapes */
            border-radius: 50%;
            animation: float 6s ease-in-out infinite;
        }

        .floating-shape:nth-child(1) {
            width: 150px;
            height: 150px;
            top: 10%;
            left: 20%;
            animation-duration: 8s;
        }

        .floating-shape:nth-child(2) {
            width: 100px;
            height: 100px;
            bottom: 20%;
            right: 25%;
            animation-duration: 10s;
        }

        .floating-shape:nth-child(3) {
            width: 120px;
            height: 120px;
            top: 60%;
            left: 60%;
            animation-duration: 12s;
        }

        @keyframes float {
            0% {
                transform: translateY(0);
            }
            50% {
                transform: translateY(-20px);
            }
            100% {
                transform: translateY(0);
            }
        }
    </style>
</head>
<body>
<!-- Floating shapes for interactive background -->
<div class="floating-shape"></div>
<div class="floating-shape"></div>
<div class="floating-shape"></div>

<div class="form-container">
    <h1>Delete Admin</h1>
    <form action="/Flight_Booking_Management_System_war/deleteAdmin" method="post">
        <input type="email" name="email1" placeholder="Enter Admin Email" required/>
        <input type="submit" value="Delete"/>
    </form>
</div>

</body>
</html>
