    // Event listener for the "Other" checkbox
    $('#otherCheckbox').change(function() {
        // If "Other" checkbox is checked, show the input box; otherwise, hide it
        if (this.checked) {
            $('#otherLanguageInput').show();
        } else {
            $('#otherLanguageInput').hide();
        }
    });


function displayImage(input) {
    var reader = new FileReader();

    reader.onload = function(e) {
        document.getElementById('imagePreview').src = e.target.result;
    };

    reader.readAsDataURL(input.files[0]);
}





