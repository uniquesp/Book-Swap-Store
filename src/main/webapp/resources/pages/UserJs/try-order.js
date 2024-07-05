$(document).ready(function() {
    var defaultPageNumber = 1;
   // var defaultPageSize = 5; 
    displayOrders(1,5 );

    $('#pageSizeSelect').change(function() {
        var selectedPageSize = $(this).val();
        displayOrders(defaultPageNumber, selectedPageSize);
    });
});

function displayOrders(pageNumber, pageSize) {
    $.ajax({
        url: contextPath + "/user?method=display_orders_pagignation",
        type: 'POST',
        dataType: 'json',
        data: {
            pageNumber: pageNumber,
            pageSize: pageSize
        },
        success: function(response) {
            if (response.success) {
                var cartItems = response.cartitems;
                var totalCount = response.total_count;
              var cartContainer = $(".shopping__cart__table tbody");
                var cartHeader = $(".shopping__cart__table thead.cart-header");

                 var headerRow = '<tr>' +
                    '<th>Book</th>' +
                    '<th>Book Price</th>' +
                    '<th>Quantity</th>' +
                    '<th>Total</th>' +
                    '<th>Status</th>' +
                    '</tr>';
                
                cartHeader.empty();
                cartHeader.append(headerRow);


                cartItems.forEach(function(item) {
                    var cartItemHTML = generateCartItemHTML(item);
                    cartContainer.append(cartItemHTML);
                    $(".cart-item").last().data('item', item);
                });

                var paginationInfo = 'Displaying ' + cartItems.length + ' of ' + totalCount + ' items.';
                $('.pagination-info').text(paginationInfo);
                
                generatePaginationButtons(pageNumber, pageSize, totalCount);
                 
            } else {
                console.log("Something went wrong");
            }
        }
    });
}

// Function to generate HTML for cart item
function generateCartItemHTML(item) {
    var cartItemHTML = '<tr class="cart-item">' +
        '<td class="product__cart__item">' +
        '<div class="product__cart__item__pic">' +
        '<img src="' + contextPath + '/resources/images/books/' + item.bookimage + '" style="width: 50px; height: 50px" alt="">' +
        '</div>' +
        '<div class="product__cart__item__text">' +
        '<h6>' + item.bookname + '</h6>' +
        '</div>' +
        '</td>' +
        '<td class="cart__price">' + item.bookprice + '</td>' +
        '<td class="quantity__item">' +
        '<div class="quantity">' +
        '<div class="pro-qty-2">' +
        '<input type="text" value="' + item.cartItemQuantity + '" readonly />' +
        '</div>' +
        '</div>' +
        '</td>' +
        '<td class="cart__total">' + item.totalPrice + '</td>' +
        '<td class="cart__status">' +
        '<a href="#" class="btn btn-success btn-sm">Payment Done</a>' +
        '</td>' +
        '</tr>';
    return cartItemHTML;
}



//  generate pagination buttons
function generatePaginationButtons(pageNumber, pageSize, totalCount) {
    var totalPages = Math.ceil(totalCount / pageSize);
    var paginationButtonsHTML = '<nav aria-label="Page navigation example">' +
                                '<ul class="pagination justify-content-end">';

    if (totalPages > 1) {
        paginationButtonsHTML += '<li class="page-item ' + (pageNumber === 1 ? 'disabled' : '') + '">' +
                                '<a class="page-link" href="#" onclick="navigateToPage(1)" tabindex="-1">First</a>' +
                                '</li>' +
                                '<li class="page-item ' + (pageNumber === 1 ? 'disabled' : '') + '">' +
                                '<a class="page-link" href="#" onclick="navigateToPage(' + (pageNumber - 1) + ')" tabindex="-1">Previous</a>' +
                                '</li>';
        for (var i = 1; i <= totalPages; i++) {
            paginationButtonsHTML += '<li class="page-item ' + (i === pageNumber ? 'active' : '') + '">' +
                                    '<a class="page-link" href="#" onclick="navigateToPage(' + i + ')">' + i + '</a>' +
                                    '</li>';
        }
        paginationButtonsHTML += '<li class="page-item ' + (pageNumber === totalPages ? 'disabled' : '') + '">' +
                                '<a class="page-link" href="#" onclick="navigateToPage(' + (pageNumber + 1) + ')">Next</a>' +
                                '</li>' +
                                '<li class="page-item ' + (pageNumber === totalPages ? 'disabled' : '') + '">' +
                                '<a class="page-link" href="#" onclick="navigateToPage(' + totalPages + ')">Last</a>' +
                                '</li>';
    }

    paginationButtonsHTML += '</ul>' +
                            '</nav>';

    $('.pagination-buttons').html(paginationButtonsHTML);
}

    //  navigate to a specific page
    function navigateToPage(pageNumber) {
        var selectedPageSize = $('#pageSizeSelect').val();
        displayOrders(pageNumber, selectedPageSize);
    }
