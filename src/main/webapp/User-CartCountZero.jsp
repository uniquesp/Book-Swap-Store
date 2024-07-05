<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Cart</title>
<style>
</style>
</head>
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/cart.css">
<link rel="stylesheet"
	href="https://cdpn.io/justinklemm/fullpage/kyMjjv?anon=true&view=">
<body class="body">
	<jsp:include page="/partials/User-Header.jsp" />
	<h1>Shopping Cart</h1>

	<div class="py-3 py-md-5 bg-edf7fa">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="shopping-cart">

						<div class="cart-image">
							<img
								src="<%=request.getContextPath()%>/resources/images/static-img/cart-image.png">
							<a href="<%=request.getContextPath()%>/User-Dashboard.jsp"><button
									type="button" class="btn btn-outline-primary">Start
									Shopping</button></a>
						</div>

					</div>
				</div>
			</div>
		</div>
	</div>

	<!-- Include jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<script type="text/javascript">
    var contextPath = "<%=request.getContextPath()%>
		";
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/cart-details.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-logout.js"></script>
</body>
</html>