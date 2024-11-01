<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment</title>
    <script src="https://checkout.razorpay.com/v1/checkout.js"></script>
</head>
<body>
<h2>Payment</h2>
<button id="payButton">Pay Now</button>

<script>
    document.getElementById('payButton').onclick = function(e) {
        var options = {
            "key": "rzp_test_E96YctEGlH3EcE", // Enter the Key ID generated from the Dashboard
            "amount": "<%= (int) (Double.parseDouble(session.getAttribute("price").toString()) * 100) %>", // Amount is in currency subunits. Default currency is INR.
            "currency": "INR",
            "name": "Flight Booking",
            "description": "Test Transaction",
            "image": "https://example.com/your_logo",
            "order_id": "<%= session.getAttribute("razorpayOrderId") %>", // This is a sample Order ID. Pass the `id` obtained in the previous step
            "handler": function (response){
                alert(response.razorpay_payment_id);
                alert(response.razorpay_order_id);
                alert(response.razorpay_signature);
                window.location.href = "${pageContext.request.contextPath}/ConfirmBookingServlet?paymentId=" + response.razorpay_payment_id;
            },
            "prefill": {
                "name": "<%= session.getAttribute("fullName") %>",
                "email": "<%= session.getAttribute("email") %>",
                "contact": "<%= session.getAttribute("phone") %>"
            },
            "theme": {
                "color": "#3399cc"
            }
        };
        var rzp1 = new Razorpay(options);
        rzp1.open();
        e.preventDefault();
    }

    // Example of including authentication credentials in a JavaScript request
    fetch('https://api.razorpay.com/v2/standard_checkout/preferences', {
        method: 'POST',
        headers: {
            'Authorization': 'Basic ' + btoa('rzp_test_E96YctEGlH3EcE:asqJUTrmLx0aodnuFyCA8pzD'),
            'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            key_id: 'order_PFw5HkQPhqQrJp',
            session_token: 'D94F43F2F86A731F8206AD5F98239AA4D6DD0AF84753C14BD958CBDADE1D2F136E51005C3FB1247FACCE13D97BDB571374B58F808BA61B36E29C82B0F9B51460438E8E8E23EC78371027357A5AF561557995FA56B575563D62E6FC31543AB7E86A3CDBA8CD366166'
        })
    })
        .then(response => {
            if (!response.ok) {
                throw new Error('Network response was not ok ' + response.statusText);
            }
            return response.json();
        })
        .then(data => {
            console.log(data);
        })
        .catch(error => {
            console.error('There was a problem with the fetch operation:', error);
        });
</script>
</body>
</html>