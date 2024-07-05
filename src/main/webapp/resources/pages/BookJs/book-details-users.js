$(document).ready(function() {
	getAllBookDetails();
	if (localStorage.getItem('userId') !== null) {
		loadWishlistItems();
	}
});

function getAllBookDetails() {
    $.ajax({
        url: contextPath + "/book?method=display_book",
        type: 'POST',
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                var productListContainer = $('#productListContainer'); // Container to hold product list
                productListContainer.empty(); // Clear previous products

                $.each(response.books, function(index, book) {
                    // Create a new product item
                    var bookid = book.id;
					var bookprice = book.price;
					
                    var productItem = $('<div class="col-lg-4 col-md-6 col-sm-6">' +
                        '<div class="product__item">' +
                        '<div class="product__item__pic set-bg" data-setbg="' + contextPath + '/resources/images/books/' + book.image + '">' +
                        '<span class="label" style="background-color: black; color: white">'+book.bookStatus+'</span>'+
                        '<ul class="product__hover">' +
                        '<li><a href="#" onclick="addToWishlistCheck('+bookid+')"><img src="' + contextPath + '/resources/images/user/icon/heart.png" alt=""></a></li>' +
                        '<li><a href="#" onclick="viewBook('+bookid+')"><img src="' + contextPath + '/resources/images/user/icon/view.png" alt=""></a></li>' +
                        '</ul>' +
                        '</div>' +
                        '<div class="product__item__text">' +
                        '<h6>' + book.title + '</h6>' +
                        '<a href="#" class="add-cart" onclick="addToCartCheck('+ bookid + ',' + bookprice + ')">+ Add To Cart</a>' +
                        '<h6>' + book.author + '</h6>' +
                        '<h5>Rs. ' + book.price + '</h5>' +
                         '<input type="hidden" name="category" value="'+book. category+'" >'+
                        '<input type="hidden" name="subcategory" value="'+ book.sub_category+'" >'+
                         '<input type="hidden" name="language" value="'+ book.language+'" >'+
                        '</div>' +
                        '</div>' +
                        '</div>');
                    productListContainer.append(productItem);
                    
                      $('.set-bg').each(function() {
        var bg = $(this).data('setbg');
        if (bg) {
            $(this).css('background-image', 'url(' + bg + ')');
        }
    });
                });
            }
        }
    });
}




/*function getAllBookDetails() {
	$.ajax({
		url: contextPath + "/book?method=display_book",
		type: 'POST',
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				// Assuming response.books is the array of book details
				var cardContainer = $('#cardbody');
				var row = $('<div class="row"></div>');

				$.each(response.books, function(index, book) {
					// Create a new product card for each book
					var bookid = book.id;
					var bookprice = book.price;
					var newCard = $('<div class="col-md-4"><div class="product-card">' +
						'<div class="product-card-img"><label class="stock bg-primary">'+book.bookStatus+'</label>' +
						'<img width="40px" height="auto" src="' + contextPath + '/resources/images/books/' + book.image + '" alt="' + book.author + '"></div>' +
						'<div class="product-card-body"><p class="product-brand">' + book.author + '</p>' +
						'<h5 class="product-name"><a href="">' + book.title + '</a></h5>' +
						'<div><span class="selling-price">Rs. ' + book.price + '</span> ' +
						'<div class="mt-2">' +
						'<button class="btn btn1" onclick="addToCartCheck(' + bookid + ',' + bookprice + ')"><i class="fa fa-shopping-cart"></i> Add To Cart</button>' +
						'<button class="btn btn1" onclick="addToWishlistCheck('+bookid+')"><i class="fa fa-heart"></i></button>' +
						'<button class="btn btn1" onclick="window.location.href=\'Book-View.jsp\'">View</button>' +
						'<button class="btn btn1" onclick="#">View</button>' +
						'</div></div></div></div>');
					localStorage.setItem("id",bookid );
					// Append the new card to the current row
					row.append(newCard);

					// If three cards are added, create a new row
					if ((index + 1) % 3 === 0 || index === response.books.length - 1) {
						cardContainer.append(row);
						row = $('<div class="row"></div>');
					}
				});
			}
		}
	});
}*/

/*function displayCartCount() {
    // Retrieve cartInfo JSON string from local storage	
    var cartInfoString = localStorage.getItem("cartInfo");
    // Check if cartInfoString is not null or undefined
    if (cartInfoString) {
        // Parse the JSON string back into an object
        var cartInfo = JSON.parse(cartInfoString);
        // Access the count property and assign it to the cart count element
        $(".cart-count").text(cartInfo.count);
    }
}*/

function addToCartCheck(bookid, bookprice) {
	$.ajax({
		url: contextPath + "/user?method=check_userlogin",
		type: 'POST',
		contentType: false,
		processData: false,
		dataType: 'json',
		success: function(response) {
			if (response.status) {
				addToCart(response.userId, bookid, bookprice);
			} else {
				alert("Please login first before adding to cart");
				window.location.href = "User-Login.jsp";
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}

function addToCart(userId, bookid, bookprice) {
	// check item is present or not
	if (isItemInCart(bookid)) {
		alert("Item is already in the cart");
		return;
	}
	$.ajax({
		url: contextPath + "/user?method=add_to_cart",
		type: 'POST',
		data: {
			userId: userId,
			bookId: bookid,
			quantity: 1,
			price: bookprice
		},
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				alert(response.message);
			calculateCountInCart();
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}


function isItemInCart(bookid) {
	var isPresent = false;

	$.ajax({
		url: contextPath + "/user?method=display_cart",
		type: 'POST',
		dataType: 'json',
		async: false, // Set async to false to wait for the response
		success: function(response) {
			if (response.success) {
				var cartItems = response.cartitems;
				cartItems.forEach(function(item) {
					if (item.bookId === bookid) {
						isPresent = true;
						return false; // Break the loop since the item is found
					}
				});
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});

	return isPresent;
}

	
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




function addToWishlistCheck(bookid){
	$.ajax({
		url: contextPath + "/user?method=check_userlogin",
		type: 'POST',
		contentType: false,
		processData: false,
		dataType: 'json',
		success: function(response) {
			if (response.status) {
				addToWishlist(response.userId, bookid);
			} else {
				alert("Please login first before adding to Wishlist");
				window.location.href = "User-Login.jsp";	
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}


function addToWishlist(userId, bookid){
	$.ajax({
		url: contextPath + "/user?method=add_to_wishlist",
		type: 'POST',
		data: {
			userId: userId,
			bookId: bookid,
		},
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				alert(response.message);
				window.location.reload();
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}


/*function loadWishlistItems() {
    $.ajax({
        url: contextPath + "/user?method=display_wishlist",
        type: 'POST',
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                var wishlistContainer = $('#wishlistContainer');
                wishlistContainer.empty(); 
                
                $.each(response.wishlist, function(index, item) {
                    var wishlistItem = createWishlistItem(item);
                    wishlistContainer.append(wishlistItem);
                });
            } else {
                $('#wishlistContainer').html('<p>No items found</p>');
            }
        },
        error: function(error) {
            console.error("An error occurred while fetching wishlist items: " + error);
        }
    });
}

function createWishlistItem(item) {
    var wishlistItemHtml = '<div class="col-6 col-md-3">' +
        '<div class="category-card">' +
        '<a href="">' +
        '<div class="category-card-img">' +
        '<img width="400px" height="auto" src="' + contextPath + '/resources/images/books/' + item.bookimage + '">' +
        '</div>' +
        '<div class="category-card-body">' +
        '<h5>' + item.bookname + '</h5>' +
        '</div>' +
        '<div class="category-card-body">' +
        '<label>' + item.bookprice + '</label>' +
        '<a href="#" onclick="addToCart('+item.userId+','+item.bookId+','+item.bookprice+')" class="btn btn1"> <i class="fa fa-shopping-cart"></i></a>' +
        '<a href="#" onclick="addToWishlist('+item.userId+','+item.bookId+')" class="btn btn1"> <i class="fa fa-heart"></i></a>' +
        '</div>' +
        '</a>' +
        '</div>' +
        '</div>';
    
    return $(wishlistItemHtml);
}
*/

function loadWishlistItems() {
    $.ajax({
        url: contextPath + "/user?method=display_wishlist",
        type: 'POST',
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                var wishlistContainer = $('#wishlistContainer');
                wishlistContainer.empty(); 
                
                $.each(response.wishlist, function(index, item) {
                    var wishlistItem = createWishlistItem(item);
                    wishlistContainer.append(wishlistItem);
                });
            } else {
                $('#wishlistContainer').html('<p>No items found</p>');
            }
        },
        error: function(error) {
            console.error("An error occurred while fetching wishlist items: " + error);
        }
    });
}

function createWishlistItem(item) {
    var wishlistItemHtml = 
        '<div class="col-lg-4 col-md-6 col-sm-6">' +
            '<div class="product__item sale">' +
                '<div class="product__item__pic set-bg" data-setbg="' + contextPath + '/resources/images/books/' + item.bookimage + '">' +
                    '<ul class="product__hover">' +
                        '<li><a href="#"><img src="' + contextPath + '/resources/images/user/icon/heart.png" alt=""></a></li>' +
                        '<li><a href="#"><img src="' + contextPath + '/resources/images/user/icon/view.png" alt=""></a></li>' +
                    '</ul>' +
                '</div>' +
                '<div class="product__item__text">' +
                    '<h6>' + item.bookname + '</h6>' +
                    '<a href="#" class="add-cart" onclick="addToCart(' + item.userId + ',' + item.bookId + ',' + item.bookprice + ')">+ Add To Cart</a>' +
                    '<div class="rating">' +
                        
                    '</div>' +
                    '<h5>Rs ' + item.bookprice + '</h5>' +
                '</div>' +
            '</div>' +
        '</div>';
    
    return $(wishlistItemHtml);
}


function viewBook(bookId) {
    localStorage.setItem('id', bookId);
    window.location.href = 'Book-View.jsp';
}


