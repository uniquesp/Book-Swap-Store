$(document).ready(function() {
	if (localStorage.getItem('userId') !== null) {
		calculateCountInCart();
	}
});

function calculateCountInCart() {
	$.ajax({
		url: contextPath + "/user?method=cart_count",
		dataType: "json",
		success: function(response) {
			if (response.success) {
				let cartCountElement = $(".cart-count");
				cartCountElement.text("0");
				let itemcount = response.count;
				var currentCount = parseInt(cartCountElement.text());
				cartCountElement.text(itemcount);
			} else {
				console.error("Failed to retrieve cart count. Error message: " + response.message);
			}
		},
		error: function(error) {
			console.error("An error occurred while fetching cart count: " + error);
		}
	});
}