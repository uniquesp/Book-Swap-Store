$(document).ready(function() {
    var defaultPageNumber = 1;
   // var defaultPageSize = 5; 
    displayFilteredBooks(1,5 );

    $('#pageSizeSelect').change(function() {
        var selectedPageSize = $(this).val();
        displayFilteredBooks(defaultPageNumber, selectedPageSize);
    });
});

function displayFilteredBooks(pageNumber, pageSize) {
    $.ajax({
        url: contextPath + "/book?method=display_filtered_books",
        type: 'POST',
        dataType: 'json',
        data: {
            pageNumber: pageNumber,
            pageSize: pageSize
        },
        success: function(response) {
            if (response.success) {
                var cartItems = response.books;
                var totalCount = response.totalCount;
                var cartContainer = $(".filteredItems");

                var headerRow = '<div class="cart-header d-none d-sm-none d-mb-block d-lg-block">' +
                    '<div class="row">' +
                    '<div class="col-md-4"><h4>Products</h4></div>' +
                    '<div class="col-md-2"><h4>Book Price</h4></div>' +
                    '<div class="col-md-2"><h4>Quantity</h4></div>' +
                    '<div class="col-md-2"><h4>Total</h4></div>' +
                    '<div class="col-md-2"><h4>Status</h4></div>' +
                    '</div>' +
                    '</div>';
                cartContainer.empty(); 
                cartContainer.append(headerRow);

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
        '<input type="text" class="input-quantity" value="' + item.cartItemQuantity + '" readonly />' +
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
        displayFilteredBooks(pageNumber, selectedPageSize);
    }
