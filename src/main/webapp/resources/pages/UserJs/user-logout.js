
function userLogout() {
	$.ajax({
		type: "post",
		url: contextPath + "/user?method=logout_user",
		success: function(data) {
			if (data.success) {
				/*window.location.href = contextPath + "/User-Login.jsp";*/
				 window.location.reload();
				 removeCartInfo();
				 localStorage.removeItem('userId');
			} else {
				alert(data.message);
			}
		},
		error: function(status, error) {
			alert("Error during logout: " + error + ", Status: " + status);
		}
	});
}

function removeCartInfo() {
    localStorage.removeItem("cartInfo");
}	