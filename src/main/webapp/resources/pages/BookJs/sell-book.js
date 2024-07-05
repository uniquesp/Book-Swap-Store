$('#booksell_form').submit(function(event) {
	event.preventDefault();
	var formData = new FormData(this);

	$.ajax({
		type: "POST",
		url: $(this).attr("action"),
		data: formData,
		contentType: false,
		processData: false,
		success: function(data) {
			if (data.success) {
				alert(data.message);
				window.location.href = "User-Sell-Request.jsp";
			} else {
				alert(data.message);
			}
		},
		error: function(xhr, status, error) {
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		}
	});
});