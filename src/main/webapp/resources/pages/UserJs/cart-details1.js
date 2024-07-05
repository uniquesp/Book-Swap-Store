$(document).ready(function() {
	displayCart();
});


function displayCart() {
	$.ajax({
		url: contextPath + "/user?method=display_cart",
		type: 'POST',
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				var cartItems = response.cartitems;
				var cartContainer = $(".shopping-cart");
				var cartCountElement = $(".cart-count");
				cartCountElement.text("0");

				// Dynamically create and insert <h4> elements
				var headerRow = '<div class="cart-header d-none d-sm-none d-mb-block d-lg-block">' +
					'<div class="row">' +
					'<div class="col-md-4"><h4>Products</h4></div>' +
					'<div class="col-md-2"><h4>Price</h4></div>' +
					'<div class="col-md-2"><h4>Quantity</h4></div>' +
					'<div class="col-md-2"><h4>Total</h4></div>' +
					'<div class="col-md-2"><h4>Remove</h4></div>' +
					'</div>' +
					'</div>';
				cartContainer.append(headerRow);


				cartItems.forEach(function(item) {
					var currentCount = parseInt(cartCountElement.text());
					cartCountElement.text(currentCount + item.cartItemQuantity);
					updateCartCount(currentCount + item.cartItemQuantity, item.userId);
					// Generate HTML for cart item
					var cartItemHTML = generateCartItemHTML(item);
					cartContainer.append(cartItemHTML);
					// Attach data item to cart item for later reference
					$(".cart-item").last().data('item', item);
				});


				var finalTotalRow = '<div class="cart-item">' +
					'<div class="row">' +
					'<div class="col-md-8 text-left"><strong>Total Amount:</strong></div>' +
					'<div class="col-md-4"><span id="final-total"></span></div>' +
					'</div>' +
					'</div> <hr>';
				cartContainer.append(finalTotalRow);
				updateFinalTotal();

				// Hide the checkout button initially
				var checkoutBtn = '<div class="row  checkout-btn " style="display: none; margin-top:20px;">' +
					'<div class="col-md-10 text-right"></div>' +
					'<div class="col-md-2 text-left"><a href="#" class="btn btn-success btn-sm" onclick="AmountFetching(' + true + ')">CHECKOUT</a></div>' +
					'</div>';

				// Append the checkout button and apply token button
				var applyTokenbtn = '<div class="row apply-token-row" style="margin-top:20px;">' +
					'<div class="col-md-10 text-left"><a href="#" class="btn btn-dark btn-sm apply-token-btn" onclick="toggleSummaryRow()"><i class="fa fa-percent"></i> Apply Token</a></div>' +
					'<div class="col-md-2 text-left"><a href="#" class="btn btn-success btn-sm checkwitouttkn" onclick="AmountFetching(' + false + ')">CHECKOUT</a></div>' +
					'</div>';

				cartContainer.append(applyTokenbtn);
				cartContainer.append(checkoutBtn);

				var summaryRow = generateSummaryRow(cartItems[0].tokenAmount);
				// Append the summary row to the cart container
				cartContainer.append(summaryRow);

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
		'<a href="" style="color:black"><label class="product-name">' +
		'<img src="' + contextPath + '/resources/images/books/' + item.bookimage + '" style="width: 60px; height: 80px; margin-right:5px; margin-top:5px" alt="">' +
		item.bookname +
		'</label></a>' +
		'</div>' +
		'<div class="col-md-2 my-auto">' +
		'<label class="price">' + item.bookprice + '</label>' +
		'</div>' +
		'<div class="col-md-2 col-7 my-auto">' +
		'<div class="quantity">' +
		'<div class="input-group">' +
		'<span class="btn btn1 decrease-quantity" onclick="decreaseQuantity(this,' + item.cartId + ',' + item.tokenAmount + ')"><i class="fa fa-minus"></i></span>' +
		'<input type="text" value="' + item.cartItemQuantity + '" class="input-quantity" data-cartid="' + item.cartId + '" data-price="' + item.bookprice + '"/>' +
		'<span class="btn btn1 increase-quantity" onclick="increaseQuantity(this,' + item.cartId + ',' + item.tokenAmount + ')"><i class="fa fa-plus"></i></span>' +
		'</div>' +
		'</div>' +
		'</div>' +
		'<div class="col-md-2 my-auto">' +
		'<label class="price total">' + item.totalPrice + '</label>' +
		'</div>' +
		'<div class="col-md-2 col-5 my-auto">' +
		'<div class="remove">' +
		'<a href="#" onclick="removefromcart(' + item.cartId + ')" class="btn btn-danger btn-sm"><i class="fa fa-trash"></i> Remove</a>' +
		'</div>' +
		'</div>' +
		'</div>' +
		'</div>'+
		'<hr>';
	return cartItemHTML;
}



function generateSummaryRow(tokenAmount) {
	var orderTotal = parseFloat($("#final-total").text());
	var Amount = (orderTotal < tokenAmount) ? orderTotal : tokenAmount;
	var grandTotal = (orderTotal >= tokenAmount) ? (orderTotal - tokenAmount) : 0.00;


	// Generate summary row HTML
	var summaryRow = '<div class="cart-item summary-row" style="display: none;">' +
		'<div class="row">' +
		'<div class="col-md-8 text-right"><strong>Price Summary:</strong></div>' +
		'<div class="col-md-4"></div>' +
		'</div>' +
		'<div class="row">' +
		'<div class="col-md-8 text-right">Order Total:</div>' +
		'<div class="col-md-4">Rs. <span id="order-total">' + orderTotal.toFixed(2) + '</span></div>' +
		'</div>' +
		'<div class="row">' +
		'<div class="col-md-8 text-right">Token Discount:</div>' +
		'<div class="col-md-4">Rs. - <span id="token-discount">' + Amount.toFixed(2) + '</span></div>' +
		'</div>' +
		'<div class="row">' +
		'<div class="col-md-8 text-right"><strong>---------------------</strong></div>' +
		'<div class="col-md-4"><strong>-----------------</strong></div>' +
		'</div>' +
		'<div class="row">' +
		'<div class="col-md-8 text-right"><strong>Grand Total:</strong></div>' +
		'<div class="col-md-4"><strong>Rs. <span id="grand-total">' + grandTotal.toFixed(2) + '</span></strong></div>' +
		'</div>' +
		'</div>';

	return summaryRow;
}


function toggleSummaryRow() {
	var summaryRow = $('.summary-row');
	var applyTokenRow = $('.apply-token-row');
	var applyTokenBtn = $('.apply-token-btn');
	var checkoutBtn = $('.checkout-btn');
	var checkwithouttkn = $('.checkwitouttkn');
	// If summary row is hidden, show it below the apply button
	if (summaryRow.is(':hidden')) {
		applyTokenRow.after(summaryRow);
		summaryRow.show();
		applyTokenBtn.removeClass('btn-primary').addClass('btn-danger').html('<i class="fa fa-times"></i> Remove Token');
		checkoutBtn.show(); // Show the checkout button
		checkwithouttkn.hide();
	} else {
		summaryRow.hide();
		applyTokenBtn.removeClass('btn-danger').addClass('btn-primary').html('<i class="fa fa-percent"></i> Apply Token');
		checkoutBtn.hide(); // Hide the checkout button
		checkwithouttkn.show();
	}
}



// Function to increase quantity
function increaseQuantity(element, cartId, tokenAmount) {
	var quantityInput = $(element).siblings(".input-quantity");
	var currentQuantity = parseInt(quantityInput.val());
	var newquantity = currentQuantity + 1;
	quantityInput.val(currentQuantity + 1);
	var item = $(element).closest('.cart-item').data('item');
	updateTotalPrice($(element).closest('.cart-item'), currentQuantity + 1, item.bookprice);
	updateLocalStorage(item.userId, item.cartId, currentQuantity + 1, item.bookprice);
	updateFinalTotal();
	handleQuantityChange(newquantity, cartId);
	generateSummaryRow(tokenAmount);
	window.location.reload();
}

// Function to decrease quantity
function decreaseQuantity(element, cartId, tokenAmount) {
	var quantityInput = $(element).siblings(".input-quantity");
	var currentQuantity = parseInt(quantityInput.val());
	if (currentQuantity > 1) {
		var newquantity = currentQuantity - 1;
		quantityInput.val(currentQuantity - 1);
		var item = $(element).closest('.cart-item').data('item');
		updateTotalPrice($(element).closest('.cart-item'), currentQuantity - 1, item.bookprice);
		updateLocalStorage(item.userId, item.cartId, currentQuantity - 1, item.bookprice);
		updateFinalTotal();
		handleQuantityChange(newquantity, cartId);
		generateSummaryRow(tokenAmount);
		window.location.reload();
	}
}

// calculate grandTotal
function updateFinalTotal() {
	var totalPriceElements = $(".price.total");
	var finalTotal = 0;
	totalPriceElements.each(function() {
		finalTotal += parseFloat($(this).text());
	});
	$("#final-total").text(finalTotal.toFixed(2));
	$("#order-total").text(finalTotal.toFixed(2));
	return finalTotal;
}


function handleQuantityChange(newQuantity, cartId) {
	// Perform AJAX call with the new quantity and cart ID
	$.ajax({
		url: contextPath + "/user?method=update_cart",
		type: 'POST',
		data: { quantity: newQuantity, cartId: cartId },
		success: function(response) {
			console.log(response);
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}

function updateCartCount(count, userId) {
	var cartInfo = {
		count: count,
		userId: userId
	};
	// Convert cartInfo object to a JSON string
	var cartInfoString = JSON.stringify(cartInfo);
	// Store the JSON string in local storage
	localStorage.setItem("cartInfo", cartInfoString);
}

//update total price
function updateTotalPrice(cartItem, quantity, bookPrice) {
	var totalPriceElement = cartItem.find(".total");
	var totalPrice = quantity * bookPrice;
	totalPriceElement.text(totalPrice);
}

//Add ites to localstorage
function updateLocalStorage(userId, cartId, quantity, price) {
	var cartItems = JSON.parse(localStorage.getItem("cartItems")) || {};
	cartItems[cartId] = {
		userId: userId,
		quantity: quantity,
		totalPrice: quantity * price
	};
	localStorage.setItem("cartItems", JSON.stringify(cartItems));
}

//Remove cart items
function removefromcart(cartId) {
	$.ajax({
		url: contextPath + "/user?method=delete_cartitems",
		type: 'POST',
		dataType: 'json',
		data: { id: cartId },
		success: function(response) {
			if (response.success) {
				window.location.reload();
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}


function checkoutFromCart(bookId) {
	$.ajax({
		url: contextPath + "/user?method=checkout_cart",
		type: 'POST',
		dataType: 'json',
		data: { bookId: bookId },
		success: function(response) {
			if (response.success) {
				alert("checkoutdone");
				window.location.reload();
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}


function checkoutWithoutToken(bookId) {
	$.ajax({
		url: contextPath + "/user?method=checkout_without_token",
		type: 'POST',
		dataType: 'json',
		data: { bookId: bookId },
		success: function(response) {
			if (response.success) {
				alert("checkoutdone");
				window.location.reload();
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}



function AmountFetching(istokenused) {
	$.ajax({
		url: contextPath + "/user?method=fetch_amount",
		type: 'POST',
		dataType: 'json',
		data: { token: istokenused },
		success: function(response) {
			if (response.success) {
				/*alert("checkoutdone"+istokenused);*/
				//alert(response.totalAmount);
				doPayment(response);
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}

function doPayment(elements) {

	var amount = elements.totalAmount;
	if (amount < 1) {
		alert("Payment Successful");
		window.location.href = "User-Orders-History.jsp";
	}
	const paymentStart = () => {
		if (amount == "" || amount == null) {
			alert("Amount Fetching problem");
			return;
		}
	}
	//send requet to cerate order
	$.ajax({
		type: "POST",
		url: contextPath + "/user",
		//url: contextPath + "/user?method=create_order&amount="+amount,
		data: {
			"method": "create_order",
			"amount": amount,
			"info": "order_request"
		},
		success: function(response) {
			var field = JSON.parse(response);
			if (field.status == 'created') {
				//open payment form 
				let options = {
					key: "rzp_test_XEbtsJYNBs2fwY",
					amount: field.amount,
					currency: "INR",
					name: "BookSwapStore",
					description: "BookShop",
					image: "",
					order_id: field.id,
					handler: function(response) {
						console.log(response.razorpay_payment_id);
						console.log(response.razorpay_order_id);
						console.log(response.razorpay_signature);
						console.log("Payment Successful!!!");
						alert("Payment Successful!!!");
						AfterCheckoutdone(elements);
					},
					prefill: {
						name: "",
						email: "",
						contact: "",
					},
					notes: {
						address: "BookSwapStore Pune	",
					},
					theme: {
						color: "#3399cc",
					},
				};

				let rzp = new Razorpay(options);
				rzp.on("payment.failed", function(response) {
					console.log(response.error.code);
					console.log(response.error.description);
					console.log(response.error.source);
					console.log(response.error.step);
					console.log(response.error.reason);
					console.log(response.error.metadata.order_id);
					console.log(response.error.metadata.payment_id);
					alert("Payment Failed");
				});


				rzp.open();
			}
		},

		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}

function AfterCheckoutdone(elements) {

	/*alert(elements.isTokenUsed+",  "+elements.userId +","+totalAmount);*/
	$.ajax({
		url: contextPath + "/user?method=after_checkout",
		type: 'POST',
		dataType: 'json',
		data: {
			istokenused: elements.isTokenUsed,
			userId: elements.userId
		},
		success: function(response) {
			if (response.success) {
				window.location.href = "User-Orders-History.jsp";
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}



