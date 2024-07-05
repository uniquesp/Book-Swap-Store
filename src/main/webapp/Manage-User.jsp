
<!-- Modal -->
<div class="modal fade" id="manageuser" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-md" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Update User</h5>
			<!-- 	<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button> -->
			</div>
			<%-- <form id="update_user_form" name="update_user_details"
				action="<%=request.getContextPath()%>/user" method="Post">
				<input type="hidden" name="method" value="update_user" /> --%>
				<div class="modal-body">
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="user_name">User Name:</label> <input type="text"
								name="user_name" id="user_name" class="form-control" autofocus
								required>
						</div>
						<div class="form-group col-md-6">
							<label for="user_mobile">Mobile No:</label> <input
								type="text" name="user_mobile" id="user_mobile"
								pattern="[789][0-9]{9}" class="form-control" required>
						</div>
						
					</div>
					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="author">User Email:</label> <input type="email"
								name="user_email" id="user_email" class="form-control" required
								readonly>
						</div>
						<div class="form-group col-md-6">
							<label for="Birth_Date">BirthDate:</label> <input type="text"
								name="Birth_Date" id="Birth_Date" class="form-control" required
								readonly>
						</div>
					</div>

					<div class="form-row">
						<div class="form-group col-md-6">
							<label for="publication_year">Gender:</label> <select
								class="form-control" name="user_gender" id="user_gender"
								required>
								<option value="male">Male</option>
								<option value="female">Female</option>
								<option value="other">Other</option>
								<option value="no">Not to Specify</option>
							</select>
						</div>
						<div class="form-group col-md-6">
							<label for="user_address">Address:</label> <input type="text"
								name="user_address" id="user_address" class="form-control"
								required>
						</div>
					</div>

				<div class="form-row">
					<div class="form-group col-md-6">
						<label for="tokenamount">Token</label> <input type="text"
							name="user_token" id="user_token" class="form-control"
							required readonly>
					</div>
				</div>
				
				<div class="form-row">
						<div class="form-group col-md-6">
							<label for="password">Password:</label><input type="password"
								name="password" id="password" class="form-control" required>
						</div>
						<div class="form-group col-md-6">
							<label for="confirmpassword">Confirm Password:</label> <input
								type="password" name="password" id="confirmpassword"
								class="form-control" required>
						</div>
					</div>
					<input type="hidden" id="userId" name="userId" />
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal" onclick="closemodal()">Close</button>
					<button id="manageuser" class="btn btn-primary" onclick="updateUserProfile()">Update</button>
				</div>
		<!-- 	</form> -->
		</div>
	</div>
</div>

<script type="text/javascript">
	function closemodal(){
		$("#manageuser").modal("hide");
	}
</script>
