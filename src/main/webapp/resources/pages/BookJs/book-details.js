$(document).ready(function() {
	getAllCategories();
	getAllBookDetails();
	getAllSubcategories();
	fetchCategoryNames();
});
//----------------------------------------------------------------------Category functions-----------------------------------------------------------------------------------------------------
// storing categories into database
function addBookCategory() {
	var formData = new FormData();
	formData.append("action", "category_register");
	formData.append('category_name', $('#category_name').val());
	$.ajax({
		url: contextPath + "/book?method=add_category",
		type: 'POST',
		data: formData,
		contentType: false,
		processData: false,
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				$("#category-add").modal("hide");
				alert(response.message);
				getAllCategories();
				$('#category_name').val("")
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}

// for displaying all categories
function getAllCategories() {
	$('#categoryTable').DataTable().destroy();
	$('#categoryTable').DataTable({
		"ajax": {
			"url": contextPath + "/book?method=display_category",
			"type": "POST",
			"dataType": "json",
			"dataSrc": "category",
		},
		"columns": [

			{ "data": null, "title": "#" },
			{ "data": "category_id" },
			{ "data": "category" },
			{
				"data": "category_id",
				"render": function(data) {
					return '<div class="icon-container">' +
						'<a href="#" class="settings" title="Edit" data-toggle="tooltip" onclick="getCategory(' + data + ')"> <i class="fas fa-fw fa-edit blue-icon"></i></a>' +
						//		'<a href="#" class="delete" title="Delete" data-toggle="tooltip" onclick="deleteCategory(' + data + ')"><i class="fas fa-fw fa-trash red-icon"></i></a>' +
						'</div>';
				}
			}
		],
		"createdRow": function(row, data, dataIndex) {
			// Set custom counter in the first column
			$('td:eq(0)', row).html(dataIndex + 1);
		}
	});
}

// fetching categories for dynamic dropdown list
function fetchCategoryNames() {
	$.ajax({
		url: contextPath + "/book?method=display_category",
		type: 'GET',
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				// Clear existing options
				$(' #subcategory-add #categorySelect, #subcategory-update #categorySelect, #UpdateBook #categorySelect').empty();

				// Populate dropdown with fetched categories
				$.each(response.category, function(index, category) {
					$('#subcategory-add #categorySelect, #subcategory-update #categorySelect, #UpdateBook #categorySelect').append($('<option>', {
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

//getcetegories by id
function getCategory(categoryId) {
	$.ajax({
		url: contextPath + "/book?method=get_category",
		type: 'POST',
		dataType: 'json',
		data: { id: categoryId },
		success: function(response) {
			if (response.success) {
				$("#categoryId").val(categoryId);
				var categoryDetails = response.category[0];
				// Populate the modal fields with the retrieved data
				$("#category_name_update").val(categoryDetails.category);
				$("#category-update").modal("show");
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		}
	});
}

//Update category
function updateBookCategory() {
	var formData = new FormData();
	formData.append("action", "category_update");
	formData.append("category_id", $("#categoryId").val());
	formData.append("category", $("#category_name_update").val());
	$.ajax({
		url: contextPath + "/book?method=update_category",
		type: 'POST',
		data: formData,
		contentType: false,
		processData: false,
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				$("#category-update").modal("hide");
				alert(response.message);
				getAllCategories();
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			alert("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}
//-----------------------------------------------------------------SubCategories---------------------------------------------------------------------------------------------------

// add subcategories in database
function addSubCategory() {
	var formData = new FormData();
	formData.append("action", "subcategory_register");
	formData.append('category_id', $('#categorySelect').val());
	formData.append('subcategory_name', $('#subcategory_name').val());
	$.ajax({
		url: contextPath + "/book?method=add_subcategory",
		type: 'POST',
		data: formData,
		contentType: false,
		processData: false,
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				$("#subcategory-add").modal("hide");
				getAllSubcategories();
				alert(response.message);
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}


// for displaying all subcategories
function getAllSubcategories() {
	$('#subcategory-table').DataTable().destroy();
	$('#subcategory-table').DataTable({
		"ajax": {
			"url": contextPath + "/book?method=display_subcategory",
			"type": "POST",
			"dataType": "json",
			"dataSrc": "subcategory",
		},
		"columns": [
			{ "data": null, "title": "#" },
			{ "data": "subCategory_id" },
			{ "data": "sub_category" },
			{ "data": "category" },
			{
				"data": "subCategory_id",
				"render": function(data) {
					return '<div class="icon-container">' +
						'<a href="#" class="settings" title="Edit" data-toggle="tooltip" onclick="getSubCategory(' + data + ')"> <i class="fas fa-fw fa-edit blue-icon"></i></a>' +
						//    '<a href="#" class="delete" title="Delete" data-toggle="tooltip" onclick="deleteCategory(' + data + ')"><i class="fas fa-fw fa-trash red-icon"></i></a>' +
						'</div>';
				}
			}
		],
		"createdRow": function(row, data, dataIndex) {
			$('td:eq(0)', row).html(dataIndex + 1);
		}
	});
}

//getsubcetegories by id
function getSubCategory(subcategoryId) {
	$.ajax({
		url: contextPath + "/book?method=get_subcategory",
		type: 'POST',
		dataType: 'json',
		data: { id: subcategoryId },
		success: function(response) {
			if (response.success) {
				$("#subcategoryId").val(subcategoryId);
				var subcategoryDetails = response.subcategory[0];
				$("#subcategory-update #categorySelect").val(subcategoryDetails.category_id);
				$("#subcategory_name_update").val(subcategoryDetails.sub_category);
				$("#subcategory-update").modal("show");
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		}
	});
}

//Update category
function updateSubCategory() {
	var formData = {
		action: 'subcategory_update',
		subCategory_id: $("#subcategoryId").val(),
		category_id: $("#subcategory-update #categorySelect").val(),
		sub_category: $("#subcategory_name_update").val()
	};

	$.ajax({
		url: contextPath + "/book?method=update_subcategory",
		type: 'POST',
		dataType: 'json',
		data: formData,
		success: function(response) {
			if (response.success) {
				$("#subcategory-update").modal("hide");
				alert(response.message);
				getAllSubcategories();
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			alert("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}

//-------------------------------------------------------------------------books--------------------------------------------------------------------------------------------------

// Displaying all books details in data table
function getAllBookDetails() {
	$('#bookTable').DataTable().destroy();
	//if (!$.fn.dataTable.isDataTable('#bookTable')) {
	$('#bookTable').DataTable({
		"ajax": {
			"url": contextPath + "/book?method=display_book",
			"type": "POST",
			"dataType": "json",
			"dataSrc": "books",
		},
		"columns": [

			{ "data": null, "title": "#" }, // Custom counter column
			{ "data": "id" },
			{ "data": "title" },
			{ "data": "author" },
			{ "data": "price" },
			{ "data": "language" },
			{ "data": "publisher" },
			{ "data": "category" },
			{ "data": "sub_category" },
			{ "data": "bookStatus" },
			{
				"data": "image",
				"render": function(data) {
					return '<img width="80px" height="80px" src="' + contextPath + '/resources/images/books/' + data + '" alt="Book Image">';
				}
			},
			{
				"data": "id",
				"render": function(data) {
					return '<div class="icon-container">' +
						'<a href="#" class="settings" title="Edit" data-toggle="tooltip" onclick="getBook(' + data + ')"> <i class="fas fa-fw fa-edit blue-icon"></i></a>' +
						'<a href="#" class="delete" title="Delete" data-toggle="tooltip" onclick="deleteBook(' + data + ')"><i class="fas fa-fw fa-trash red-icon"></i></a>' +
						'</div>';
				}
			}
		],
		"createdRow": function(row, data, dataIndex) {
			// Set custom counter in the first column
			$('td:eq(0)', row).html(dataIndex + 1);
		}
	});
}
//}

// deleting book from database
function deleteBook(bookId) {
	$.ajax({
		url: contextPath + "/book?method=delete_book",
		type: 'POST',
		dataType: 'json',
		data: { id: bookId },
		success: function(response) {
			if (response.success) {
				alert("Book deleted Successfully")
				getAllBookDetails();
			} else {
				alert("Failed to delete book.");
			}
		},
		error: function(xhr, status, error) {
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		}
	});
}
// getiing one book by it's id for update and delete
function getBook(bookId) {
	$.ajax({
		url: contextPath + "/book?method=get_book",
		type: 'POST',
		dataType: 'json',
		data: { id: bookId },
		success: function(response) {
			if (response.success) {
				// Assuming response.data contains book details
				$("#bookId").val(bookId);
				var bookDetails = response.books[0];
				// Populate the modal fields with the retrieved data
				$("#title").val(bookDetails.title);
				$("#author").val(bookDetails.author);
				$("#publication_year").val(bookDetails.publicationYear);
				$("#categorySelect").val(bookDetails.category_id);
				$("#subcategorySelect").val(bookDetails.subCategory_id);
				$("#price").val(bookDetails.price);
				$("#publisher").val(bookDetails.publisher);
				$("#description").val(bookDetails.description);
				//$('input:radio[name=status][value=' + bookDetails.bookStatus + ']').prop('checked', true);
				$('input:radio[name=status]').filter('[value="' + bookDetails.bookStatus + '"]').prop('checked', true);
				// Handle languages checkbox and otherLanguageInput
				var languages = bookDetails.language.split(",");
				languages.forEach(function(language) {
					$("#" + language + "Checkbox").prop("checked", true);
				});
				if (languages.includes("other")) {
					$("#otherLanguageInput").val(languages[languages.length - 1]);
					$("#otherLanguageInput").show();
				} else {
					$("#otherLanguageInput").hide();
				}
				// Show preview of existing image
				if (bookDetails.image) {

					$("#imagePreview").attr("src", contextPath + "/resources/images/books/" + bookDetails.image);

					//$("#profile_pic").val(bookDetails.image);
				} else {
					$("#profile_pic").on("change", function() {
						displayImage(this);
					});
				}

				$("#UpdateBook").modal("show");
			} else {
				alert("Failed to fetch book details.");
			}
		},
		error: function(xhr, status, error) {
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		}
	});
}

// showing preview of image
function displayImage(input) {
	var file = input.files[0];
	if (file) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$("#imagePreview").attr("src", e.target.result);
		};
		reader.readAsDataURL(file);
	}
}

// updating book details 
function updateBook() {
	var formData = new FormData(); // Create a FormData object to handle file uploads
	formData.append("action", "book_update");
	formData.append("id", $("#bookId").val());
	formData.append("title", $("#title").val());
	formData.append("author", $("#author").val());
	formData.append("publication_year", $("#publication_year").val());
	formData.append("category", $("#categorySelect").val());
	formData.append("subcategory", $("#subcategorySelect").val());
	formData.append("price", $("#price").val());
	formData.append("publisher", $("#publisher").val());
	formData.append("description", $("#description").val());
	formData.append("status", $('input[name="status"]').filter(':checked').val());
	formData.append("language", getSelectedLanguages());

	var imageFile = $("#profile_pic")[0].files[0];
	if (imageFile) {
		formData.append("image", imageFile);
	}
	// Make the update request
	$.ajax({
		url: contextPath + "/book?method=update_book",
		type: 'POST',
		data: formData,
		contentType: false, // Set to false for FormData
		processData: false, // Set to false for FormData
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				// Handle success, e.g., close the modal, show a success message, etc.
				$("#UpdateBook").modal("hide");
				alert("Book updated successfully!");
				getAllBookDetails();
			} else {
				// Handle failure, show an error message or take appropriate action
				alert("Failed to update book.");
			}
		},
		error: function(xhr, status, error) {
			alert("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}
// displaying the languages in database before update
function getSelectedLanguages() {
	var selectedLanguages = [];
	$("input[name='language']:checked").each(function() {
		selectedLanguages.push($(this).val());
	});
	if (selectedLanguages.includes("other")) {
		var otherLanguageInput = $("#otherLanguageInput").val();
		if (otherLanguageInput) {
			selectedLanguages.push(otherLanguageInput);
		}
	}
	return selectedLanguages.join(",");
}

//------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
