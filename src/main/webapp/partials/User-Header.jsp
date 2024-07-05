<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="com.controller.UserController"%>
<%@ page import="javax.servlet.http.HttpSession"%>

<!-- newly added -->
<link
	href="https://getbootstrap.com/docs/5.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/common-user.css">
</head>
<!-- First Navbar -->
<div class="main-navbar shadow-sm sticky-top mb-4">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-7 my-auto">
				<h5 class="brand-name">
					<a href="User-Dashboard.jsp">BookSwapStore</a>
				</h5>
			</div>
			<div class="col-md-4 my-auto">
				<ul class="nav justify-content-end" style="font-size: 85%">
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/User-Wishlist.jsp">BookShelf
							<i class="fa fa-heart"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link"
						href="<%=request.getContextPath()%>/User-Cart.jsp">Cart (<span
							class="cart-count">0</span>) <i class="fa fa-shopping-cart"></i>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="<%=request.getContextPath()%>/User-Orders-History.jsp">View
							Orders <i class="fa fa-list-alt"></i>
					</a></li>
				</ul>
			</div>

			<div class="col-md-1 my-auto">
				<%
    HttpSession session1 = request.getSession(false);
    if (session1 != null && session1.getAttribute("userId") != null) {
        // User is logged in
        String userName = (String) session1.getAttribute("userName");
        String userId = (String) session1.getAttribute("userId"); // Get userId
    %>

				<div class="dropdown">
					<button class="btn btn-outline-primary dropdown-toggle"
						type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<img
							src="<%=request.getContextPath()%>/resources/images/static-img/user_profile.svg"
							class="rounded-circle" width="30" height="30" alt="">
						<%=userName%>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
						<li><a class="dropdown-item" onclick="getUser('<%=userId%>')" href="#">Edit
								Profile</a></li>
								<li><a class="dropdown-item" onclick="sellRequest('<%=userId%>')" href="User-Sell-Request.jsp">Sell Requests</a></li>
						<li><a class="dropdown-item"
							onclick="deactivateAccount('<%=userId%>')" href="#">Deactivate
								Account</a></li>
						<!-- Pass userId to deactivateAccount() -->
						<li><a class="dropdown-item" onclick="userLogout()" href="#">Logout</a></li>
					</ul>
				</div>
				<%
				} else {
				%>
				<!-- User is not logged in -->
				<a href="<%=request.getContextPath()%>/User-Login.jsp"
					class="ml-1">
					<button class="btn btn-outline-primary">Signup</button>
				</a>
				<%
				}
				%>
			</div>
		</div>	
	</div>
</div>

<script
	src="https://getbootstrap.com/docs/5.0/dist/js/bootstrap.bundle.min.js"></script>

