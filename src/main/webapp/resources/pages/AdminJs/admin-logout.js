$("#logoutButton").click(function() {
	$.ajax({
		type: "post",
		url: contextPath + "/admin?method=admin_logout",
		success: function(data) {
			if (data.success) {
				window.location.href = contextPath + "/Admin-Login.jsp";
					 window.location.reload();
			} else {
				alert(data.message);
			}
		},
		error: function(status, error) {
			alert("Error during logout: " + error + ", Status: " + status);
		}
	});
});
