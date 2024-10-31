// Scroll to home section on page load
window.onload = function() {
    window.scrollTo(0, 0);
}
function toggleReturnDate() {
    const isRoundTrip = document.getElementById('roundtrip').checked;
    const returnField = document.getElementById('returnField');
    if (isRoundTrip) {
        returnField.style.display = 'block';
    } else {
        returnField.style.display = 'none';
    }
}

// Initialize visibility based on default checked value
document.addEventListener('DOMContentLoaded', () => {
    toggleReturnDate();
});



document.addEventListener('DOMContentLoaded', function() {
    var sendFlightDataBtn = document.getElementById('sendFlightDataBtn');
    var flightDataForm = document.getElementById('flightDataForm');

    sendFlightDataBtn.addEventListener('click', function() {
        var fromValue = document.getElementById('fromAirport').value;
        var toValue = document.getElementById('to').value;
        var date = document.getElementById('departure').value;

        if (fromValue && toValue && date) {
            document.getElementById('fromInput').value = fromValue;
            document.getElementById('toInput').value = toValue;
            document.getElementById('date').value = date;
            alert(fromValue + toValue + date)
            flightDataForm.submit();
        } else {
            alert('Please enter both "From" and "To" airports before sending flight data.');
        }
    });

});

function showLoading() {
    // Show the loading spinner
    document.getElementById("loadingSpinner").style.display = "block";

    // Optionally disable page interaction during loading
    document.body.classList.add("loading");
}

// Optional: Hide spinner once the page reloads or search completes
window.onload = function() {
    document.getElementById("loadingSpinner").style.display = "none";
    document.body.classList.remove("loading");
};




// JavaScript Functionality for Popular Destinations Section
// JavaScript for handling next/previous button functionality
const destinations = [
    {
        img: '../Images/Agra.jpg',
        title: 'Agra',
        desc: 'Home to the magnificent Taj Mahal, one of the Seven Wonders of the World.'
    },
    {
        img: '../Images/Jaipur.jpg',
        title: 'Jaipur',
        desc: 'The Pink City, known for its royal palaces and historic forts.'
    },
    {
        img: '../Images/Goa.jpg',
        title: 'Goa',
        desc: 'Famous for its pristine beaches, vibrant nightlife, and Portuguese architecture.'
    },
    {
        img: '../Images/Kerala.jpg',
        title: 'Kerala',
        desc: "God's Own Country, known for its backwaters and lush landscapes."
    },
    {
        img: '../Images/Leh Ladakh.jpg',
        title: 'Leh Ladakh',
        desc: 'A paradise for adventure seekers, with stunning mountain ranges and serene landscapes.'
    },
    {
        img: '../Images/Varanasi.jpg',
        title: 'Varanasi',
        desc: 'The spiritual capital of India, known for its ghats and sacred Ganges river.'
    },
    {
        img: '../Images/Rishikesh.jpg',
        title: 'Rishikesh',
        desc: 'A spiritual town on the Ganges, famous for yoga, meditation, and adventure sports.'
    },
    {
        img: '../Images/Amritsar.jpg',
        title: 'Amritsar',
        desc: 'Known for the Golden Temple, a symbol of Sikhism and peace.'
    },
    {
        img: '../Images/Mumbai.jpg',
        title: 'Mumbai',
        desc: 'The City of Dreams, a bustling metropolis known for Bollywood and Marine Drive.'
    },
    {
        img: '../Images/Darjeeling.jpg',
        title: 'Darjeeling',
        desc: 'A hill station in West Bengal famous for its tea gardens and panoramic views of the Himalayas.'
    },
    {
        img: '../Images/Udaipur.jpg',
        title: 'Udaipur',
        desc: 'The City of Lakes, known for its romantic charm and royal heritage.'
    },
    {
        img: '../Images/Konark.jpg',
        title: 'Konark',
        desc: 'Famous for the Sun Temple, a UNESCO World Heritage site in Odisha.'
    },
    {
        img: '../Images/Puri.jpg',
        title: 'Puri',
        desc: 'A popular pilgrimage destination in Odisha, known for the Jagannath Temple and beautiful beaches.'
    }
];

let currentDestination = 0;

function showDestination(index) {
    const destination = destinations[index];
    document.getElementById('destination-img').src = destination.img;
    document.getElementById('destination-title').textContent = destination.title;
    document.getElementById('destination-desc').textContent = destination.desc;
}

document.getElementById('prevButton').addEventListener('click', () => {
    currentDestination = (currentDestination - 1 + destinations.length) % destinations.length;
    showDestination(currentDestination);
});

document.getElementById('nextButton').addEventListener('click', () => {
    currentDestination = (currentDestination + 1) % destinations.length;
    showDestination(currentDestination);
});

// Initialize the first destination
showDestination(currentDestination);

const airports = [
    { code: 'DEL', city: 'delhi' },
    { code: 'BOM', city: 'mumbai' },
    { code: 'BLR', city: 'bengaluru' },
    { code: 'MAA', city: 'chennai' },
    { code: 'HYD', city: 'hyderabad' },
    { code: 'CCU', city: 'kolkata' },
    { code: 'PNQ', city: 'pune' },
    { code: 'GOI', city: 'goa' },
    { code: 'AMD', city: 'ahmedabad' },
    { code: 'BBI', city: 'bhubaneswar' },
    { code: 'COK', city: 'kochi' },
    { code: 'TRV', city: 'thiruvananthapuram' },
    { code: 'JAI', city: 'jaipur' },
    { code: 'LKO', city: 'lucknow' },
    { code: 'IXC', city: 'chandigarh' },
    { code: 'IXJ', city: 'jammu' },
    { code: 'SXR', city: 'srinagar' },
    { code: 'IXR', city: 'ranchi' },
    { code: 'PAT', city: 'patna' },
    { code: 'NAG', city: 'nagpur' },
    { code: 'IXB', city: 'bagdogra' },
    { code: 'VTZ', city: 'visakhapatnam' },
    { code: 'IXZ', city: 'port blair' },
    { code: 'UDR', city: 'udaipur' },
    { code: 'BDQ', city: 'vadodara' },
    { code: 'STV', city: 'surat' },
    { code: 'IDR', city: 'indore' },
    { code: 'IXM', city: 'madurai' },
    { code: 'BHO', city: 'bhopal' },
    { code: 'ATQ', city: 'amritsar' },
    { code: 'IXS', city: 'silchar' },
    { code: 'DIB', city: 'dibrugarh' },
    { code: 'GAU', city: 'guwahati' },
    { code: 'DMU', city: 'dimapur' },
    { code: 'IMF', city: 'imphal' },
    { code: 'SHL', city: 'shillong' },
    { code: 'TIR', city: 'tirupati' },
    { code: 'MYQ', city: 'mysore' },
    { code: 'IXU', city: 'aurangabad' },
    { code: 'JDH', city: 'jodhpur' },
    { code: 'JLR', city: 'jabalpur' },
    { code: 'IXE', city: 'mangalore' },
    { code: 'HBX', city: 'hubli' },
    { code: 'IXI', city: 'north lakhimpur' },
    { code: 'SLV', city: 'shimla' },
    { code: 'DED', city: 'dehradun' },
    { code: 'RJA', city: 'rajahmundry' },
    { code: 'IXL', city: 'leh' },
    { code: 'JGA', city: 'jamnagar' },
    { code: 'NDC', city: 'nanded' },
    { code: 'AJL', city: 'aizawl' },
    { code: 'TEZ', city: 'tezpur' },
    { code: 'TCR', city: 'tuticorin' },
    { code: 'AGR', city: 'agra' },
    { code: 'IXV', city: 'along' },
    { code: 'GOP', city: 'gorakhpur' },
    { code: 'LAX', city: 'los angeles' },
    { code: 'JFK', city: 'new york' },
    { code: 'ORD', city: 'chicago' },
    { code: 'LHR', city: 'london' },
    { code: 'CDG', city: 'paris' },
    { code: 'FRA', city: 'frankfurt' },
    { code: 'DXB', city: 'dubai' },
    { code: 'HKG', city: 'hong kong' },
    { code: 'NRT', city: 'tokyo' },
    { code: 'SYD', city: 'sydney' },
    { code: 'PEK', city: 'beijing' },
    { code: 'SIN', city: 'singapore' },
    { code: 'ICN', city: 'seoul' },
    { code: 'YYZ', city: 'toronto' },
    { code: 'GRU', city: 'sao paulo' },
    { code: 'AMS', city: 'amsterdam' },
    { code: 'BKK', city: 'bangkok' },
    { code: 'KUL', city: 'kuala lumpur' },
    { code: 'JNB', city: 'johannesburg' },
    { code: 'MEX', city: 'mexico city' },
    { code: 'BCN', city: 'barcelona' },
    { code: 'FCO', city: 'rome' },
    { code: 'ZRH', city: 'zurich' },
    { code: 'MUC', city: 'munich' },
    { code: 'IST', city: 'istanbul' },
    { code: 'DUB', city: 'dublin' },
    { code: 'MAD', city: 'madrid' },
    { code: 'DOH', city: 'doha' },
    { code: 'VIE', city: 'vienna' },
    { code: 'CPT', city: 'cape town' },
    { code: 'SCL', city: 'santiago' },
    { code: 'BOM', city: 'mumbai' }
    // Add more airports as needed
];

function showDropdown(input, dropdownId) {
    const dropdown = document.getElementById(dropdownId);
    const filter = input.value.toLowerCase();
    dropdown.innerHTML = '';
    if (filter) {
        const filteredAirports = airports.filter(airport =>
            airport.code.toUpperCase().includes(filter) ||
            airport.city.toLowerCase().includes(filter)
        );
        filteredAirports.forEach(airport => {
            if (airport.city && airport.code) {
                const div = document.createElement('div');
                div.textContent = `${airport.city} (${airport.code})`;
                div.onclick = () => {
                    input.value = `${airport.code}`;
                    dropdown.style.display = 'none';
                };
                dropdown.appendChild(div);
            }
        });
        dropdown.style.display = 'block';
    } else {
        dropdown.style.display = 'none';
    }
}
