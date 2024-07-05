<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>BookSwapStore</title>
<link rel="icon" href="<%=request.getContextPath()%>/resources/images/logo/logo1.png" type="image/png">
<link href="https://cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdpn.io/justinklemm/fullpage/kyMjjv?anon=true&view=">

<style>
.breadcrumb-option {
    padding: 11px 0 !important;
    margin-top: 10% !important;
}
.spad {
    padding-top: 30px !important;
}
.shopping__cart__table table tbody tr td {
    padding-bottom: 10px !important;
    padding-top: 10px !important;
}
.input-quantity{
    width: 76px !important;
    margin-left: 5px !important;
    margin-right: 5px !important;
}
.input-group {
    position: relative;
    display: -ms-flexbox;
    display: flex !important;
    -ms-flex-wrap: wrap;
    flex-wrap: nowrap !important;
    -ms-flex-align: stretch;
    width: 72%;
    align-items: center !important;
}
/* .row{
    padding: 20px 0px !important;
} */
</style>

<body class="body">
	<!-- Include the header -->
	<jsp:include page="/partials/User-Headerv1.jsp" />
	<!-- Main Content -->

   <!-- Breadcrumb Section Begin -->
    <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Cart Details</h4>
                        <div class="breadcrumb__links">
                            <a href="<%=request.getContextPath()%>/User-Dashboard.jsp">Home</a>
                            <span>CartDetails</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->

 <section class="spad">
    <div class="container">
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
	</div>
	</section>
	
<jsp:include page="/partials/User-Footer.jsp" />
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
		src="<%=request.getContextPath()%>/resources/pages/UserJs/cart-details1.js"></script>
		<script type="text/javascript" src="https://checkout.razorpay.com/v1/checkout.js"></script>
			<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-details.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-logout.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
</body>
</html>