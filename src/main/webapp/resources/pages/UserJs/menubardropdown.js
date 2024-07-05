function showSubcategories(categoryId) {
	$.ajax({
		url: contextPath + "/book?method=get_subcategory_fromcategory",
		type: 'GET',
		data: { category_id: categoryId },
		success: function(response) {

			var jsonResponse = JSON.parse(response);

			// Check if the response indicates success
			if (jsonResponse.success) {
				var subcategories = jsonResponse.subcategory; // Access the subcategory array

				// Construct HTML for subcategory dropdown menu
				var dropdownHtml = '<div class="dropdown-menu show">';
				subcategories.forEach(function(subcategory) {
					dropdownHtml += '<button class="dropdown-item">' + subcategory.sub_category + '</button>';
				});
				dropdownHtml += '</div>';

				// Display the dropdown menu
				var dropdownContainer = document.getElementById('academicsDropdown');
				dropdownContainer.innerHTML = dropdownHtml;
				dropdownContainer.style.display = 'block';
			} else {
				console.error('Error: Subcategories could not be fetched.');
			}
		},
	});
}