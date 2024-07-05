$(document).ready(function() {
	displayBookSellRequest();
});


function displayBookSellRequest() {
	$.ajax({
		url: contextPath + "/book?method=sell_request",
		type: 'POST',
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				var requestItems = response.sellRequests;
				var requestContainer = $(".shopping__cart__table tbody");
				var cartHeader = $(".shopping__cart__table thead.cart-header");
				var headerRow = '<tr>' +
					'<th>Book</th>' +
					'<th>Book Price</th>' +
					'<th>Expected Price</th>' +
					'<th>Publication Year</th>' +
					'<th>Status</th>' +
					'</tr>';
				cartHeader.empty();
				cartHeader.append(headerRow);
				// Add each sell request item
				requestItems.forEach(function(item) {
					var requestItemHTML = generateSellRequestItemHTML(item);
					requestContainer.append(requestItemHTML);
				});
			} else {
				console.log("Something went wrong");
			}
		}
	});
}

function generateSellRequestItemHTML(item) {
	var Requeststatus = item.status;
	var requestItemHTML = `
                <tr>
                    <td class="product__cart__item">
                        <div class="product__cart__item__pic">
                            <img src="${contextPath}/resources/images/books/${item.book_image}" style="width: 50px; height: 50px" alt="">
                        </div>
                        <div class="product__cart__item__text">
                            <h6>${item.book_name}</h6>
                        </div>
                    </td>
                    <td class="cart__price">${item.orignal_price}</td>
                    <td class="cart__price">${item.selling_price}</td>
                    <td class="cart__price">${item.publication_Year}</td>
                    <td class="cart__price">`;

	if (Requeststatus === "Accepted") {
		requestItemHTML += `<a href="#" class="btn btn-success btn-sm">Accepted</a>`;
	} else if (Requeststatus === "Rejected") {
		requestItemHTML += `<a href="#" class="btn btn-danger btn-sm">Rejected</a>`;
	} else {
		requestItemHTML += `<a href="#" class="btn btn-warning btn-sm">Request Pending</a>`;
	}

	requestItemHTML += `</td>
                </tr>`;

	return requestItemHTML;
}


