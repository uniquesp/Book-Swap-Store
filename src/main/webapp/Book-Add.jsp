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
<title>Admin</title>

<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<!-- Bootstrap core CSS -->
<%-- <link
	href="<%=request.getContextPath()%>/resources/vendor/bootstrap/css/bootstrap.min.js"
	rel="stylesheet"> --%>

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

					<!-- Card Container -->
					<div class="card mb-4 mx-auto" style="width: 50%;">
						<div class="card-header">
							<h6 class="m-0 font-weight-bold text-primary">Book
								Registration</h6>
						</div>
						<div class="card-body">
							<form id="register_book"
								action="<%=request.getContextPath()%>/book" method="post"
								enctype="multipart/form-data">
								<input type="hidden" name="method" value="add_book">

								<!-- Form Group for Book Title -->
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="title">Book Title:</label> <input type="text"
											class="form-control" id="title" name="title" required>
									</div>

									<!-- Form Group for Author -->
									<div class="form-group col-md-6">
										<label for="author">Author:</label> <input type="text"
											class="form-control" id="author" name="author" required>
									</div>
								</div>
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="category">Category:</label> <select
											class="form-control" id="categorySelect" name="category" required>
											<!-- dynamic list  -->
										</select>
									</div>
									<div class="form-group col-md-6">
										<label for="category">SubCategory:</label> <select
											class="form-control" id="subcategorySelect" name="subcategory" required>
											<!-- dynamic list -->
										</select>
									</div>
								</div>
								<!-- Form Row for Publication Year and Category -->
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="publisher">Publisher</label> <input
											type="text" class="form-control" id="publisher"
											name="publisher" required>
									</div>
									<div class="form-group col-md-4">
										<label for="publication_year">Publication Year:</label> <input
											type="number" class="form-control" id="publication_year"
											name="publication_year" required>
									</div>
									<div class="form-group col-md-4">
										<label for="price">Price:</label> <input
											type="number" class="form-control" id="price"
											name="price" required>
									</div>
								</div>
								<!-- description -->
								<div class="form-row">
									<div class="form-group">
										<label for="description">Description:</label><br>
										<textarea id="description" class="form-control" name="description" rows="4"
											cols="80"></textarea>
									</div>
								</div>
								<!-- language and status -->
								<div class="form-row">
									<div class="form-group col-md-4">
										<label for="status">Status:</label><br> <input
											type="radio" id="active" name="status" value="In stock"
											checked> Active <input type="radio" id="inactive"
											name="status" value="out of stock"> Inactive
									</div>
									<div class="form-group col-md-8">
										<label for="language">Language:</label><br> <input
											type="checkbox" id="MarathiCheckbox" name="language"
											value="Marathi">Marathi <input type="checkbox"
											id="HindiCheckbox" name="language" value="Hindi">
										Hindi <input type="checkbox" id="EnglishCheckbox"
											name="language" value="English"> English <input
											type="checkbox" id="otherCheckbox" name="language"
											value="other"> Other
										<!-- Other language input box -->
										<input type="text" class="form-control" id="otherLanguageInput"
											name="otherLanguage" placeholder="Specify Other Language"
											style="display: none;">
									</div>
								</div>
								<!-- image -->
								<div class="form-row">
									<div class="form-group col-md-5">
										<label for="profile_pic">Profile Picture</label><br> <input
											type="file" id="coverpic" name="coverpic" onchange="displayImage(this)">
									</div>

									<div class="form-group col-md-7">
										<label for="profile_pic">Preview Picture</label><br> <img
											id="imagePreview" src="#" alt="Image Preview"
											style="max-width: 50%; height: auto;">
									</div>
								</div>
								<input type="hidden" name="action" value="book_register" />

								<!-- Submit Button -->
								<div class="text-center mt-4">
									<button type="submit" name="register" id="register" class="btn btn-primary btn-md w-50">Register</button>
								</div>


							</form>
						</div>
					</div>
					<!-- End Card Container -->
				</div>
			</div>

			<!-- Include the footer -->
			<jsp:include page="/partials/Admin-Footer.jsp" />

		</div>
		<!-- End of Content Wrapper -->
	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->
	<a class="scroll-to-top rounded" href="#page-top"> <i
		class="fas fa-angle-up"></i>
	</a>

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

<script type="text/javascript" src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<script type="text/javascript">
        var contextPath = "<%=request.getContextPath()%>";
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/pages/AdminJs/admin-profile-update.js"></script>
			<script
		src="<%=request.getContextPath()%>/resources/pages/BookJs/book-add.js"></script> 
<%-- 			<script
		src="<%=request.getContextPath()%>/resources/pages/BookJs/try.js"></script> --%>
	<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pages/AdminJs/admin-logout.js"></script>
</body>

</html>
