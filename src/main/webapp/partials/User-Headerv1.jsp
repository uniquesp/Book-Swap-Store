<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
 <!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
    <meta name="description" content="BookSwapStore Template">
    <meta name="keywords" content="BookSwapStore, unica, creative, html">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Nunito+Sans:wght@300;400;600;700;800;900&display=swap"
    rel="stylesheet">

    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/user_css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/user_css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/user_css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/user_css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/user_css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/user_css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/user_css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/resources/user_css/style.css" type="text/css">
</head>

<body>  
    <!-- Page Preloder -->
    <div id="preloder">
        <div class="loader"></div>
    </div>

    <!-- Offcanvas Menu Begin -->
    <div class="offcanvas-menu-overlay"></div>
    <div class="offcanvas-menu-wrapper">
        <div class="offcanvas__option">
            <div class="offcanvas__links">
                <a href="<%=request.getContextPath()%>/User-Login.jsp">Sign in</a>
            </div>
        </div>
        
        <div id="mobile-menu-wrap"></div>
        <div class="offcanvas__text">
           
        </div>
    </div>
    <!-- Offcanvas Menu End -->

  <!-- Header Section Begin -->
  <header class="header">
    <div class="header__top">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-7">
                    <div class="header__top__left">
                       <!--  <h4 style="color: aliceblue;"><link href="">BookSwapStore</h4> -->
                        <a href="<%=request.getContextPath()%>/User-Dashboard.jsp"><h4 style="color: aliceblue;">BookSwapStore</h4></a>
                    </div>
                </div>
                <div class="col-lg-4 col-md-7">
                    <div class="header__top__middle">
                       <!--  <div class="search-box">
                            <input type="text" placeholder="Search...">
                            <button type="submit"><i class="fa fa-search"></i></button>
                        </div> -->
                    </div>
                </div>
                <div class="col-lg-4 col-md-5">
                    <div class="header__top__right">
                        <div class="header__top__links">
                            <a href="<%=request.getContextPath()%>/Sell-Book.jsp">SellYourBook</a>
<%
HttpSession session1 = request.getSession(false);
if (session1 != null && session1.getAttribute("userId") != null) {
// User is logged in
String userName = (String) session1.getAttribute("userName");
String userId = (String) session1.getAttribute("userId"); // Get userId
%>

				<div class="dropdown" style="display: inline;top: -6px;">
					<button class="btn btn-outline-light dropdown-toggle"
						type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown"
						aria-expanded="false">
						<img
							src="<%=request.getContextPath()%>/resources/images/user/icon/user_profile.svg"
							class="rounded-circle" width="30" height="30" alt="">
						<%=userName%>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1" style="inset: 3px auto auto 30px !important;
margin: 8px !important; color:black;">
						<li style="color:black;"><a class="dropdown-item" onclick="getUser('<%=userId%>')" href="#">Edit
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

								<a href="<%=request.getContextPath()%>/User-Login.jsp">Sign in</a>
<%
}
%>
                        </div>
                        <div class="header__top__hover">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
  <div class="header__bot">
    <div class="container">
        <div class="row">
            <div class="col-lg-9 col-md-3">
                <nav class="header__menu mobile-menu">
                    <ul>
                            <li><a href="#" onclick="viewcategorybooks(7)" data-categoryid="7">Academics</a></li>
					        <li><a href="#" onclick="viewcategorybooks(1)" data-categoryid="1">Fiction</a></li>
					        <li><a href="#" onclick="viewcategorybooks(2)" data-categoryid="2">Non-Fiction</a></li>
					        <li><a href="#" onclick="viewcategorybooks(3)" data-categoryid="3">Children</a></li>
					        <li><a href="#" onclick="viewcategorybooks(6)" data-categoryid="6">Young-Adults</a></li>
					        <li><a href="#" onclick="viewcategorybooks(5)" data-categoryid="5">Commics-Novels</a></li>
					        <li><a href="#" onclick="viewcategorybooks(4)" data-categoryid="4">Languages</a></li>
					        <!-- <li><a href="#">Offers</a><input type="hidden" name="categoryid" value=""></li> -->
                    </ul>
                </nav>
            </div>
            <div class="col-lg-3 col-md-3">
                <div class="header__nav__option">
  <a href="<%= request.getContextPath() %>/User-CartDetails.jsp">
    <img src="<%= request.getContextPath() %>/resources/images/user/icon/cart.png" alt="" height="25px"> 
    <span class="cart-count">0</span>
  </a>
  <a href="<%= request.getContextPath() %>/User-Wishlist.jsp">
    <img src="<%= request.getContextPath() %>/resources/images/user/icon/heart.png" alt="" height="25px">
  </a>
  <a href="<%= request.getContextPath() %>/User-Orders-History.jsp">
    <img src="<%= request.getContextPath() %>/resources/images/user/icon/order-history.png" alt="" height="25px">
  </a>    
                </div>
            </div>
        </div>
        <div class="canvas__open"><i class="fa fa-bars"></i></div>
    </div>
 </div>
</header>
</body> 
<!-- Header Section End -->
<script src="https://getbootstrap.com/docs/5.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.6/dist/umd/popper.min.js"></script>
<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
<script>
function viewcategorybooks(categoryid) {
    localStorage.setItem('cid', categoryid);
    window.location.href = 'All-Books.jsp';
}

</script>

