
<!-- Modal -->
<div class="modal fade" id="UpdateBook" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Update Book</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<%-- <form id="register_book"
						action="<%=request.getContextPath() %>/book" method="post"
						enctype="multipart/form-data">
						<input type="hidden" name="method" value="update_book" /> --%>

				<div class="form-group">
					<label for="title">Book Title:</label> <input type="text"
						class="form-control" id="title" name="title" required>
				</div>
				
				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="author">Author:</label> <input type="text"
							class="form-control" id="author" name="author" required>
					</div>
					<div class="form-group col-md-6">
						<label for="publication_year">Publication Year:</label> <input
							type="number" class="form-control" id="publication_year"
							name="publication_year" required>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="publication_year">Category</label> <select
							class="form-control" id="categorySelect" name="category" required></select>
					</div>
					<div class="form-group col-md-6">
						<label for="category">Sub-Category:</label> <select
							class="form-control" id="subcategorySelect" name="subcategory"
							required></select>
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="price">Price:</label> <input type="number"
							class="form-control" id="price" name="price" required />
					</div>
					<div class="form-group col-md-6">
						<label for="publisher">Publisher:</label> <input type="text"
							class="form-control" id="publisher" name="publisher" required>
					</div>
				</div>

				<div class="form-group">
					<label for="description">Description:</label>
					<textarea class="form-control" id="description" name="description"
						rows="4" cols="50"></textarea>
				</div>

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="status">Status:</label><br> <input type="radio"
							id="statusAvailable" name="status" value="In stock">
						Active <input type="radio" id="statusNotAvailable" name="status"
							value="out of stock"> Inactive
					</div>
					<div class="form-group col-md-6">
						<label for="language">Language:</label><br> <input
							type="checkbox" id="MarathiCheckbox" name="language"
							value="Marathi">Marathi <input type="checkbox"
							id="HindiCheckbox" name="language" value="Hindi"> Hindi <input
							type="checkbox" id="EnglishCheckbox" name="language"
							value="English"> English <input type="checkbox"
							id="otherCheckbox" name="language" value="other"> Other
						<!-- Other language input box -->
						<input type="text" id="otherLanguageInput" name="otherLanguage"
							placeholder="Specify Other Language" style="display: none;">
					</div>
				</div>

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="profile_pic">Profile Picture</label> <input
							type="file" class="form-control-file" id="profile_pic"
							name="profile_pic" onchange="displayImage(this)">
					</div>
					<div class="form-group col-md-6">
						<label>Preview:</label> <img id="imagePreview" src="#"
							alt="Image Preview" style="max-width: 50%; height: auto;">
					</div>
				</div>
				<input type="hidden" id="bookId" name="bookId" value="book_update" />

			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button type="button" id="update_book_modal" class="btn btn-primary"
					onclick="updateBook()">Update</button>
			</div>
		</div>
	</div>
</div>

