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
                        <h4>Book Details</h4>
                        <div class="breadcrumb__links">
                            <a href="<%=request.getContextPath()%>/User-Dashboard.jsp">Home</a>
                            <span>View Book</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->
	

    <!-- Shop Details Section Begin -->
    <section class="shop-details">
        <div class="product__details__pic">
            <div class="container">
                <div class="row">
                    <div class="col-lg-3 col-md-3">
                    </div>
                    <div class="col-lg-6 col-md-9">
                        <div class="tab-content">
                            <div class="tab-pane active" id="tabs-1" role="tabpanel">
                            <div class="product__details__pic__item" style="margin-top: 10%;">
                                <img id="bookImage" src="" alt="Book Image">
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="product__details__content">
            <div class="container">
                <div class="row d-flex justify-content-center">
                    <div class="col-lg-8">
                        <div class="product__details__text">
                            <h4 id="bookTitle"></h4>
                            <h3 id="sellingPrice"></h3>
                            
                            <div class="product__details__option">
                                <div class="product__details__option__size">
                                </div>
                            </div>
                            
                            
                            <div class="product__details__cart__option">
                                <!-- <div class="quantity">
                                    <div class="pro-qty">
                                        <input type="text" value="1">
                                    </div>
                                </div> -->
                                <a href="#" class="primary-btn"  id="addToCartButton">add to cart</a>
                                
                            </div>
                            <div class="product__details__btns__option">
                                <a href="#" id="addToWishlistButton"><i class="fa fa-heart"></i> add to wishlist</a>

                            </div>
                            <div class="product__details__last__option">
                            </div>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-lg-12">
                        <div class="product__details__tab">
                            <ul class="nav nav-tabs" role="tablist">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#tabs-5"
                                    role="tab">Description</a>
                                </li>
                               
                            </ul>
                            <div class="tab-content">
                                <div class="tab-pane active" id="tabs-5" role="tabpanel">
                                    <div class="product__details__tab__content">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Shop Details Section End -->



<jsp:include page="/partials/User-Footer.jsp" />
<jsp:include page="/Manage-User.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
		<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script type="text/javascript">
    var contextPath = "<%=request.getContextPath()%>";
	</script>
	<script type="text/javascript"
		<%-- src="<%=request.getContextPath()%>/resources/pages/BookJs/view-book.js"></script> --%>
		src="<%=request.getContextPath()%>/resources/pages/UserJs/book-details-user.js"></script>
  </body>
</html>