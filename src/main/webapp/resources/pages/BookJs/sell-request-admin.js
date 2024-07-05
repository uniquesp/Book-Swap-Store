$(document).ready(function() {
	displaySellRequestAdmin();
});

function displaySellRequestAdmin(){
	$('#requestTable').DataTable().destroy();
	//if (!$.fn.dataTable.isDataTable('#requestTable')) {
	$('#requestTable').DataTable({
		"ajax": {
			"url": contextPath + "/book?method=sell_request_admin",
			"type": "POST",
			"dataType": "json",
			"dataSrc": "sellRequests",
		},
		"columns": [

			{ "data": null, "title": "#" }, // Custom counter column
			{ "data": "user_name" },
			{ "data": "user_email" },
			{ "data": "book_name" },
			{ "data": "book_author" },
			{ "data": "publication_Year" },
			{ "data": "book_language" },
			{ "data": "orignal_price" },
			{ "data": "selling_price" },
			{ "data": "requestfor" },
			{
				"data": "book_image",
				"render": function(data) {
					return '<img width="80px" height="80px" src="' + contextPath + '/resources/images/books/' + data + '" alt="Book Image">';
				}
			},
			{
                "data": "status",
                "render": function(data, type, row) {
                    if (data === "Accepted") {
                        return '<span class="badge badge-success">Accepted</span>';
                    } else if (data === "Rejected") {
                        return '<span class="badge badge-danger">Rejected</span>';
                    } else {
                        return '<span class="badge badge-warning">Pending</span>';
                    }
                }
            },
			{
				"data": "sellrequestid",
				"render": function(data) {
					return '<div class="icon-container" style="display:flex;">' +
						'<a href="#" class="accept"  onclick="processRequest(' + data + ', '+true+')"> <button type="button" class="btn btn-outline-success btn-sm">Accept</button></a>&nbsp; &nbsp;' +
						'<a href="#" class="reject"  onclick="processRequest(' + data + ','+ false+')"><button type="button" class="btn btn-outline-danger btn-sm">Reject</button></a>' +
						'</div>';
			}
			}
		],
		"createdRow": function(row, data, dataIndex) {
			// Set custom counter in the first column
			$('td:eq(0)', row).html(dataIndex + 1);
		}
	});
}

function processRequest(sellid,flag){
	$.ajax({
		url:contextPath + "/book?method=update_sellrequest",
		type:'POST',
		dataType:'json',
		data:{ requestid: sellid ,
			   requetflag:flag
			},
		success: function(response){
			if(response.success){	
				  if (flag) {
                    var badgeHtml = '<span class="badge badge-success">Accepted</span>';
                } else {
                    var badgeHtml = '<span class="badge badge-danger">Rejected</span>';
                }
                $('#requestTable').DataTable().rows().every(function () {
                    var rowData = this.data();
                    if (rowData.sellrequestid === sellid) {
                        this.data($.extend({}, rowData, {
                            status: (flag ? 'Accepted' : 'Rejected')
                        })).draw(false); // Draw only this row
                        return false; // Exit the loop
                    }
                });
            } else {
                alert(response.message);
            }
		}
	});
}


