<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Booking Confirmation</title>
</head>
<body>

<h2>Booking Confirmation</h2>

<p>Thank you,
    <strong><%= request.getAttribute("fullName") %></strong>
    ! Your booking for flight number
    <strong><%= request.getAttribute("flightNumber") %></strong> has been confirmed.
</p>

</body>
</html>
