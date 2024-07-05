
function togglePassword(id) {
    var input = document.getElementById(id);
    var icon = input.nextElementSibling.querySelector('i');
    if (input.type === 'password') {
        input.type = 'text';
        icon.classList.remove('fa-eye');
        icon.classList.add('fa-eye-slash');
    } else {
        input.type = 'password';
        icon.classList.remove('fa-eye-slash');
        icon.classList.add('fa-eye');
    }
}

document.getElementById('loginForm').addEventListener('submit', function(event) {
    var email = document.getElementById('loginEmail').value;
    var password = document.getElementById('loginPassword').value;
    if (!email || !password) {
        alert('Please fill in all fields');
        event.preventDefault();
    }
});

document.getElementById('registrationForm').addEventListener('submit', function(event) {
    var firstName = document.getElementById('firstName').value;
    var lastName = document.getElementById('lastName').value;
    var email = document.getElementById('regEmail').value;
    var mobileNo = document.getElementById('mobileNo').value;
    var address = document.getElementById('address').value;
    var password = document.getElementById('regPassword').value;
    var confirmPassword = document.getElementById('confirmPassword').value;

    if (!firstName || !lastName || !email || !mobileNo || !address || !password || !confirmPassword) {
        alert('Please fill in all fields');
        event.preventDefault();
    } else if (password !== confirmPassword) {
        alert('Passwords do not match');
        event.preventDefault();
    }
});







/*
//Password and confirm Password validations
function Validate() {
	var pass = document.getElementById("password").value;
	var confirmpass = document.getElementById("confirm_password").value;
	if (pass != confirmpass) {
		alert("You first Passwords is not similar with 2nd password. Please enter same password in both");
		return false;
	}
	return true;
}

//Date Validation
function validDate() {
	var dob = new Date(document.getElementById("dob").value);
	var currentDate = new Date();
	var tenYearsAgo = new Date(currentDate);
	tenYearsAgo.setFullYear(currentDate.getFullYear() - 10);

	if (dob >= tenYearsAgo || dob >= currentDate) {
		alert("Birthdate should be more than 10 years ago and not the current date.");
		return false;
	}

	return true;
}

//Phone no validation
function validateMobileNumber() {
	var mobileInput = document.getElementById("mobile");
	var mobileNumber = mobileInput.value;

	// Regular expression to match a 10-digit Indian mobile number
	var mobileRegex = /^[789]\d{9}$/;

	if (!mobileRegex.test(mobileNumber)) {
		// Invalid mobile number
		mobileInput.setCustomValidity("Please enter a valid 10-digit Indian mobile number.");
	} else {
		// Valid mobile number
		mobileInput.setCustomValidity("");
	}
}


// Name Validation
function validateName() {
	var NameInput = document.getElementById("name");
	var name = NameInput.value;

	// Regular expression to match a 10-digit Indian mobile number
	var nameRegex = /[A-Za-z]+(\s[A-Za-z]+)?/;

	if (!nameRegex.test(name)) {
		// Invalid mobile number
		NameInput.setCustomValidity("Please enter a valid 10-digit Indian mobile number.");
	} else {
		// Valid mobile number
		NameInput.setCustomValidity("");
	}
}
*/

// validate mail
/*function validateEmail() {
	var emailInput = document.getElementById("email");
	var email = emailInput.value;

	// Regular expression to validate email address
	var emailRegex = /^[a-zA-Z0-9._-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$/;

	if (!emailRegex.test(email)) {
		// Invalid email address
		emailInput.setCustomValidity("Please enter a valid email address.");
	} else {
		// Valid email address
		emailInput.setCustomValidity.toLowerCase("");
	}
}
*/


/*function validateEmail() {
    var emailInput = document.getElementById("email");
    var email = emailInput.value;

    // Regular expression to validate email address
    var emailRegex = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;

    // Regular expressions to check for numbers, alphabets, and special characters
    var numbers = /([0-9])/, 
        alphabets = /([a-zA-Z])/, 
        specialCharacters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<,(,)])/;

    if (!emailRegex.test(email)) {
        // Invalid email address
        emailInput.setCustomValidity("Please enter a valid email address.");
    } else if (!numbers.test(email) || !alphabets.test(email) || !specialCharacters.test(email)) {
        // Email doesn't contain at least one number, one alphabet, and one special character
        emailInput.setCustomValidity("Email must contain at least one number, one alphabet, and one special character.");
    } else {
        // Valid email address
        emailInput.setCustomValidity(""); // Clear any previous validation message
    }
}
*/

