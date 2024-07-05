<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!-- Add this modal section at the end of your HTML body -->
<div id="updateUserModal" class="modal">
	<div class="modal-content">
		<span class="close" onclick="closeModal()">&times;</span>
		<h2>Update User Information</h2>

		<!-- Add a form for updating user information here -->
		<form id="update_user_form"
			action="<%=request.getContextPath()%>/user" method="Post">
			<input type="hidden" name="method" value="update_user" />

			<!-- Update Name -->
			<div class="form-wrapper">
				<input type="text" name="user_name" id="updated_user_name"
					placeholder="Updated Name" class="form-control" autofocus required>
				<i class="zmdi zmdi-account"></i>
			</div>

			<!-- Update Email Address -->
			<div class="form-wrapper">
				<input type="email" name="user_email" id="updated_user_email"
					placeholder="Updated Email Address" class="form-control" required>
				<i class="zmdi zmdi-email"></i>
			</div>

			<!-- Update Mobile No and Birth Date -->
			<div class="form-group">
				<input type="text" name="user_mobile" id="updated_user_mobile"
					placeholder="Updated Mobile No" pattern="[789][0-9]{9}"
					class="form-control" required> <input type="date"
					name="Birth_Date" id="updated_Birth_Date"
					placeholder="Updated Birth Date" class="form-control" required>
			</div>

			<!-- Update Gender -->
			<div class="form-wrapper">
				<select class="form-control" name="user_gender"
					id="updated_user_gender" required>
					<option value="" disabled selected>Updated Gender</option>
					<option value="male">Male</option>
					<option value="female">Female</option>
					<option value="other">Other</option>
					<option value="no">Not to Specify</option>
				</select> <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
			</div>

			<!-- Update Address -->
			<div class="form-wrapper">
				<input type="text" name="user_address" id="updated_user_address"
					placeholder="Updated Address" class="form-control" required>
				<i class="zmdi zmdi-pin"></i>
			</div>

			<!-- Update Password -->
			<div class="form-wrapper">
				<input type="password" name="password" id="updated_password"
					placeholder="Updated Password" class="form-control" required>
				<i class="zmdi zmdi-eye"></i>
			</div>

			<!-- Update Confirm Password -->
			<div class="form-wrapper">
				<input type="password" name="confirm_password"
					id="updated_confirm_password"
					placeholder="Updated Confirm Password" class="form-control"
					required> <i class="zmdi zmdi-eye"></i>
			</div>
			<input type="hidden" id="userId" name="userId" />
			<div class="modal-footer">
				<div class="text-left">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">Cancel</button>
					<button type="button" class="btn btn-primary"
						onclick="updateUserProfile()">Save Changes</button>
				</div>
			</div>
		</form>
	</div>
</div>
