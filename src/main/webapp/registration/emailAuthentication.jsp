<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Admin Details</title>
    <style>
        body {
            font-family: 'Poppins', Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background: linear-gradient(135deg, #33A1FF, #6DD5FA, #ffffff);
            background-size: 400% 400%;
            animation: gradientAnimation 8s ease infinite;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        @keyframes gradientAnimation {
            0%, 100% {
                background-position: 0% 50%;
            }
            50% {
                background-position: 100% 50%;
            }
        }

        h1 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
            letter-spacing: 1px;
            text-transform: uppercase;
        }

        form {
            max-width: 400px;
            width: 100%;
            padding: 20px;
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.15);
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        label {
            display: block;
            font-weight: 600;
            margin-bottom: 8px;
            color: #333;
        }

        input[type="email"] {
            width: 100%;
            padding: 12px;
            border: 1px solid #ddd;
            border-radius: 4px;
            margin-bottom: 16px;
            font-size: 16px;
            transition: border-color 0.3s ease;
        }

        input[type="email"]:focus {
            border-color: #33A1FF;
            outline: none;
            box-shadow: 0 0 5px rgba(51, 161, 255, 0.5);
        }

        input[type="submit"] {
            background-color: #33A1FF;
            color: white;
            border: none;
            padding: 12px 20px;
            font-size: 16px;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover {
            background-color: #2A8CE6;
            transform: translateY(-2px);
        }

        input[type="submit"]:active {
            background-color: #2480CC;
            transform: translateY(1px);
        }

        /* Responsive adjustments */
        @media (max-width: 600px) {
            body {
                padding: 10px;
            }

            form {
                padding: 15px;
            }

            h1 {
                font-size: 20px;
            }
        }
    </style>

</head>
<body>
<form action="<%=request.getContextPath ()%>/showUpdateForm" method="post">
    <h1>Enter Email to Update Admin Details</h1>
    <label for="email">Email:</label>
    <input type="email" id="email" name="email" placeholder="Enter Your Email" required><br><br>
    <input type="submit" value="Submit">
</form>
</body>
</html>
