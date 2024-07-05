<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<link rel="icon" href="<%=request.getContextPath()%>/resources/images/books/favicon2.webp">
<link rel="stylesheet"
	href="https://cdn.datatables.net/2.0.1/css/dataTables.dataTables.min.css">
<title>Admin</title>

<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link
	href="<%=request.getContextPath()%>/resources/css/sb-admin-2.css"
	rel="stylesheet">
<style>
/* styles.css */
.red-icon {
	color: red;
	margin-right: 20px;
}

.blue-icon {
	margin-right: 20px;
	color: blue;
}

.icon-container {
	/* Adjust the margin as per your preference */
	text-align: center;
}
</style>
</head>

<body id="page-top" class="">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Include the sidebar -->
		<jsp:include page="/partials/Admin-Sidebar.jsp" />

		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">

			<!-- Main Content -->
			<div id="content">

				<!-- Include the header -->
				<jsp:include page="/partials/Admin-Header.jsp" />

				<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<div
						class="d-sm-flex align-items-center justify-content-between mb-4">
						<h1 class="h3 mb-0 text-gray-800">View Orders</h1>
						<!-- 	<a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
					</div>
					<!-- Begin Page Content -->
					<div class="container-fluid">
						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary"></h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table id="orderTable" class="table table-bordered"
										id="dataTable">
										<thead>
											<tr>
												<th>OrderId</th>
												<th>UserName</th>
												<th>UserContact</th>
												<th>BookName</th>
												<th>BookPrice</th>
												<th>BookImage</th>
												<th>BookID</th>
												<th>Quantity</th>
												<th>TotalPrice</th>
												<th>IsTokenUsed</th>
												<th>RemainingToken</th> 
											</tr>
										</thead>
										<tbody>
										</tbody>
									</table>
								</div>
							</div>
						</div>

					</div>
					<!-- /.container-fluid -->

				</div>
				<!-- End of Main Content -->


			</div>
			<!-- End of Content Wrapper -->
			<!-- Include the footer -->
			<jsp:include page="/partials/Admin-Footer.jsp" />

		</div>
		<!-- End of Page Wrapper -->
	</div>

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

	<!-- Include the profile-update Modal-->
	<jsp:include page="/Admin-profile-update.jsp" />
	<!-- Include the Logout -->
	<jsp:include page="/Admin-Logout.jsp" />
	<!-- Include the Update Modal-->
	<jsp:include page="Book-Update.jsp" />


	<!-- Bootstrap core JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery/jquery.min.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="<%=request.getContextPath()%>/resources/vendor/jquery-easing/jquery.easing.min.js"></script>
	<!-- Custom scripts for all pages-->
	<script
		src="<%=request.getContextPath()%>/resources/js/sb-admin-2.min.js"></script>
	<!-- Page level custom scripts -->
	<script src="https://cdn.datatables.net/2.0.1/js/dataTables.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script type="text/javascript">
   var contextPath = "<%=request.getContextPath()%>";
		</script>
			<script
		src="<%=request.getContextPath()%>/resources/pages/AdminJs/admin-order-details.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pages/AdminJs/admin-profile-update.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pages/AdminJs/admin-logout.js"></script>
</body>
</html>
