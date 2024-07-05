$(document).ready(function() {
	var bookId = localStorage.getItem("id");
	displayViewBook(bookId)
});

function displayViewBook(bookId) {
    $.ajax({
        url: contextPath + "/book?method=get_book",
        type: 'POST',
        dataType: 'json',
        data: { id: bookId },
        success: function(response) {
            if (response.success) {
                var bookDetails = response.books[0];

                $("#bookTitle").text(bookDetails.title);

                // Update stock label
                $("#stockLabel").removeClass("bg-danger bg-success").addClass(bookDetails.bookStatus ? "bg-success" : "bg-danger").text(bookDetails.bookStatus ? "In Stock" : "Out of Stock");

                // Update selling price
                $("#sellingPrice").text("Rs " + bookDetails.price);

                // Update languages
             var languagesHtml = "";
                if (bookDetails.languages && bookDetails.languages.length > 0) {
                    $.each(bookDetails.languages, function(index, language) {
                        languagesHtml += '<label for="' + language + '">' + language + '</label>';
                        languagesHtml += '<input type="radio" id="' + language + '" name="language" value="' + language + '" />';
                    });
                } else {
                    languagesHtml = "<p>No languages available</p>";
                }
                $(".product__details__option__size").html('<span>Languages:</span>' + languagesHtml);


                // Update description
             
					var lastOptionHtml = "<h5><span>Guaranteed Safe Checkout</span></h5>" +
				    "<ul>" +
				    "<li><span>Publication Year:</span> " + bookDetails.publicationYear + "</li>" +
				    "<li><span>Publisher:</span> " + bookDetails.publisher + "</li>" +
				    "<li><span>Author:</span> " + bookDetails.author + "</li>" +
				    "<li><span>Category:</span> " + bookDetails.category + "</li>" +
				    "<li><span>SubCategory:</span> " + bookDetails.sub_category + "</li>" +
				    "</ul>";
				$(".product__details__last__option").html(lastOptionHtml);
				
					var description = "<p>"+bookDetails.description +"</p>"
				$(".product__details__tab__content").html(description)
				
                // Update image source
                $("#bookImage").attr("src", contextPath + '/resources/images/books/' + bookDetails.image);

                // Update add to cart and add to wishlist links (you need to provide proper href values or handle clicks separately)
                $("#cartadd").attr("href", contextPath + "/cart/add?id=" + bookDetails.id);
                $("#wishlistadd").attr("href", contextPath + "/wishlist/add?id=" + bookDetails.id);
            } else {
                console.log("Failed to retrieve book details.");
            }
        },
        error: function (xhr, status, error) {
            alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
        }
    });
}