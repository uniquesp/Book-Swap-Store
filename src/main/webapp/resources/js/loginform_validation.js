function getValidateSignInForm() {
    var email = $('#user_email').val() !== undefined ? $('#user_email').val() : "",
        password = $('#password').val() !== undefined ? $('#password').val() : "",
        submitForm = true,
        emailExpression = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/,
        numbers = /([0-9])/,
        alphabets = /([a-zA-Z])/,
        specialCharacters = /([~,!,@,#,$,%,^,&,*,-,_,+,=,?,>,<,(,)])/;
    
    if (email === "") {
        submitForm = false;
        getShowWarning("email");
    } else if (!emailExpression.test(String(email).toLowerCase())) {
        submitForm = false;
        getShowWarning("email");
    }
    if (password === "") {
        submitForm = false;
        getShowWarning("password");
    } else if (password.length < 8 || !(password.match(numbers) && password.match(alphabets) && password.match(specialCharacters))) {
        submitForm = false;
        getShowWarning("password");
    }
    return submitForm;
}

$(document).on('click', '.toggle-password', function() {
    $(this).toggleClass("zmdi-eye zmdi-eye-off");
    var input = $("#password");
    input.attr('type') === 'password' ? input.attr('type', 'text') : input.attr('type', 'password');
    $(this).toggleClass("zmdi-eye zmdi-eye-off");
});

function getShowWarning(field) {
    var warningMessage = '';
    if (field === 'email') {
        warningMessage = 'Please enter a valid email address.';
    } else if (field === 'password') {
        warningMessage = 'Password must be at least 8 characters long and include numbers, letters, and special characters.';
    }
    alert(warningMessage); // Replace with your preferred way of showing warnings, e.g., inline messages, modals, etc.
}

$(document).ready(function() {
    $('#login_form').on('submit', function(event) {
        if (!getValidateSignInForm()) {
            event.preventDefault();
        }
    });
});

