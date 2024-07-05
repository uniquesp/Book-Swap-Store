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
<title>AdminRegister</title>

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

<body class="bg-gradient-secondary">

	<div class="container">

		<div class="card o-hidden border-0 shadow-lg my-5">
			<div class="card-body p-0">
				<!-- Nested Row within Card Body -->
				<div class="row">
					<div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
					<div class="col-lg-7">
						<div class="p-5">
							<div class="text-center">
								<h1 class="h4 text-gray-900 mb-4">Create an Account!</h1>
							</div>
							<form id="registration" class="user"
								action="<%=request.getContextPath()%>/admin" method="Post" enctype="multipart/form-data">
 								<input type="hidden" name="method" value="admin_registration" />

								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="text" class="form-control form-control-user"
											id="exampleFirstName" placeholder="First Name"
											name="first_name">
									</div>
									<div class="col-sm-6">
										<input type="text" class="form-control form-control-user"
											id="exampleLastName" placeholder="Last Name" name="last_name">
									</div>
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="email" class="form-control form-control-user"
											id="exampleInputEmail" placeholder="Email" name="admin_email">
									</div>
									<div class="col-sm-6">
										<input type="number" class="form-control form-control-user"
											id="exampleInputMobileNo" placeholder="MobileNo"
											name="admin_mobileno">
									</div>
								</div>
								<div class="form-group">
									<input type="text" class="form-control form-control-user"
										id="exampleInputAddress" placeholder="Address"
										name="admin_address">
								</div>
								<div class="form-group row">
									<div class="col-sm-6 mb-3 mb-sm-0">
										<input type="password" class="form-control form-control-user"
											id="exampleInputPassword" placeholder="Password"
											name="password">
									</div>
									<div class="col-sm-6">
										<input type="password" class="form-control form-control-user"
											id="exampleRepeatPassword" placeholder="Repeat Password"
											name="confirm_password">
									</div>
								</div>
								<input type="hidden" name="action" value="register_admin" />
								<button class="btn btn-primary btn-user btn-block" id="register" value="submit">Register
									Account</button>
								<hr>
								<!-- <button class="btn btn-google btn-user btn-block">
									<i class="fab fa-google fa-fw"></i> Register with Google
								</button> -->
							</form>
							<hr>

							<div class="text-center">
								<a class="small"
									href="<%=request.getContextPath()%>/Admin-Login.jsp">Already
									have an account? Login!</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>

	</div>

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
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/pages/AdminJs/admin-registration.js"></script>

</body>
</html>