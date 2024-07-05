$(document).ready(function() {
    fetchSubCategoryNames(1);
   
});

function fetchSubCategoryNames(categoryId) {
    $.ajax({
        url: contextPath + "/book",
        type: 'GET',
        dataType: 'json',
        data: { method: 'get_subcategory_fromcategory',category_id: categoryId},
        success: function(response) {
            if (response && response.success) {
                $('#subcategorySelect').empty();
                $.each(response.subcategory, function(subcategory) {
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
            if (xhr.responseText) {
                console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
            } else {
                console.error("Error: " + error + " Status: " + status + " Response is empty.");
            }
        }
    });
}
