<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Dashboard</title>
    <!-- Link to Font Awesome -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background: linear-gradient(to right, #33FF57, #33A1FF);
            background-size: 400% 400%;
            animation: gradientAnimation 10s ease infinite;
            margin: 0;
            padding: 20px;
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
        .grid-container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(250px, 1fr)); /* Responsive grid */
            gap: 20px;
            padding: 20px;
            margin: 0 auto;
            max-width: 1200px;
        }

        .grid-item {
            background-color: #ffffff;
            border: 1px solid #e0e0e0;
            border-radius: 12px;
            padding: 20px;
            text-align: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease, background-color 0.3s ease;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            position: relative;
            overflow: hidden;
        }

        .grid-item:hover {
            transform: scale(1.05);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
            background-color: #f0f0f0;
        }

        .grid-item h2 {
            font-size: 1.6em;
            margin-bottom: 12px;
            color: #333;
        }

        .grid-item i {
            font-size: 2em;
            margin-bottom: 12px;
            color: #007bff;
            margin-right: 8px;
        }

        .grid-item p {
            font-size: 1.05em;
            color: #555;
            line-height: 1.5;
            margin-bottom: 20px;
        }

        .grid-item a {
            text-decoration: none;
            color: inherit;
        }

        .grid-item .btn {
            background-color: #007bff;
            color: white;
            padding: 10px 25px;
            font-size: 0.9em;
            border: none;
            border-radius: 30px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
            text-transform: uppercase;
            font-weight: bold;
        }

        .grid-item .btn:hover {
            background-color: #0056b3;
            transform: scale(1.08);
        }

        .grid-item .btn:active {
            background-color: #004080;
            transform: scale(1);
        }

        @media (max-width: 768px) {
            .grid-item i {
                font-size: 1.6em;
            }
            .grid-item h2 {
                font-size: 1.4em;
            }
        }
    </style>
</head>
<body>
<div class="grid-container">
    <div class="grid-item">
        <i class="fas fa-user-plus"></i>
        <h2>Add Admin</h2>
        <p>Add Admin from here</p>
        <button class="btn"><a href="adminregd.jsp">Add</a></button>
    </div>
    <div class="grid-item">
        <i class="fas fa-user-minus"></i>
        <h2>Delete Admin</h2>
        <p>Delete any Admin from here</p>
        <button class="btn"><a href="adminDelete.jsp">Delete</a></button>
    </div>
    <div class="grid-item">
        <i class="fas fa-user-edit"></i>
        <h2>Update Admin</h2>
        <p>Update admin details from here</p>
        <button class="btn"><a href="../registration/emailAuthentication.jsp">Update</a></button>
    </div>
    <div class="grid-item">
        <i class="fas fa-plane"></i>
        <h2>Add Flight</h2>
        <p>Schedule a flight from here for any situation</p>
        <button class="btn"><a href="../addFlight/addFlight.jsp">Add Flight</a></button>
    </div>
    <div class="grid-item">
        <i class="fas fa-edit"></i>
        <h2>Modify Flight</h2>
        <p>Modify any details of an already scheduled flight</p>
        <button class="btn"><a href="../modifyFlight/modifyFlight.jsp">Modify Flight</a></button>
    </div>
    <div class="grid-item">
        <i class="fas fa-trash-alt"></i>
        <h2>Delete Flight</h2>
        <p>Delete a scheduled flight</p>
        <button class="btn"><a href="../deleteFlight/deleteFlight.jsp">Delete</a></button>
    </div>
    <div class="grid-item">
        <i class="fas fa-chair"></i>
        <h2>Seat Info</h2>
        <p>View the current status of seats</p>
        <button class="btn"><a href="#">Seat Info</a></button>
    </div>
    <div class="grid-item">
        <i class="fa-solid fa-person"></i>
        <h2>Passenger Info</h2>
        <p>Get Passenger Info</p>
        <button class="btn"><a href="../ViewPassenger/searchBooking.jsp">Passenger info</a></button>
    </div>
    <div class="grid-item">
        <i class="fas fa-tools"></i>
        <h2>All in One</h2>
        <p>Modify any details of an already added flight</p>
        <button class="btn"><a href="allFile.jsp">AllIn1</a></button>
    </div>
    <div class="grid-item">
        <i class="fas fa-database"></i>
        <h2>Data From DB</h2>
        <p>Access data from the database</p>
        <button class="btn"><a href="../bookFlight/dataFromdb.jsp">Data</a></button>
    </div>
    <div class="grid-item">
        <i class="fas fa-ticket-alt"></i>
        <h2>Tickets</h2>
        <p>Manage your tickets here</p>
        <button class="btn"><a href="../bookFlight/tickets.jsp">Tickets</a></button>
    </div>
</div>
</body>
</html>
