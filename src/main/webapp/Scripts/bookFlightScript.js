function openSeatSelection() {
    const selectedSeat = document.getElementById('Seats').value;
    const seatWindow = window.open('bookFlight/seats.jsp', 'Select Seat', 'width=800,height=600');

    seatWindow.onload = function() {
        const previousSeatElement = seatWindow.document.getElementById('previouslySelectedSeat');
        if (previousSeatElement) {
            previousSeatElement.value = selectedSeat;
        }

        seatWindow.document.getElementById('confirmSeatSelection').addEventListener('click', function() {
            const selectedSeatId = seatWindow.document.getElementById('selectedSeat').value;
            updateSelectedSeat(selectedSeatId);
            seatWindow.close();
        });
    };
}

function updateSelectedSeat(seatId) {
    document.getElementById('Seats').value = seatId;
    document.getElementById('selectedSeatDisplay').innerText = seatId;
}

let passengerCount = 0;
document.addEventListener('DOMContentLoaded', () => {
    const addPassengerBtn = document.getElementById('addPassengerBtn');
    const passengerList = document.getElementById('passengerList');

    addPassengerBtn.addEventListener('click', () => {
        passengerCount++;
        const passengerDiv = document.createElement('div');
        passengerDiv.classList.add('passenger-container');
        passengerDiv.innerHTML = `
            <h4>Passenger ${passengerCount}</h4>
            <div class="form-group">
                <label for="passengerName${passengerCount}">Name:</label>
                <input type="text" id="passengerName${passengerCount}" name="passengerName" required>
            </div>
            <div class="form-group">
                <label for="passengerAge${passengerCount}">Age:</label>
                <input type="number" id="passengerAge${passengerCount}" name="passengerAge" required>
            </div>
            
            <div class="form-group">
                <label for="passengerSeat${passengerCount}">Seat:</label>
                <input type="text" id="passengerSeat${passengerCount}" name="passengerSeat" required>
            </div>
            
            <div class="form-group">
                <label for="passengerSeat${passengerCount}">Seat:</label>
                <input type="text" id="passengerSeat${passengerCount}" name="passengerSeat" required>
                <button type="button" onclick="openSeatSelection(${passengerCount})">Select Seat</button>
            </div>
        </div>
            <button type="button" class="remove-passenger" onclick="removePassenger(this)">Remove Passenger</button>
        `;
        passengerList.appendChild(passengerDiv);

        updateTotalPrice();
    });
});

function removePassenger(button) {
    const passengerDiv = button.parentNode;
    passengerDiv.parentNode.removeChild(passengerDiv);
    passengerCount--;
    // Update passenger numbers
    const passengerContainers = document.querySelectorAll('.passenger-container h4');
    passengerContainers.forEach((header, index) => {
        header.textContent = `Passenger ${index + 1}`;
    });

    updateTotalPrice();
}

function updateTotalPrice() {
    const basePrice = parseFloat(document.getElementById('basePrice').textContent);
    const passengerCount = document.getElementById('passengerList').children.length + 1; // Including the main passenger
    const totalPrice = basePrice * passengerCount;
    document.getElementById('totalPrice').value = totalPrice;

    const priceElement = Array.from(document.querySelectorAll('tr td strong'))
        .find(el => el.textContent.includes('Price:'))
        .nextElementSibling;
    priceElement.textContent = `₹${totalPrice}`;
}