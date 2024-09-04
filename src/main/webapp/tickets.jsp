<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Ticket Booking</title>
    <link rel="stylesheet" type="text/css" href="styles2.css">
</head>
<body>
<div class="container">
    <header>
        <h1>Flight Ticket Booking</h1>
        <p>Find and book your perfect flight with ease.</p>
    </header>

    <main>
        <section class="traveller-details">
            <div class="card">
                <h2>Traveller Details</h2>
                <p>Log in to view your saved traveller list, unlock amazing deals & much more!</p>
                <button class="login-btn">LOGIN NOW</button>

                <form action="submitBooking" method="post">
                    <div class="form-group">
                        <label for="adult-count">ADULT (12 yrs+)</label>
                        <input type="number" id="adult-count" name="adultCount" value="1" min="1" max="10" readonly>
                    </div>

                    <div class="traveller-info">
                        <h3>ADULT 1</h3>
                        <div class="form-group">
                            <label for="firstName">First & Middle Name</label>
                            <input type="text" id="firstName" name="firstName" required>
                        </div>

                        <div class="form-group">
                            <label for="lastName">Last Name</label>
                            <input type="text" id="lastName" name="lastName" required>
                        </div>

                        <div class="form-group gender-group">
                            <label>Gender</label>
                            <label><input type="radio" name="gender" value="male" required> MALE</label>
                            <label><input type="radio" name="gender" value="female" required> FEMALE</label>
                        </div>

                        <div class="form-group">
                            <label for="countryCode">Country Code</label>
                            <select id="countryCode" name="countryCode" required>
                                <option value="+1">United States (+1)</option>
                                <option value="+44">United Kingdom (+44)</option>
                                <option value="+91">India (+91)</option>
                                <option value="+61">Australia (+61)</option>
                                <option value="+81">Japan (+81)</option>
                                <option value="+49">Germany (+49)</option>
                                <!-- Add more country codes as needed -->
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="mobileNo">Mobile No</label>
                            <input type="text" id="mobileNo" name="mobileNo" required>
                        </div>

                        <div class="form-group">
                            <label for="email">Email</label>
                            <input type="email" id="email" name="email" required>
                        </div>

                        <div class="form-group">
                            <label><input type="checkbox" name="wheelchair"> I require wheelchair (Optional)</label>
                        </div>

                        <button type="button" class="add-adult">+ ADD NEW ADULT</button>
                    </div>

                    <div class="booking-details card">
                        <h3>Booking details will be sent to</h3>
                        <div class="form-group">
                            <label for="bookingCountryCode">Country Code</label>
                            <select id="bookingCountryCode" name="bookingCountryCode" required>
                                <option value="+1">United States (+1)</option>
                                <option value="+44">United Kingdom (+44)</option>
                                <option value="+91">India (+91)</option>
                                <option value="+61">Australia (+61)</option>
                                <option value="+81">Japan (+81)</option>
                                <option value="+49">Germany (+49)</option>
                                <!-- Add more country codes as needed -->
                            </select>
                        </div>

                        <div class="form-group">
                            <label for="bookingMobileNo">Mobile No</label>
                            <input type="text" id="bookingMobileNo" name="bookingMobileNo" required>
                        </div>

                        <div class="form-group">
                            <label for="bookingEmail">Email</label>
                            <input type="email" id="bookingEmail" name="bookingEmail" required>
                        </div>
                    </div>

                    <div class="fare-summary card">
                        <h3>Fare Summary</h3>
                        <p>Base Fare: ₹ 4,893</p>
                        <p>Taxes and Surcharges: ₹ 764</p>
                        <p>Total Amount: ₹ 5,657</p>
                    </div>

                    <div class="promo-code card">
                        <label for="promoCode">PROMO CODES</label>
                        <input type="text" id="promoCode" name="promoCode" placeholder="Enter promo code here">
                        <button type="button" class="view-coupons">VIEW ALL COUPONS</button>
                    </div>

                    <button type="submit" class="submit-btn">BOOK NOW</button>
                </form>
            </div>
        </section>
    </main>
</div>
</body>
</html>
