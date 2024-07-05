<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="icon" href="<%=request.getContextPath()%>/resources/images/books/favicon2.webp">
<title>FilterBooks</title>
<link href="https://cdn.datatables.net/2.0.2/css/dataTables.dataTables.min.css">
<link
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"
	rel="stylesheet">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
<!-- Custom fonts for this template-->
<link
	href="<%=request.getContextPath()%>/resources/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/resources/css/user.css">
</head>
<body class="body">
	<!-- Include the header -->
	<jsp:include page="/partials/User-Header.jsp" />
	<jsp:include page="/partials/User-Header2.jsp" />
	<hr>
	<br>


	 <section class="breadcrumb-option">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="breadcrumb__text">
                        <h4>Shop</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Shop</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
     <section class="shop spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="shop__sidebar">
                        <div class="shop__sidebar__search">
                            <form action="#">
                                <input type="text" placeholder="Search...">
                                <button type="submit"><span class="icon_search"></span></button>
                            </form>
                        </div>
                        <div class="shop__sidebar__accordion">
                            <div class="accordion" id="accordionExample">
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseOne">SubCategories</a>
                                    </div>
                                    <div id="collapseOne" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__categories">
                                                <ul class="nice-scroll">
                                                    <li> <li>
                                                        <input type="checkbox" name="subcategory" value="Sports"> Sports
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" name="subcategory" value="Rommance"> Rommance
                                                    </li>
                                                    <li>
                                                        <input type="checkbox" name="subcategory" value="Self-Development"> Self-Development
                                                	</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseTwo">Publishers</a>
                                    </div>
                                    <div id="collapseTwo" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__brand">
                                                <ul>
                                                    <li><a href="#">Louis Vuitton</a></li>
                                                    <li><a href="#">Chanel</a></li>
                                                    <li><a href="#">Hermes</a></li>
                                                    <li><a href="#">Gucci</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseThree">Filter Price</a>
                                    </div>
                                    <div id="collapseThree" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__price">
                                                <ul>
                                                    <li><a href="#">below 100</a></li>
                                                    <li><a href="#">100-200</a></li>
                                                    <li><a href="#">200-500</a></li>
                                                    <li><a href="#">500-1000</a></li>
                                                    <li><a href="#">more 1000</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-heading">
                                        <a data-toggle="collapse" data-target="#collapseFour">Languages</a>
                                    </div>
                                    <div id="collapseFour" class="collapse show" data-parent="#accordionExample">
                                        <div class="card-body">
                                            <div class="shop__sidebar__size">
                                                <label for="sm">Englsih
                                                    <input type="radio" id="sm">
                                                </label>
                                                <label for="md">Hindi
                                                    <input type="radio" id="md">
                                                </label>
                                                <label for="xs">Marathi 
                                                    <input type="radio" id="xs">
                                                </label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-9">
                    <div class="shop__product__option">
                        <div class="row">
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__left">
                                    <p></p>
                                </div>
                            </div>
                            <div class="col-lg-6 col-md-6 col-sm-6">
                                <div class="shop__product__option__right">
                                    <p>Sort by : </p>
                                    <select>
                                        <option value="">Select Option</option>
                                        <option value="">Low To High</option>
                                        <option value="">High To Low</option>
                                        <option value="">New Arrivals</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                      <div class="filteredItems">
                      
                      </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="product__pagination">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
	
	

	
	
	
	
	<!-- Include jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<jsp:include page="/Manage-User.jsp" />
	<script type="text/javascript">
        var contextPath = "<%=request.getContextPath()%>";
	</script>
	
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

<script
		src="<%=request.getContextPath()%>/resources/pages/BookJs/book-details-users.js"></script>
		<script
		src="<%=request.getContextPath()%>/resources/pages/BookJs/book-filters.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-details.js"></script>
<%-- 	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/menubardropdown.js"></script> --%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-login.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-logout.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
</body>

</html>
