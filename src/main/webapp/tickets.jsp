<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Ticket Booking</title>
    <link rel="stylesheet" type="text/css" href="styles2.css">
    <script src="scripts2.js" defer></script>
</head>
<body>
<div class="container">
    <header>
        <h1>Flight Ticket Booking</h1>
        <p>Book your flight with ease and convenience.</p>
    </header>

    <main>
        <section class="booking-form">
            <div class="card">
                <h2>Traveller Details</h2>
                <form id="bookingForm" action="submitBooking" method="post">
                    <div id="passengers">
                        <!-- Initial Adult Passenger Form Section -->
                        <div class="form-section" id="adult1">
                            <h3>Passenger Information <button type="button" class="remove-btn" onclick="removeAdult('adult1')">X</button></h3>
                            <div class="form-group">
                                <label for="firstName1">First & Middle Name</label>
                                <input type="text" id="firstName1" name="firstName1" required>
                            </div>

                            <div class="form-group">
                                <label for="lastName1">Last Name</label>
                                <input type="text" id="lastName1" name="lastName1" required>
                            </div>

                            <div class="form-group gender-group">
                                <label>Gender</label>
                                <label><input type="radio" name="gender1" value="male" required> MALE</label>
                                <label><input type="radio" name="gender1" value="female" required> FEMALE</label>
                            </div>

                            <div class="form-group">
                                <label for="countryCode1">Country Code</label>
                                <select id="countryCode1" name="countryCode1" required>
                                    <option value="+1">United States (+1)</option>
                                    <option value="+44">United Kingdom (+44)</option>
                                    <option value="+91">India (+91)</option>
                                    <option value="+61">Australia (+61)</option>
                                    <option value="+81">Japan (+81)</option>
                                    <option value="+49">Germany (+49)</option>
                                    <!-- More options -->
                                </select>
                            </div>

                            <div class="form-group">
                                <label for="mobileNo1">Mobile No</label>
                                <input type="text" id="mobileNo1" name="mobileNo1" required>
                            </div>

                            <div class="form-group">
                                <label for="email1">Email</label>
                                <input type="email" id="email1" name="email1" required>
                            </div>

                            <div class="form-group">
                                <label><input type="checkbox" name="wheelchair1"> I require wheelchair (Optional)</label>
                            </div>
                        </div>
                    </div>

                    <button type="button" class="add-adult" onclick="addNewAdult()">+ ADD NEW ADULT</button>

                    <div class="form-section">
                        <div class="card">
                            <h3>Booking Details</h3>
                            <div class="form-group">
                                <label for="bookingCountryCode">Country Code</label>
                                <select id="bookingCountryCode" name="bookingCountryCode" required>
                                    <option value="+1">United States (+1)</option>
                                    <option value="+44">United Kingdom (+44)</option>
                                    <option value="+91">India (+91)</option>
                                    <option value="+61">Australia (+61)</option>
                                    <option value="+81">Japan (+81)</option>
                                    <option value="+49">Germany (+49)</option>
                                    <!-- More options -->
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
                    </div>

                    <div class="form-section">
                        <div class="card promo-code">
                            <label for="promoCode">PROMO CODES</label>
                            <input type="text" id="promoCode" name="promoCode" placeholder="Enter promo code here">
                            <button type="button" class="view-coupons">VIEW ALL COUPONS</button>
                        </div>
                    </div>

                    <button type="submit" class="submit-btn">BOOK NOW</button>
                </form>
            </div>
        </section>
    </main>
</div>
</body>
</html>
