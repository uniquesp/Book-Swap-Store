<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<%
    HttpSession headerSession = request.getSession(false);
    String adminEmail = (String) headerSession.getAttribute("admin_email");
    if (adminEmail == null || adminEmail.isEmpty()) {
        response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate");
        response.sendRedirect(request.getContextPath() + "/Admin-Login.jsp");
    } else {
%>

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
						<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
						<!-- <a href="#"
							class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
							class="fas fa-download fa-sm text-white-50"></i> Generate Report</a> -->
					</div>
					<!-- Content Row -->
					<div class="row">

						<!-- <div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-primary text-uppercase mb-1">
												Today's Orders and Earnings</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<div class="todays_orders"></div>
												<div class="todays_amounts"></div>

											</div>
										</div>
										<div class="col-auto">
										<i class="fas fa-rupee-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div> -->

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-success shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-success text-uppercase mb-1">
												Total Users</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
											<div class="total_users"></div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-users fa-2x text-gray-300"></i> 
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-info shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-info text-uppercase mb-1">Total
												Books</div>
											<div class="row no-gutters align-items-center">
												<div class="col-auto">
													<div class="h5 mb-0 mr-3 font-weight-bold text-gray-800">
														<div class="total_books"></div>
													</div>
												</div>
												
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-book fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-warning shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-warning text-uppercase mb-1">
												Book Sell Requests</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
											<div class="sell_request"></div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-comments fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>

						<div class="col-xl-3 col-md-6 mb-4">
							<div class="card border-left-secondary shadow h-100 py-2">
								<div class="card-body">
									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="text-xs font-weight-bold text-secondary  text-uppercase mb-1">
												Total Orders and Earnings</div>
											<div class="h5 mb-0 font-weight-bold text-gray-800">
												<div class="total_orders"></div>
												<div class="total_amounts"></div>
											</div>
										</div>
										<div class="col-auto">
											<i class="fas fa-rupee-sign fa-2x text-gray-300"></i>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

				</div>
				<!-- /.container-fluid -->
			</div>
			<!-- End of Main Content -->
		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->
	<!-- Include the footer -->
	<jsp:include page="/partials/Admin-Footer.jsp" />
	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>
	<!-- Include the profile-update Modal-->
	<jsp:include page="/Admin-profile-update.jsp" />
	<!-- Include the Logout -->
	<jsp:include page="/Admin-Logout.jsp" />

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


	<script type="text/javascript">
   var contextPath = "<%=request.getContextPath()%>";
		</script>
	<script
		src="<%=request.getContextPath()%>/resources/pages/BookJs/all-counts.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pages/AdminJs/admin-profile-update.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pages/AdminJs/admin-logout.js"></script>
</body>
</html>


<%
    }
%>
