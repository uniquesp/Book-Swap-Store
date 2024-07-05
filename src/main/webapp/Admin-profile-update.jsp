<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Profile Update Modal -->
<div class="modal" id="profileUpdateModal" tabindex="-1" role="dialog"
	aria-labelledby="profileUpdateModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="profileUpdateModalLabel">Update
					Profile</h5>
				<button class="close" type="button" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">×</span>
				</button>
			</div>
			<div class="modal-body">
				<form id="profileUpdateForm" enctype="multipart/form-data">
					<div class="form-group">
						<label for="firstName">First Name</label> <input type="text"
							class="form-control" id="first_name" name="first_name" required>
					</div>
					<div class="form-group">
						<label for="lastName">Last Name</label> <input type="text"
							class="form-control" id="last_name" name="last_name" required>
					</div>
					<div class="form-group">
						<label for="email">Email</label> <input type="email"
							class="form-control" id="admin_email" name="admin_email" required disabled>
					</div>
					<div class="form-group">
						<label for="address">Address</label> <input type="text"
							class="form-control" id="admin_address" name="admin_address" required>
					</div>
					<div class="form-group">
						<label for="phone">Phone Number</label> <input type="number"
							class="form-control" id="admin_mobileno" name="admin_mobileno" required>
					</div>
					<div class="form-group">
						<label for="password">Password</label> <input type="text"
							class="form-control" id="password" name="password" required>
					</div>
					<div class="form-group">
						<label for="confirm-passsword">ConfirmPassword</label> <input
							type="text" class="form-control" id="confirm-passsword"
							name="confirm-passsword" required>
					</div>
					 <input type="hidden" id="adminId" name="adminId" />
					<div class="modal-footer">
						<div class="text-left">
							<button type="button" class="btn btn-secondary"
								data-dismiss="modal">Cancel</button>
							<button type="button" class="btn btn-primary"
								onclick="updateProfile()">Save Changes</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
