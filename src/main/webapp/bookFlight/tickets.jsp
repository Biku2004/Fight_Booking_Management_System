<style>
    body{
        margin: 0;
        padding: 0;
        background: #fff;
    }

    .box{
        position: absolute;
        top: calc(50% - 125px);
        top: -webkit-calc(50% - 125px);
        left: calc(50% - 300px);
        left: -webkit-calc(50% - 300px);
    }

    .ticket{
        width: 600px;
        height: 250px;
        background: #FFB300;
        border-radius: 3px;
        box-shadow: 0 0 100px #aaa;
        border-top: 1px solid #E89F3D;
        border-bottom: 1px solid #E89F3D;
    }

    .left{
        margin: 0;
        padding: 0;
        list-style: none;
        position: absolute;
        top: 0px;
        left: -5px;
    }

    .left li{
        width: 0px;
        height: 0px;
    }

    .left li:nth-child(-n+2){
        margin-top: 8px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-right: 5px solid #FFB300;
    }

    .left li:nth-child(3),
    .left li:nth-child(6){
        margin-top: 8px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-right: 5px solid #EEEEEE;
    }

    .left li:nth-child(4){
        margin-top: 8px;
        margin-left: 2px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-right: 5px solid #EEEEEE;
    }

    .left li:nth-child(5){
        margin-top: 8px;
        margin-left: -1px;
        border-top: 6px solid transparent;
        border-bottom: 6px solid transparent;
        border-right: 6px solid #EEEEEE;
    }

    .left li:nth-child(7),
    .left li:nth-child(9),
    .left li:nth-child(11),
    .left li:nth-child(12){
        margin-top: 7px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-right: 5px solid #E5E5E5;
    }

    .left li:nth-child(8){
        margin-top: 7px;
        margin-left: 2px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-right: 5px solid #E5E5E5;
    }

    .left li:nth-child(10){
        margin-top: 7px;
        margin-left: 1px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-right: 5px solid #E5E5E5;
    }

    .left li:nth-child(13){
        margin-top: 7px;
        margin-left: 2px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-right: 5px solid #FFB300;
    }

    .left li:nth-child(14){
        margin-top: 7px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-right: 5px solid #FFB300;
    }

    .right{
        margin: 0;
        padding: 0;
        list-style: none;
        position: absolute;
        top: 0px;
        right: -5px;
    }

    .right li:nth-child(-n+2){
        margin-top: 8px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-left: 5px solid #FFB300;
    }

    .right li:nth-child(3),
    .right li:nth-child(4),
    .right li:nth-child(6){
        margin-top: 8px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-left: 5px solid #EEEEEE;
    }

    .right li:nth-child(5){
        margin-top: 8px;
        margin-left: -2px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-left: 5px solid #EEEEEE;
    }

    .right li:nth-child(8),
    .right li:nth-child(9),
    .right li:nth-child(11){
        margin-top: 7px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-left: 5px solid #E5E5E5;
    }

    .right li:nth-child(7){
        margin-top: 7px;
        margin-left: -3px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-left: 5px solid #E5E5E5;
    }

    .right li:nth-child(10){
        margin-top: 7px;
        margin-left: -2px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-left: 5px solid #E5E5E5;
    }

    .right li:nth-child(12){
        margin-top: 7px;
        border-top: 6px solid transparent;
        border-bottom: 6px solid transparent;
        border-left: 6px solid #E5E5E5;
    }

    .right li:nth-child(13),
    .right li:nth-child(14){
        margin-top: 7px;
        border-top: 5px solid transparent;
        border-bottom: 5px solid transparent;
        border-left: 5px solid #FFB300;
    }

    .ticket:after{
        content: '';
        position: absolute;
        right: 200px;
        top: 0px;
        width: 2px;
        height: 250px;
        box-shadow: inset 0 0 0 #FFB300,
        inset 0 -10px 0 #B56E0A,
        inset 0 -20px 0 #FFB300,
        inset 0 -30px 0 #B56E0A,
        inset 0 -40px 0 #FFB300,
        inset 0 -50px 0 #999999,
        inset 0 -60px 0 #E5E5E5,
        inset 0 -70px 0 #999999,
        inset 0 -80px 0 #E5E5E5,
        inset 0 -90px 0 #999999,
        inset 0 -100px 0 #E5E5E5,
        inset 0 -110px 0 #999999,
        inset 0 -120px 0 #E5E5E5,
        inset 0 -130px 0 #999999,
        inset 0 -140px 0 #E5E5E5,
        inset 0 -150px 0 #B0B0B0,
        inset 0 -160px 0 #EEEEEE,
        inset 0 -170px 0 #B0B0B0,
        inset 0 -180px 0 #EEEEEE,
        inset 0 -190px 0 #B0B0B0,
        inset 0 -200px 0 #EEEEEE,
        inset 0 -210px 0 #B0B0B0,
        inset 0 -220px 0 #FFB300,
        inset 0 -230px 0 #B56E0A,
        inset 0 -240px 0 #FFB300,
        inset 0 -250px 0 #B56E0A;
    }

    .ticket:before{
        content: '';
        position: absolute;
        z-index: 5;
        right: 199px;
        top: 0px;
        width: 1px;
        height: 250px;
        box-shadow: inset 0 0 0 #FFB300,
        inset 0 -10px 0 #F4D483,
        inset 0 -20px 0 #FFB300,
        inset 0 -30px 0 #F4D483,
        inset 0 -40px 0 #FFB300,
        inset 0 -50px 0 #FFFFFF,
        inset 0 -60px 0 #E5E5E5,
        inset 0 -70px 0 #FFFFFF,
        inset 0 -80px 0 #E5E5E5,
        inset 0 -90px 0 #FFFFFF,
        inset 0 -100px 0 #E5E5E5,
        inset 0 -110px 0 #FFFFFF,
        inset 0 -120px 0 #E5E5E5,
        inset 0 -130px 0 #FFFFFF,
        inset 0 -140px 0 #E5E5E5,
        inset 0 -150px 0 #FFFFFF,
        inset 0 -160px 0 #EEEEEE,
        inset 0 -170px 0 #FFFFFF,
        inset 0 -180px 0 #EEEEEE,
        inset 0 -190px 0 #FFFFFF,
        inset 0 -200px 0 #EEEEEE,
        inset 0 -210px 0 #FFFFFF,
        inset 0 -220px 0 #FFB300,
        inset 0 -230px 0 #F4D483,
        inset 0 -240px 0 #FFB300,
        inset 0 -250px 0 #F4D483;
    }

    .content{
        position: absolute;
        top: 40px;
        width: 100%;
        height: 170px;
        background: #9ca479;
    }

    .airline{
        position: absolute;
        top: 10px;
        left: 10px;
        font-family: Arial;
        font-size: 15px;
        font-weight: bold;
        color: rgba(0,0,102,1);
    }

    .boarding{
        position: absolute;
        top: 10px;
        right: 220px;
        font-family: Arial;
        font-size: 18px;
        color: rgba(255,255,255,0.6);
    }

    .jfk{
        position: absolute;
        top: 10px;
        left: 20px;
        font-family: Arial;
        font-size: 10px;
        color: #222;
    }

    .sfo{
        position: absolute;
        top: 10px;
        left: 180px;
        font-family: Arial;
        font-size: 10px;
        color: #222;
    }

    .plane{
        position: absolute;
        left: 105px;
        top: 0px;
    }

    .sub-content{
        background: #baddb7;
        width: 100%;
        height: 100px;
        position: absolute;
        top: 70px;
    }

    .watermark{
        position: absolute;
        left: 5px;
        top: -10px;
        font-family: Arial;
        font-size: 100px;
        font-weight: bold;
        color: rgba(255,255,255,0.2);
    }

    .name{
        position: absolute;
        top: 10px;
        left: 10px;
        font-family: Arial Narrow, Arial;
        font-weight: bold;
        font-size: 12px;
        color: #999;
    }

    .name span{
        color: #555;
        font-size: 12px;
    }

    .flight{
        position: absolute;
        top: 10px;
        left: 180px;
        font-family: Arial Narrow, Arial;
        font-weight: bold;
        font-size: 12px;
        color: #999;
    }

    .flight span{
        color: #555;
        font-size: 12px;
    }

    .gate{
        position: absolute;
        top: 10px;
        left: 280px;
        font-family: Arial Narrow, Arial;
        font-weight: bold;
        font-size: 14px;
        color: #999;
    }

    .gate span{
        color: #555;
        font-size: 17px;
    }


    .seat{
        position: absolute;
        top: 10px;
        left: 350px;
        font-family: Arial Narrow, Arial;
        font-weight: bold;
        font-size: 14px;
        color: #999;
    }

    .seat span{
        color: #555;
        font-size: 17px;
    }

    .boardingtime{
        position: absolute;
        top: 60px;
        left: 10px;
        font-family: Arial Narrow, Arial;
        font-weight: bold;
        font-size: 14px;
        color: #999;
    }

    .boardingtime span{
        color: #555;
        font-size: 17px;
    }

    .barcode{
        position: absolute;
        left: 8px;
        bottom: 6px;
        height: 30px;
        width: 90px;
        background: #222;
        box-shadow: inset 0 1px 0 #FFB300, inset -2px 0 0 #FFB300,
        inset -4px 0 0 #222,
        inset -5px 0 0 #FFB300,
        inset -6px 0 0 #222,
        inset -9px 0 0 #FFB300,
        inset -12px 0 0 #222,
        inset -13px 0 0 #FFB300,
        inset -14px 0 0 #222,
        inset -15px 0 0 #FFB300,
        inset -16px 0 0 #222,
        inset -17px 0 0 #FFB300,
        inset -19px 0 0 #222,
        inset -20px 0 0 #FFB300,
        inset -23px 0 0 #222,
        inset -25px 0 0 #FFB300,
        inset -26px 0 0 #222,
        inset -26px 0 0 #FFB300,
        inset -27px 0 0 #222,
        inset -30px 0 0 #FFB300,
        inset -31px 0 0 #222,
        inset -33px 0 0 #FFB300,
        inset -35px 0 0 #222,
        inset -37px 0 0 #FFB300,
        inset -40px 0 0 #222,
        inset -43px 0 0 #FFB300,
        inset -44px 0 0 #222,
        inset -45px 0 0 #FFB300,
        inset -46px 0 0 #222,
        inset -48px 0 0 #FFB300,
        inset -49px 0 0 #222,
        inset -50px 0 0 #FFB300,
        inset -52px 0 0 #222,
        inset -54px 0 0 #FFB300,
        inset -55px 0 0 #222,
        inset -57px 0 0 #FFB300,
        inset -59px 0 0 #222,
        inset -61px 0 0 #FFB300,
        inset -64px 0 0 #222,
        inset -66px 0 0 #FFB300,
        inset -67px 0 0 #222,
        inset -68px 0 0 #FFB300,
        inset -69px 0 0 #222,
        inset -71px 0 0 #FFB300,
        inset -72px 0 0 #222,
        inset -73px 0 0 #FFB300,
        inset -75px 0 0 #222,
        inset -77px 0 0 #FFB300,
        inset -80px 0 0 #222,
        inset -82px 0 0 #FFB300,
        inset -83px 0 0 #222,
        inset -84px 0 0 #FFB300,
        inset -86px 0 0 #222,
        inset -88px 0 0 #FFB300,
        inset -89px 0 0 #222,
        inset -90px 0 0 #FFB300;
    }

    .slip{
        left: 455px;
    }

    .nameslip{
        top: 10px;
        left: 410px;
    }

    .flightslip{
        left: 410px;
    }

    .seatslip{
        left: 540px;
    }

    .jfkslip{
        font-size: 10px;
        top: 20px;
        left: 410px;
    }

    .sfoslip{
        font-size: 10px;
        top: 20px;
        left: 530px;
    }

    .planeslip{
        top: 10px;
        left: 475px;
    }

    .airlineslip{
        left: 455px;
    }

    .button-container {
        text-align: center;
        margin-top: 20px;
    }
    .button-container button {
        margin: 5px;
        padding: 10px 20px;
        font-size: 16px;
        cursor: pointer;
    }
</style>
<div class="box">
    <div class="ticket">
        <span class="airline"><%= session.getAttribute("airline") %></span>
        <span class="airline airlineslip"><%= session.getAttribute("airline") %></span>
        <span class="boarding">Boarding pass</span>
        <div class="content">
            <span class="jfk"><%= session.getAttribute("departure") %></span>
            <span class="plane"><%= session.getAttribute("airplane") %></span>
            <span class="sfo"><%= session.getAttribute("arrival") %></span>

            <span class="jfk jfkslip"><%= session.getAttribute("departure") %></span>
            <span class="plane planeslip"><!-- Plane SVG for slip remains unchanged --></span>
            <span class="sfo sfoslip"><%= session.getAttribute("arrival") %></span>

            <div class="sub-content">
                <span class="watermark"><%= session.getAttribute("airline") %></span>
                <span class="name">PASSENGER NAME<br><span><%= session.getAttribute("fullName") %></span></span>
                <span class="flight">FLIGHT<br><span><%= session.getAttribute("flightNumber") %></span></span>
                <span class="gate">GATE<br><span>22C</span></span>
                <span class="seat">SEAT<br><span><%= ((String[]) session.getAttribute("passengerSeats"))[0] %></span></span>
                <span class="boardingtime">BOARDING TIME<br><span><%= session.getAttribute("departureTime") %></span></span>

                <span class="flight flightslip">FLIGHT N<br><span><%= session.getAttribute("flightNumber") %></span></span>
                <span class="seat seatslip">SEAT<br><span><%= ((String[]) session.getAttribute("passengerSeats"))[0] %></span></span>
                <span class="name nameslip">PASSENGER NAME<br><span><%= session.getAttribute("fullName") %></span></span>
            </div>
        </div>
        <div class="barcode"></div>
        <div class="barcode slip"></div>
    </div>
</div>
<div class="button-container">
    <button onclick="window.print()">Print Ticket</button>
    <button onclick="location.href='sendEmailServlet'">Send to Email</button>
    <button onclick="location.href='home.jsp'">Go to Home</button>
</div>