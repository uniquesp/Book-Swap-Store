
<!-- Modal -->
<div class="modal fade" id="subcategory-add" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Add Sub-Category</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="form-group">
					<label for="categorySelect">Category Name</label> <select
						class="form-control" id="categorySelect" name="category_id"
						required>
						<!-- Dynamic options will be added here -->
					</select>
				</div>
				<div class="form-group">
					<label for="subcategory_name">SubCategory Name</label> <input
						type="text" class="form-control" id="subcategory_name"
						name="subcategory_name" required>
				</div>
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="button" id="add_subcategory" class="btn btn-primary"
					onclick="addSubCategory()">Submit</button>
			</div>
		</div>
	</div>
</div>
