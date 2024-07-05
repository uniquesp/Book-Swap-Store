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
<title>AdminLogin</title>

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

		<!-- Outer Row -->
		<div class="row justify-content-center">

			<div class="col-xl-10 col-lg-12 col-md-9">

				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<!-- Nested Row within Card Body -->
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<div class="text-center">
										<h1 class="h4 text-gray-900 mb-4">Welcome Back!</h1>
									</div>
									<form id="login" class="user"
										action="<%=request.getContextPath()%>/admin" method="Post"
										enctype="multipart/form-data">
										<input type="hidden" name="method" value="admin_login">
										<div class="form-group">
											<input type="email" class="form-control form-control-user"
												id="exampleInputEmail" aria-describedby="emailHelp"
												name="email" placeholder="Enter Email Address...">
										</div>
										<div class="form-group">
											<input type="password" class="form-control form-control-user"
												id="exampleInputPassword" placeholder="Password"
												name="password">
										</div>
										<div class="form-group">
											<div class="custom-control custom-checkbox small">
												<input type="checkbox" class="custom-control-input"
													id="customCheck"> <label
													class="custom-control-label" for="customCheck">Remember
													Me</label>
											</div>
										</div>
										<button class="btn btn-primary btn-user btn-block" id="login"
											value="submit">Login</button>
										<hr>
										<%-- <button class="btn btn-google btn-user btn-block">
											<i class ="fab fa-googlefa-fw">
											</i>Login with Google
										</button>
									</form>
									<hr>
									<div class="text-center">
										<a class="small"
											href="<%=request.getContextPath()%>/Admin-ForgetPassword.jsp">Forgot
											Password?</a>
									</div> --%>
									</form>
									<div class="text-center">
										<a class="small"
											href="<%=request.getContextPath()%>/Admin-Register.jsp">Create
											an Account!</a>
									</div>
								</div>
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
		src="<%=request.getContextPath() %>/resources/js/sb-admin-2.min.js"></script>
		<script type="text/javascript"> 
	var contextPath = "<%=request.getContextPath()%>";
	</script>	
	<script type="text/javascript" src="<%=request.getContextPath()%>/resources/pages/AdminJs/admin-login.js"></script>

</body>

</html>