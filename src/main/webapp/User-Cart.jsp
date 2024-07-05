<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">	
<head>
<link rel="icon" href="<%=request.getContextPath()%>/resources/images/books/favicon2.webp">
<meta charset="UTF-8">
<title>Cart</title>
</head>

<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/cart.css">
<link rel="stylesheet"
	href="https://cdpn.io/justinklemm/fullpage/kyMjjv?anon=true&view=">
	<link href="https://cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
<body class="body">
	<jsp:include page="/partials/User-Header.jsp" />
	<h1>Shopping Cart</h1>

	<div class="py-3 py-md-5 bg-edf7fa">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="shopping-cart">
						<%
						HttpSession session1 = request.getSession(false);
						if (session1 != null && session1.getAttribute("userId") != null) {
						%>
						
						<%
						} else {
						%>
						<div class="cart-image">
							<img
								src="<%=request.getContextPath()%>/resources/images/static-img/cart-image.png">
						<a href="<%=request.getContextPath()%>/User-Dashboard.jsp"><button type="button" class="btn btn-outline-primary">Start Shopping</button></a>
						</div>
						<%
						}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>
<jsp:include page="/Manage-User.jsp" />
	<!-- Include jQuery -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<script type="text/javascript">
    var contextPath = "<%=request.getContextPath()%>";
	</script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/cart-details.js"></script>
		<script type="text/javascript" src="https://checkout.razorpay.com/v1/checkout.js"></script>
			<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-details.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-logout.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
</body>
</html>