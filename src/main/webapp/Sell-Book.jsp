<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Book Sell</title>
<link rel="icon"
	href="<%=request.getContextPath()%>/resources/images/logo/logo1.png"
	type="image/png">

<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/sell-book.css">

</head>
<body>
	<div class="wrapper"
		style="background-image: url('<%=request.getContextPath()%>/resources/images/static-img/Book-Background-img.jpg');">
		<div class="inner">
			<form id="booksell_form" action="<%=request.getContextPath()%>/book"
				method="post" enctype="multipart/form-data">
				<input type="hidden" name="method" value="sell_book">
				<h3>Sell your Books</h3>

				<div class="form-wrapper">
					<input type="text" name="book_title" id="book_title"
						placeholder="Book Title" class="form-control">
				</div>
				<div class="form-wrapper">
					<input type="text" name="book_author" id="book_author"
						placeholder="Book Author" class="form-control">
				</div>
				<div class="form-group">
					<input type="number" name="publication_year" id="publication_year"
						placeholder="Publication Year" class="form-control"
						onchange="validatePublicationYear()"> <input type="text"
						name="language" id="language" placeholder="Book's Language"
						class="form-control">
				</div>
				<div class="form-wrapper">
					<input type="number" name="original_price" id="original_price"
						placeholder="Original Price in Rs." class="form-control">
				</div>
				<div class="form-wrapper" id="money_amount_wrapper">
					<input type="number" name="money_amount" id="money_amount"
						placeholder="Enter Expected Money/Token." class="form-control">
				</div>
				<div class="form-wrapper">
					<label> <input type="radio" name="return_type"
						value="Money" onchange="validateSellingPrice()"> Return
						Money
					</label> <label> <input type="radio" name="return_type"
						value="Token" onchange="validateSellingPrice()"> Return
						Token
					</label>
				</div>
				<br>
				<div class="form-group">
					<label>Book Image</label> <input type="file" name="book_image"
						id="book_image" onchange="displayImagePreview(this)"> <label
						for="profile_pic">Preview Picture</label> <br> <img
						id="imagePreview" src="#" alt="Image Preview"
						style="max-width: 30%; max-height: 25%;">
				</div>
				<button type="submit" name="booksell" id="booksell" value="submit"
					onclick="return validateForm()">Submit</button>
			</form>
		</div>
	</div>
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/sellform_validation.js"></script>
	<script
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-login.js"></script>
	<script src="<%=request.getContextPath()%>/resources/js/script.js"></script>
	<script type="text/javascript">
	var contextPath = "<%=request.getContextPath()%>";
	</script>
	<script
		src="<%=request.getContextPath()%>/resources/pages/BookJs/sell-book.js"></script>
</body>
</html>
