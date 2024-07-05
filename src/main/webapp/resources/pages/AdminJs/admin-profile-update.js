function getAdminDetails(){
	$.ajax({
		url: contextPath + "/admin?method=get_admin",
		type: 'POST',
		dataType: 'json',
		success: function(response) {
			
			if (response.success) {
				var adminDetails = response.admin[0];
				$("#first_name").val(adminDetails.first_name);
				$("#last_name").val(adminDetails.last_name);
				$("#admin_email").val(adminDetails.email);
				$("#admin_address").val(adminDetails.address);
				$("#admin_mobileno").val(adminDetails.contactNo);
				$("#password").val(adminDetails.password);
				$("#confirm-passsword").val(adminDetails.password);
				$("#adminId").val(adminDetails.id)
				$("#profileUpdateModal").modal("show");
			} else {
				alert("Failed to fetch admin details.");
			}
		},
		error: function(xhr, status, error) {
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		}
	});
}


function updateProfile(){
	var formData = new FormData();
	formData.append("action", "update_admin");
	formData.append("first_name", $("#first_name").val());
	formData.append("last_name", $("#last_name").val());
	formData.append("admin_email", $("#admin_email").val());
	formData.append("admin_address", $("#admin_address").val());
	formData.append("admin_mobileno", $("#admin_mobileno").val());
	formData.append("password", $("#password").val());
	formData.append("confirm-passsword", $("#confirm-passsword").val());
	formData.append("adminId", $("#adminId").val());
	
	$.ajax({
		url: contextPath + "/admin?method=admin_update",
		type: 'POST',
		data: formData,
		contentType: false, // Set to false for FormData
		processData: false, // Set to false for FormData
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				$("#updateUserModal").modal("hide");
				alert(response.message);
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			alert("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}




