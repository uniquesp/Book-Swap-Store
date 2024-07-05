$(document).ready(function() {
	if (localStorage.getItem('userId') !== null) {
		getAllUserDetails();
	}
});


function getAllUserDetails() {
	$('#userTable').DataTable().destroy();
	$('#userTable').DataTable({
		"ajax": {
			"url": contextPath + "/user?method=display_user",
			"type": "POST",
			"dataType": "json",
			"dataSrc": "users",
		},
		"columns": [

			{ "data": null, "title": "#" },
			{ "data": "username" },
			{ "data": "useremail" },
			{ "data": "usermobileno" },
			{ "data": "gender" },
			{ "data": "address" },
			{
				"data": "userid",
				"render": function(data) {
					return '<div class="icon-container">' +
						'<a href="#" class="settings" title="Edit" data-toggle="tooltip" onclick="getUser(' + data + ')"> <i class="fas fa-fw fa-edit blue-icon"></i></a>' +
						'<a href="#" class="delete" title="Delete" data-toggle="tooltip" onclick="deleteUser(' + data + ')"><i class="fas fa-fw fa-trash red-icon"></i></a>' +
						'</div>';
				}
			}
		],
		"createdRow": function(row, data, dataIndex) {
			$('td:eq(0)', row).html(dataIndex + 1);
		}
	});
}

function getUser(userId) {
	$.ajax({
		url: contextPath + "/user?method=get_user_update",
		type: 'POST',
		dataType: 'json',
		data: { id: userId },
		success: function(response) {
			if (response.success) {
				var userDetails = response.users[0];
				$("#user_name").val(userDetails.username);
				$("#user_email").val(userDetails.useremail);
				$("#user_mobile").val(userDetails.usermobileno);
				$("#user_gender").val(userDetails.gender);
				$("#user_address").val(userDetails.address);
				$("#password").val(userDetails.userpassword);
				$("#confirmpassword").val(userDetails.userpassword);
				$("#Birth_Date").val(userDetails.dob);
				$("#user_token").val(userDetails.tokenAmount);
				$("#userId").val(userDetails.userid);
				$("#manageuser").modal("show");
			} else {
				alert("Failed to fetch user details.");
			}
		},
		error: function(xhr, status, error) {
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		}
	});
}


function deleteUser(userId) {
	$.ajax({
		url: contextPath + "/user?method=delete_user",
		type: 'POST',
		dataType: 'json',
		data: { id: userId },
		success: function(response) {
			if (response.success) {
				alert(response.message);
				getAllUserDetails();
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		}
	});
}

function updateUserProfile() {
	var userData = {
		user_name: $("#user_name").val(),
		user_email: $("#user_email").val(),
		user_mobile: $("#user_mobile").val(),
		user_gender: $("#user_gender").val(),
		user_address: $("#user_address").val(),
		user_token : $("#user_token").val(),
		password: $("#password").val(),
		confirmpassword: $("#confirmpassword").val(),
		userid: $("#userId").val(),
		action: 'update'
	};

	$.ajax({
		url: contextPath + "/user?method=update_user",
		type: 'POST',
		dataType: 'json',
		data: userData,
		success: function(response) {
			if (response.success) {
				$("#manageuser").modal("hide");
				getAllUserDetails();
			} else {
				alert("Failed to update user.");
			}
		},
		error: function(xhr, status, error) {
			alert("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}

	});
}

function deactivateAccount(userId) {
	if (confirm("Are you sure you want to deactivate your Account? You won't able to access it again") == true) {
		$.ajax({
			url: contextPath + "/user?method=delete_user",
			type: 'POST',
			dataType: 'json',
			data: { id: userId },
			success: function(response) {
				if (response.success) {
					alert("Logout once Your Account Deactivated Permanantly!");
				} else {
					alert("Failed to Deactivated Account.");
				}
			},
			error: function(xhr, status, error) {
				alert("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
			}

		});
	} else {
		alert("You canceled!")
	}
}

