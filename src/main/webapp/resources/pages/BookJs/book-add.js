$(document).ready(function() {
    fetchCategoryNames();
});

$('#categorySelect').change(function() {
    var categoryId = $(this).val();
    fetchSubCategoryNames(categoryId);
});

$('#register_book').submit(function(event) {
    event.preventDefault();
    var formData = new FormData(this);
    $.ajax({
        type: "POST",
        url: $(this).attr("action"),
        data: formData,
        contentType: false,
        processData: false,
        success: function(data) {
            if (data.success) {
                alert(data.message);
                window.location.href = "Book-Details.jsp";
            } else {
                alert(data.message);
            }
        },
        error: function(xhr, status, error) {
            alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
        }
    });
});

// fetching categories for dynamic dropdown list
function fetchCategoryNames() {
    $.ajax({
        url: contextPath + "/book?method=display_category",
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            if (response.success) {
                $('#categorySelect').empty();
                $.each(response.category, function(index, category) {
                    $('#categorySelect').append($('<option>', {
                        value: category.category_id,
                        text: category.category
                    }));
                });
            } else {
                console.error(response.message);
            }
        },
        error: function(xhr, status, error) {
            console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
        }
    });
}


function fetchSubCategoryNames(categoryId) {
    $.ajax({
        url: contextPath + "/book?method=get_subcategory_fromcategory&category_id=" + categoryId,
        type: 'GET',
        dataType: 'json',
        success: function(response) {
            if (response && response.success) {
                $('#subcategorySelect').empty();
                $.each(response.subcategory, function(index, subcategory) {
                    $('#subcategorySelect').append($('<option>', {
                        value: subcategory.subCategory_id,
                        text: subcategory.sub_category
                    }));
                });
            } else {
                console.error(response ? response.message : "Unknown error occurred.");
            }
        },
        error: function(xhr, status, error) {
                console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
             
        }
    });
}

