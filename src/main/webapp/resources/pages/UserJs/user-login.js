$('#login_form').submit(function(event) {
	event.preventDefault();
	$.post($(this).attr('action'), $(this).serialize(), function(data) {
		data = JSON.parse(data);
		if (data && data.success == true) {
			window.location.href = "User-Dashboard.jsp";
				alert(data.message);
				localStorage.setItem('userId', data.userId);
		} else {
			alert(data.message);
		}

	})
		.fail(function(xhr, status, error) {
			// Correct position for the error callback
			alert("error: " + error + " status: " + status + " er:" + xhr.responseText);
		});

});

