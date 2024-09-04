document.addEventListener('DOMContentLoaded', function() {
    let passengerCount = 1;

    window.addNewAdult = function() {
        passengerCount++;
        const passengerSection = document.getElementById('passengers');
        const newSection = document.createElement('div');
        newSection.className = 'form-section';
        newSection.id = 'adult' + passengerCount;
        newSection.innerHTML = `
            <h3>Passenger ${passengerCount} Information <button type="button" class="remove-btn" onclick="removeAdult('adult${passengerCount}')">X</button></h3>
            <div class="form-group">
                <label for="firstName${passengerCount}">First & Middle Name</label>
                <input type="text" id="firstName${passengerCount}" name="firstName${passengerCount}" required>
            </div>
            <div class="form-group">
                <label for="lastName${passengerCount}">Last Name</label>
                <input type="text" id="lastName${passengerCount}" name="lastName${passengerCount}" required>
            </div>
            <div class="form-group gender-group">
                <label>Gender</label>
                <label><input type="radio" name="gender${passengerCount}" value="male" required> MALE</label>
                <label><input type="radio" name="gender${passengerCount}" value="female" required> FEMALE</label>
            </div>
            <div class="form-group">
                <label for="countryCode${passengerCount}">Country Code</label>
                <select id="countryCode${passengerCount}" name="countryCode${passengerCount}" required>
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
                <label for="mobileNo${passengerCount}">Mobile No</label>
                <input type="text" id="mobileNo${passengerCount}" name="mobileNo${passengerCount}" required>
            </div>
            <div class="form-group">
                <label for="email${passengerCount}">Email</label>
                <input type="email" id="email${passengerCount}" name="email${passengerCount}" required>
            </div>
            <div class="form-group">
                <label><input type="checkbox" name="wheelchair${passengerCount}"> I require wheelchair (Optional)</label>
            </div>
        `;
        passengerSection.appendChild(newSection);
    }

    window.removeAdult = function(id) {
        const section = document.getElementById(id);
        if (section) {
            section.remove();
        }
    }
});
