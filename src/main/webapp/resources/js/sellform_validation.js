function validateForm() {
    const originalPrice = parseFloat(document.getElementById('original_price').value);
    const moneyAmount = parseFloat(document.getElementById('money_amount').value);
    const returnType = document.querySelector('input[name="return_type"]:checked').value;

    if (returnType === 'Money') {
        if (moneyAmount >= originalPrice) {
            alert('Expected money should be less than the original price when "Return Money" is selected.');
            return false;
        }
    } else if (returnType === 'Token') {
        if (moneyAmount >= originalPrice * 0.95) {
            alert('Expected token amount should be at least 5% less than the original price when "Return Token" is selected.');
            return false;
        }
    }

    return true;
}

function displayImagePreview(input) {
    if (input.files && input.files[0]) {
        const reader = new FileReader();
        reader.onload = function (e) {
            document.getElementById('imagePreview').src = e.target.result;
        }
        reader.readAsDataURL(input.files[0]);
    }
}

function validatePublicationYear() {
    const pubYear = document.getElementById('publication_year').value;
    const currentYear = new Date().getFullYear();
    if (pubYear < 0 || pubYear > currentYear) {
        alert('Please enter a valid publication year.');
        document.getElementById('publication_year').value = '';
    }
}

/*

	// Validation function for selling price <= original price when "Return Money" is selected
	function validateSellingPrice() {
	    var originalPriceInput = document.getElementById("original_price");
	    var sellingPriceInput = document.getElementById("money_amount");
	    var returnMoneyRadio = document.querySelector('input[name="return_type"][value="Money"]:checked');

	    var originalPrice = parseFloat(originalPriceInput.value);
	    var sellingPrice = parseFloat(sellingPriceInput.value);

	    if (returnMoneyRadio && sellingPrice > originalPrice) {
	        // Selling price is greater than original price
	        sellingPriceInput.setCustomValidity("Selling price must be less than or equal to the original price when returning money.");
	    } else {
	        // Valid selling price
	        sellingPriceInput.setCustomValidity("");
	    }
	}
	
	// Validation function for publication year <= current year
	function validatePublicationYear() {
	    var publicationYearInput = document.getElementById("publication_year");
	    var currentYear = new Date().getFullYear();
	    var publicationYear = parseInt(publicationYearInput.value);

	    if (publicationYear > currentYear) {
	        // Publication year is greater than current year
	        publicationYearInput.setCustomValidity("Publication year must be less than or equal to the current year.");
	    } else {
	        // Valid publication year
	        publicationYearInput.setCustomValidity("");
	    }
	}

     // showing preview of image
        function displayImagePreview(input) {
        	var file = input.files[0];
        	if (file) {
        		var reader = new FileReader();
        		reader.onload = function(e) {
        			$("#imagePreview").attr("src", e.target.result);
        		};
        		reader.readAsDataURL(file);
        	}
        }


*/