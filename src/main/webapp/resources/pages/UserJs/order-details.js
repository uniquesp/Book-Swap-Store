$(document).ready(function() {
	displayOrders();
});

function displayOrders() {
	$.ajax({
		url: contextPath + "/user?method=display_orders",
		type: 'POST',
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				var cartItems = response.cartitems;
				var cartContainer = $(".shopping-cart");
				
				var headerRow = '<div class="cart-header d-none d-sm-none d-mb-block d-lg-block">' +
					'<div class="row">' +
					'<div class="col-md-4"><h4>Products</h4></div>' +
					'<div class="col-md-2"><h4>BookPrice</h4></div>' +
					'<div class="col-md-2"><h4>Quantity</h4></div>' +
					'<div class="col-md-2"><h4>Total</h4></div>' +
					'<div class="col-md-2"><h4>Status</h4></div>' +
					'</div>' +
					'</div>';
				cartContainer.append(headerRow);

				
				cartItems.forEach(function(item) {
					// Generate HTML for cart item
					var cartItemHTML = generateCartItemHTML(item);
					cartContainer.append(cartItemHTML);
					// Attach data item to cart item for later reference
					$(".cart-item").last().data('item', item);
				});
			} else {
				console.log("Something went wrong");
			}
		}
	});
}

function generateCartItemHTML(item) {
	var cartItemHTML = '<div class="cart-item">' +
		'<div class="row">' +
		'<div class="col-md-4 my-auto">' +
		'<a href=""><label class="product-name">' +
		'<img src="' + contextPath + '/resources/images/books/' + item.bookimage + '" style="width: 50px; height: 50px" alt="">' +
		item.bookname +
		'</label></a>' +
		'</div>' +
		'<div class="col-md-2 my-auto">' +
		'<label class="price">' + item.bookprice + '</label>' +
		'</div>' +
		'<div class="col-md-2 col-7 my-auto">' +
		'<div class="quantity">' +
		'<div class="input-group">' +
		'<input type="text" class="input-quantity" value="' + item.cartItemQuantity + '" readonly />'+
		'</div>' +
		'</div>' +
		'</div>' +
		'<div class="col-md-2 my-auto">' +
		'<label class="price total">' + item.totalPrice + '</label>' +
		'</div>' +
		'<div class="col-md-2 col-5 my-auto">' +
		'<div class="remove">' +
		'<a href="#" class="btn btn-success btn-sm">Payment Done</a>' +
		'</div>' +
		'</div>' +
		'</div>' +
		'</div>';
	return cartItemHTML;
}



