$(document).ready(function() {
	allcounts();
});


function allcounts() {
	$.ajax({
		url: contextPath + "/book?method=display_counts",
		type: 'POST',
		dataType: 'json',
		success: function(response) {
			if (response.success) {
				var items = response.counts;
				$(".todays_orders").html("Today's Orders: <span style='color: #0d6efd; font-weight: bold;'>" + items.todays_orders + "</span>");
				$(".todays_amounts").html("Today's Earnings: <span style='color: #0d6efd; font-weight: bold;'>"+ items.todays_amount +"</span>");
				$(".total_users").html("Total Users: <span style='color: #198754; font-weight: bold;'>" + items.user_count + "</span>");
				$(".total_books").html("Total Books: <span style='color: #0dcaf0; font-weight: bold;'>"+ items.book_count + "</span>");
				$(".sell_request").html("Total Sell Request: <span style='color: #ffc107; font-weight: bold;'>"+ items.book_request_count + "</span>");
				$(".total_orders").html("Total Orders: <span style='color: #6c757d; font-weight: bold;'>"+ items.total_orders + "</span>");
				$(".total_amounts").html("Total Earnings: <span style='color: #6c757d; font-weight: bold;'>"+ items.total_amount + "</span>");
			} else {
				alert(response.message);
			}
		},
		error: function(xhr, status, error) {
			console.error("Error: " + error + " Status: " + status + " Response: " + xhr.responseText);
		}
	});
}