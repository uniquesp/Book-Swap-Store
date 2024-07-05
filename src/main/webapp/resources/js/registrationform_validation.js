function validateRegistrationForm() {
    var userName = $('#user_name').val() || "",
        email = $('#user_email').val() || "",
        mobile = $('#user_mobile').val() || "",
        birthDate = $('#Birth_Date').val() || "",
        gender = $('#user_gender').val() || "",
        address = $('#user_address').val() || "",
        password = $('#password').val() || "",
        confirmPassword = $('#confirm_password').val() || "",
        submitForm = true,
        emailExpression = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
        numbers = /([0-9])/,
        alphabets = /([a-zA-Z])/,
        specialCharacters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<,(,)])/;

    $('.form-control').removeClass('is-invalid');

    if (userName === "") {
        submitForm = false;
        showWarning("user_name", "Please enter your name.");
    }
    if (email === "") {
        submitForm = false;
        showWarning("user_email", "Please enter your email.");
    } else if (!emailExpression.test(String(email).toLowerCase())) {
        submitForm = false;
        showWarning("user_email", "Please enter a valid email address.");
    }
    if (mobile === "") {
        submitForm = false;
        showWarning("user_mobile", "Please enter your mobile number.");
    } else if (!/^[789]\d{9}$/.test(mobile)) {
        submitForm = false;
        showWarning("user_mobile", "Please enter a valid 10-digit Indian mobile number.");
    }
    if (birthDate === "") {
        submitForm = false;
        showWarning("Birth_Date", "Please enter your birth date.");
    } else if (!validDate(birthDate)) {
        submitForm = false;
    }
    if (gender === "") {
        submitForm = false;
        showWarning("user_gender", "Please select your gender.");
    }
    if (address === "") {
        submitForm = false;
        showWarning("user_address", "Please enter your address.");
    }
    if (password === "") {
        submitForm = false;
        showWarning("password", "Please enter your password.");
    } else if (password.length < 8 || !(password.match(numbers) && password.match(alphabets) && password.match(specialCharacters))) {
        submitForm = false;
        showWarning("password", "Password must be at least 8 characters long and include numbers, letters, and special characters.");
    }
    if (confirmPassword === "") {
        submitForm = false;
        showWarning("confirm_password", "Please confirm your password.");
    } else if (password !== confirmPassword) {
        submitForm = false;
        showWarning("confirm_password", "Passwords do not match.");
    }

    return submitForm;
}

function validDate(birthDate) {
    var dob = new Date(birthDate);
    var currentDate = new Date();
    var tenYearsAgo = new Date(currentDate);
    tenYearsAgo.setFullYear(currentDate.getFullYear() - 10);

    if (dob >= tenYearsAgo || dob >= currentDate) {
        showWarning("Birth_Date", "Birthdate should be more than 10 years ago and not the current date.");
        return false;
    }
    return true;
}

function validateMobileNumber() {
    var mobileInput = document.getElementById("user_mobile");
    var mobileNumber = mobileInput.value;

    var mobileRegex = /^[789]\d{9}$/;

    if (!mobileRegex.test(mobileNumber)) {
        mobileInput.setCustomValidity("Please enter a valid 10-digit Indian mobile number.");
    } else {
        mobileInput.setCustomValidity("");
    }
}

$(document).on('click', '.toggle-password', function() {
    $(this).toggleClass("zmdi-eye zmdi-eye-off");
    var input = $(this).siblings('input');
    input.attr('type') === 'password' ? input.attr('type', 'text') : input.attr('type', 'password');
});

function showWarning(field, message) {
    var inputField = $('#' + field);
    inputField.addClass('is-invalid');
    inputField.focus();
    alert(message); // Replace with your preferred way of showing warnings, e.g., inline messages, modals, etc.
}

$(document).ready(function() {
    $('#registration_form').on('submit', function(event) {
        if (!validateRegistrationForm()) {
            event.preventDefault();
        }
    });
    $('#user_mobile').on('input', validateMobileNumber);
});
