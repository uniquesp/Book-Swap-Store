$('#login').submit(function(event) {
	event.preventDefault();
	var formData = new FormData(this);

	$.ajax({
		type: "POST",
		url: contextPath + "/admin?method=admin_login",
		data: formData,
		contentType: false,
        processData: false,
		success: function(data) {
			if (data.success) {
				window.location.href = contextPath + "/Admin-Dashboard.jsp";
			} else {
				alert(data.message);
			}
		},
		error: function(xhr, status, error) {
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		}
	});
});
