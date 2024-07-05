$(document).ready(function() {
	displayOrdersAdmin();
});


function displayOrdersAdmin() {
    dataTable = $("#orderTable").DataTable({
        "ajax": {
            "url": contextPath + "/admin?method=admin_orderdetails",
            "type": "POST",
            "dataType": "json",
            "dataSrc": function(response) {
                if (response.success) {
                    return response.orderitems.map(function(item) {
                        return item.map;
                    });
                } else {
                    console.error("Error: ", response.message);
                    return [];
                }
            },
            "error": function(xhr, status, error) {
                // Handle error if any
                console.error("Error: ", error);
            }
        },
        "columns": [
            { "data": "orderid" },
            { "data": "user_name" },
            { "data": "usercontact",  "bSortable": false},
            { "data": "title" },
            { "data": "bookprice","bSortable": false },
            {
				"data": "bookimage", "bSortable": false,
				"render": function(data) {
					return '<img width="80px" height="80px" src="' + contextPath + '/resources/images/books/' + data + '" alt="Book Image">';
				}
			},
            { "data": "book_id" },
            { "data": "quantity" },
            { "data": "total_price" },
            { "data": "is_tokenused" },
            { "data": "token_amount" }
        ],
        "searching": true,
        "serverSide": true,
        "paginate": true,
        "processing": true,
        "responsive": true,
        "bSortable": true
    });
}
