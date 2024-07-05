<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>BookSwapStore</title>
<link rel="icon" href="<%=request.getContextPath()%>/resources/images/logo/logo1.png" type="image/png">
<link
	href="https://cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
<link rel="stylesheet"
	href="https://cdpn.io/justinklemm/fullpage/kyMjjv?anon=true&view=">
<style>
.shopping__cart__table table tbody tr td {
    padding-bottom: 10px !important;
    padding-top: 10px !important;
}
.cart__total {
    background: white !important;
    padding: 33px 10px 40px !important;
}
.breadcrumb-option {
    padding: 11px 0 !important;
    margin-top: 10% !important;
}
.spad {
    padding-top: 30px !important;
}
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
                        <h4>Order History</h4>
                        <div class="breadcrumb__links">
                            <a href="<%=request.getContextPath()%>/User-Dashboard.jsp">Home</a>
                            <span>Order History</span>
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
                <select id="pageSizeSelect" class="form-select form-select-sm">
                    <option value="5" selected>5</option>
                    <option value="10">10</option>
                    <option value="20">20</option>
                </select>
            <div class="row">
                <div class="col-lg-12">
                    <section class="shopping-cart spad">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="shopping__cart__table">
                                        <table>
                                            <thead class="cart-header">
                                                <!-- Table headers will be appended here by AJAX -->
                                            </thead>
                                            <tbody>
                                                <!-- Cart items will be appended here by AJAX -->
                                            </tbody>
                                        </table>
                                    </div>
                                    <!-- Pagination info -->
                                    <div class="pagination-info mt-3"></div>
                                    <!-- Pagination buttons -->
                                    <div class="pagination-buttons mt-3"></div>
                                </div>
                            </div>
                        </div>
                    </section>
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
		src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/BookJs/book-details-users.js"></script>
	<%-- <script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/order-details.js"></script> --%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/try-order.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-details.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-logout.js"></script>
	<script type="text/javascript"
		src="https://cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
</body>
</html>