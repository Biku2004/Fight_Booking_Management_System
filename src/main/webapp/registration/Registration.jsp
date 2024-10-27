<%--
  Created by IntelliJ IDEA.
  User: sayan
  Date: 22-08-2024
  Time: 22:41
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration - Airline Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-color: #f4f7fa;
            font-family: 'Roboto', sans-serif;
        }

        .container {
            max-width: 700px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .text-center {
            margin-bottom: 20px;
            color: #333333;
        }

        .registration-wrapper {
            padding: 20px;
        }

        .form-group label {
            font-weight: bold;
            color: #555555;
        }

        .form-control {
            border: 1px solid #dddddd;
            border-radius: 6px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
        }

        .form-control:focus {
            border-color: #2b92ae;
            box-shadow: 0 0 8px rgba(43, 146, 174, 0.4);
        }
        .form-group input{
            padding: 12px;
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            margin-bottom: 15px;
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
        }
        .form-group select{
            border: 1px solid #ccc;
            border-radius: 8px;
            box-sizing: border-box;
            margin-bottom: 15px;
            font-size: 1em;
            transition: border-color 0.3s ease, box-shadow 0.3s ease, transform 0.3s ease;
        }

        .form-group input:focus,
        .form-group select:focus{
            outline: none;
            border-color: #2b92ae; /* Custom border color */
            box-shadow: 0 0 5px rgba(27, 138, 255, 0.5);
        }

        .form-group input:hover,
        .form-group select:hover{
            border-color: #41d4ff; /* Change border on hover */
            transform: scale(1.02); /* Slightly scale the element */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }
        /* Flexbox for phone and country code */
        .phone-input-wrapper {
            display: flex;
            gap: 10px; /* Space between country code and phone number inputs */
        }

        /* Country code dropdown styling */
        .country-code {
            max-width: 200px;
            padding: 10px;
            font-size: 1em;
            color: #2c3e50;
            background-color: #ffffff;
            border: 1px solid #ced6e0;
            border-radius: 6px;
            transition: all 0.3s ease;
            appearance: none; /* Remove default dropdown arrow */
            -webkit-appearance: none; /* Safari and Chrome */
            -moz-appearance: none; /* Firefox */
            background-image: url('data:image/svg+xml;charset=UTF-8,<svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="%232c3e50" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-chevron-down"><polyline points="6 9 12 15 18 9"></polyline></svg>');
            background-repeat: no-repeat;
            background-position: right 10px center;
        }

        /* Phone number input styling */
        .phone-number {
            flex: 1;
            padding: 10px;
            font-size: 1em;
            color: #2c3e50;
            background-color: #ffffff;
            border: 1px solid #ced6e0;
            border-radius: 6px;
            transition: all 0.3s ease;
        }

        /* Focus and hover effects for both fields */
        .country-code:focus, .phone-number:focus {
            border-color: #1abc9c;
            box-shadow: 0 0 8px rgba(26, 188, 156, 0.4);
            outline: none;
        }

        .country-code:hover, .phone-number:hover {
            border-color: #3498db;
            box-shadow: 0 0 8px rgba(52, 152, 219, 0.2);
        }

        .btn-primary {
            background-color: #007bff;
            border: none;
            border-radius: 50px;
            padding: 10px 20px;
            font-size: 1em;
            font-weight: bold;
            text-transform: uppercase;
            transition: background-color 0.3s ease, transform 0.3s ease, box-shadow 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            transform: scale(1.05);
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .btn-primary:active {
            background-color: #004085;
            transform: scale(1);
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>

<body>
<div class="container">
    <div class="registration-wrapper">
        <h2 class="text-center">Create Your Account</h2>
        <p class="text-center mb-4">Join us to explore the best flight experience</p>

        <form action="${pageContext.request.contextPath}/register" method="post" enctype="multipart/form-data">
            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="firstName">First Name</label>
                    <input type="text" class="form-control" id="firstName" name="firstName" placeholder="Sayan" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="lastName">Last Name</label>
                    <input type="text" class="form-control" id="lastName" name="lastName" placeholder="Ash" required>
                </div>
            </div>

            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" class="form-control" id="email" name="email" placeholder="hello@example.com" required>
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="password">Password</label>
                    <input type="password" class="form-control" id="password" name="password" placeholder="Create a password" required>
                </div>
                <div class="form-group col-md-6">
                    <label for="confirmPassword">Confirm Password</label>
                    <input type="password" class="form-control" id="confirmPassword" name="confirmPassword" placeholder="Confirm your password" required>
                </div>
            </div>

            <div class="form-group">
                <label for="phone">Phone</label>
                <div class="phone-input-wrapper">
                    <select class="form-control country-code" id="countryCode" name="countryCode" required>
                        <option value="+93">Afghanistan (+93)</option>
                        <option value="+355">Albania (+355)</option>
                        <option value="+213">Algeria (+213)</option>
                        <option value="+376">Andorra (+376)</option>
                        <option value="+244">Angola (+244)</option>
                        <option value="+54">Argentina (+54)</option>
                        <option value="+61">Australia (+61)</option>
                        <option value="+43">Austria (+43)</option>
                        <option value="+880">Bangladesh (+880)</option>
                        <option value="+973">Bahrain (+973)</option>
                        <option value="+32">Belgium (+32)</option>
                        <option value="+229">Benin (+229)</option>
                        <option value="+975">Bhutan (+975)</option>
                        <option value="+591">Bolivia (+591)</option>
                        <option value="+267">Botswana (+267)</option>
                        <option value="+55">Brazil (+55)</option>
                        <option value="+359">Bulgaria (+359)</option>
                        <option value="+226">Burkina Faso (+226)</option>
                        <option value="+257">Burundi (+257)</option>
                        <option value="+855">Cambodia (+855)</option>
                        <option value="+237">Cameroon (+237)</option>
                        <option value="+1">Canada (+1)</option>
                        <option value="+236">Central African Republic (+236)</option>
                        <option value="+235">Chad (+235)</option>
                        <option value="+56">Chile (+56)</option>
                        <option value="+86">China (+86)</option>
                        <option value="+57">Colombia (+57)</option>
                        <option value="+269">Comoros (+269)</option>
                        <option value="+242">Congo (+242)</option>
                        <option value="+506">Costa Rica (+506)</option>
                        <option value="+385">Croatia (+385)</option>
                        <option value="+53">Cuba (+53)</option>
                        <option value="+357">Cyprus (+357)</option>
                        <option value="+420">Czech Republic (+420)</option>
                        <option value="+45">Denmark (+45)</option>
                        <option value="+253">Djibouti (+253)</option>
                        <option value="+593">Ecuador (+593)</option>
                        <option value="+20">Egypt (+20)</option>
                        <option value="+503">El Salvador (+503)</option>
                        <option value="+240">Equatorial Guinea (+240)</option>
                        <option value="+291">Eritrea (+291)</option>
                        <option value="+372">Estonia (+372)</option>
                        <option value="+268">Eswatini (+268)</option>
                        <option value="+251">Ethiopia (+251)</option>
                        <option value="+358">Finland (+358)</option>
                        <option value="+33">France (+33)</option>
                        <option value="+241">Gabon (+241)</option>
                        <option value="+220">Gambia (+220)</option>
                        <option value="+995">Georgia (+995)</option>
                        <option value="+49">Germany (+49)</option>
                        <option value="+233">Ghana (+233)</option>
                        <option value="+30">Greece (+30)</option>
                        <option value="+502">Guatemala (+502)</option>
                        <option value="+224">Guinea (+224)</option>
                        <option value="+592">Guyana (+592)</option>
                        <option value="+509">Haiti (+509)</option>
                        <option value="+504">Honduras (+504)</option>
                        <option value="+36">Hungary (+36)</option>
                        <option value="+354">Iceland (+354)</option>
                        <option value="+91" selected>India (+91)</option>
                        <option value="+62">Indonesia (+62)</option>
                        <option value="+98">Iran (+98)</option>
                        <option value="+964">Iraq (+964)</option>
                        <option value="+353">Ireland (+353)</option>
                        <option value="+972">Israel (+972)</option>
                        <option value="+39">Italy (+39)</option>
                        <option value="+225">Ivory Coast (+225)</option>
                        <option value="+81">Japan (+81)</option>
                        <option value="+962">Jordan (+962)</option>
                        <option value="+254">Kenya (+254)</option>
                        <option value="+686">Kiribati (+686)</option>
                        <option value="+965">Kuwait (+965)</option>
                        <option value="+996">Kyrgyzstan (+996)</option>
                        <option value="+856">Laos (+856)</option>
                        <option value="+371">Latvia (+371)</option>
                        <option value="+961">Lebanon (+961)</option>
                        <option value="+266">Lesotho (+266)</option>
                        <option value="+231">Liberia (+231)</option>
                        <option value="+218">Libya (+218)</option>
                        <option value="+423">Liechtenstein (+423)</option>
                        <option value="+370">Lithuania (+370)</option>
                        <option value="+352">Luxembourg (+352)</option>
                        <option value="+261">Madagascar (+261)</option>
                        <option value="+265">Malawi (+265)</option>
                        <option value="+60">Malaysia (+60)</option>
                        <option value="+960">Maldives (+960)</option>
                        <option value="+223">Mali (+223)</option>
                        <option value="+356">Malta (+356)</option>
                        <option value="+692">Marshall Islands (+692)</option>
                        <option value="+222">Mauritania (+222)</option>
                        <option value="+230">Mauritius (+230)</option>
                        <option value="+52">Mexico (+52)</option>
                        <option value="+691">Micronesia (+691)</option>
                        <option value="+373">Moldova (+373)</option>
                        <option value="+377">Monaco (+377)</option>
                        <option value="+976">Mongolia (+976)</option>
                        <option value="+382">Montenegro (+382)</option>
                        <option value="+212">Morocco (+212)</option>
                        <option value="+258">Mozambique (+258)</option>
                        <option value="+95">Myanmar (+95)</option>
                        <option value="+264">Namibia (+264)</option>
                        <option value="+674">Nauru (+674)</option>
                        <option value="+977">Nepal (+977)</option>
                        <option value="+31">Netherlands (+31)</option>
                        <option value="+64">New Zealand (+64)</option>
                        <option value="+505">Nicaragua (+505)</option>
                        <option value="+227">Niger (+227)</option>
                        <option value="+234">Nigeria (+234)</option>
                        <option value="+47">Norway (+47)</option>
                        <option value="+968">Oman (+968)</option>
                        <option value="+92">Pakistan (+92)</option>
                        <option value="+680">Palau (+680)</option>
                        <option value="+507">Panama (+507)</option>
                        <option value="+675">Papua New Guinea (+675)</option>
                        <option value="+595">Paraguay (+595)</option>
                        <option value="+51">Peru (+51)</option>
                        <option value="+63">Philippines (+63)</option>
                        <option value="+48">Poland (+48)</option>
                        <option value="+351">Portugal (+351)</option>
                        <option value="+974">Qatar (+974)</option>
                        <option value="+242">Republic of the Congo (+242)</option>
                        <option value="+40">Romania (+40)</option>
                        <option value="+7">Russia (+7)</option>
                        <option value="+250">Rwanda (+250)</option>
                        <option value="+685">Samoa (+685)</option>
                        <option value="+378">San Marino (+378)</option>
                        <option value="+966">Saudi Arabia (+966)</option>
                        <option value="+221">Senegal (+221)</option>
                        <option value="+381">Serbia (+381)</option>
                        <option value="+248">Seychelles (+248)</option>
                        <option value="+232">Sierra Leone (+232)</option>
                        <option value="+65">Singapore (+65)</option>
                        <option value="+421">Slovakia (+421)</option>
                        <option value="+386">Slovenia (+386)</option>
                        <option value="+27">South Africa (+27)</option>
                        <option value="+82">South Korea (+82)</option>
                        <option value="+34">Spain (+34)</option>
                        <option value="+94">Sri Lanka (+94)</option>
                        <option value="+249">Sudan (+249)</option>
                        <option value="+597">Suriname (+597)</option>
                        <option value="+268">Swaziland (+268)</option>
                        <option value="+46">Sweden (+46)</option>
                        <option value="+41">Switzerland (+41)</option>
                        <option value="+963">Syria (+963)</option>
                        <option value="+886">Taiwan (+886)</option>
                        <option value="+992">Tajikistan (+992)</option>
                        <option value="+255">Tanzania (+255)</option>
                        <option value="+66">Thailand (+66)</option>
                        <option value="+670">Timor-Leste (+670)</option>
                        <option value="+228">Togo (+228)</option>
                        <option value="+676">Tonga (+676)</option>
                        <option value="+216">Tunisia (+216)</option>
                        <option value="+90">Turkey (+90)</option>
                        <option value="+993">Turkmenistan (+993)</option>
                        <option value="+688">Tuvalu (+688)</option>
                        <option value="+256">Uganda (+256)</option>
                        <option value="+380">Ukraine (+380)</option>
                        <option value="+971">United Arab Emirates (+971)</option>
                        <option value="+44">United Kingdom (+44)</option>
                        <option value="+1">United States (+1)</option>
                        <option value="+598">Uruguay (+598)</option>
                        <option value="+998">Uzbekistan (+998)</option>
                        <option value="+678">Vanuatu (+678)</option>
                        <option value="+58">Venezuela (+58)</option>
                        <option value="+84">Vietnam (+84)</option>
                        <option value="+967">Yemen (+967)</option>
                        <option value="+260">Zambia (+260)</option>
                        <option value="+263">Zimbabwe (+263)</option>

                    </select>
                    <input type="text" class="form-control phone-number" id="phone" name="phone" placeholder="7718548526" required>
                </div>
            </div>


            <div class="form-group">
                <label for="passportNumber">Passport Number</label>
                <input type="text" class="form-control" id="passportNumber" name="passportNumber" placeholder="A12345678">
            </div>

            <div class="form-row">
                <div class="form-group col-md-6">
                    <label for="nationality">Nationality</label>
                    <input type="text" class="form-control" id="nationality" name="nationality" placeholder="Country">
                </div>
                <div class="form-group col-md-6">
                    <label for="gender">Gender</label>
                    <select class="form-control" id="gender" name="gender">
                        <option value="">Select...</option>
                        <option value="Male">Male</option>
                        <option value="Female">Female</option>
                        <option value="Other">Other</option>
                    </select>               </div>
            </div>

            <div class="form-group">
                <label for="profilePhoto">Profile Photo</label>
                <input type="file" class="form-control" id="profilePhoto" name="profilePhoto" accept="image/*" required>
            </div>

            <div class="form-group">
                <label for="dateOfBirth">Date of Birth</label>
                <input type="date" class="form-control" id="dateOfBirth" name="dateOfBirth">
            </div>

            <button type="submit" class="btn btn-primary btn-block">Register</button>
        </form>
    </div>
</div>
</body>

</html>
