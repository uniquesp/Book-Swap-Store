
<!-- Modal -->
<div class="modal fade" id="subcategory-update" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Update Sub-Category</h5>
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
					</select>
				</div>
				<div class="form-group">
					<label for="subcategory_name">SubCategory Name</label> <input
						type="text" class="form-control" id="subcategory_name_update"
						name="subcategory_name" required>
				</div>
					<input type="hidden" id="subcategoryId" name="subcategoryId" value="subcategory_update" />
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
				<button type="button" id="update_subcategory" class="btn btn-primary"
					onclick="updateSubCategory()">Update</button>
			</div>
		</div>
	</div>
</div>
