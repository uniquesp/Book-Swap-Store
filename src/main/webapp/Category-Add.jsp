
	<!-- Modal -->
	<div class="modal fade" id="category-add" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-lg" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
						<div class="form-group">
							<label for="title">Category Name</label> <input type="text"
								class="form-control" id="category_name" name="category_name" required>
						</div>
					<!-- 	<input type="hidden" name="action" value="book_update" /> -->
					<!-- </form> -->
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="button" id="add_category" class="btn btn-primary" onclick="addBookCategory()">Submit</button>
				</div>
			</div>
		</div>
	</div>

