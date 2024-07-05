
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- Sidebar -->
<ul
	class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
	id="accordionSidebar">

	<!-- Sidebar - Brand -->
	<a
		class="sidebar-brand d-flex align-items-center justify-content-center"
		href="#">
		<div class="sidebar-brand-icon rotate-n-15">
			<i class="fas fa-user-shield"></i>
		</div>
		<div class="sidebar-brand-text mx-3">Admin</div>
	</a>

	<!-- Divider -->
	<hr class="sidebar-divider my-0">

	<!-- Nav Item - Dashboard -->
	<li class="nav-item active"><a class="nav-link"
		href="<%=request.getContextPath()%>/Admin-Dashboard.jsp"> <i
			class="fas fa-fw fa-tachometer-alt"></i> <span>Dashboard</span></a></li>

	<!-- Divider -->
	<hr class="sidebar-divider">
	<!-- Heading -->
	<div class="sidebar-heading"></div>

	<!-- Nav Item - Pages Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseTwo" aria-expanded="true"
		aria-controls="collapseTwo"> <i class="fas fa-fw fa-users"></i> <span>User
				Management</span>
	</a>
		<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
			data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Components:</h6>
				<a class="collapse-item"
					href="<%= request.getContextPath() %>/User-Details.jsp">View
					User</a>
				<!--   <a class="collapse-item" href="#">Deleted User</a> -->
			</div>
		</div></li>

	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseUtilities"
		aria-expanded="true" aria-controls="collapseUtilities"> <i
			class="fas fa-fw fa-book"></i> <span>Book Management</span>
	</a>
		<div id="collapseUtilities" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Utilities:</h6>
				<a class="collapse-item"
					href="<%= request.getContextPath() %>/Book-Add.jsp">Add Books</a> <a
					class="collapse-item"
					href="<%= request.getContextPath() %>/Book-Details.jsp">View
					Books</a>
			</div>
		</div></li>

	<!-- Nav Item - Utilities Collapse Menu -->
	<li class="nav-item"><a class="nav-link collapsed" href="#"
		data-toggle="collapse" data-target="#collapseUtilities4"
		aria-expanded="true" aria-controls="collapseUtilities4"> <i
			class="fa fa-building" aria-hidden="true"></i> <span>Book
				categories</span>
	</a>
		<div id="collapseUtilities4" class="collapse"
			aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
			<div class="bg-white py-2 collapse-inner rounded">
				<h6 class="collapse-header">Custom Utilities:</h6>
				<a class="collapse-item"
					href="<%= request.getContextPath() %>/Category-Details.jsp">View
					Categories</a> <a class="collapse-item"
					href="<%= request.getContextPath() %>/SubCategory-Details.jsp">View
					Sub-Categories</a>
			</div>
		</div></li>
	<!-- 
    Nav Item - Utilities Collapse Menu --->
    <li class="nav-item">
        <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities2"
            aria-expanded="true" aria-controls="collapseUtilities2">
            <i class="fas fa-fw fa-hand-holding-usd"></i>
            <span>Books Sell request</span>
        </a>
        <div id="collapseUtilities2" class="collapse" aria-labelledby="headingUtilities"
            data-parent="#accordionSidebar">
            <div class="bg-white py-2 collapse-inner rounded">
                <h6 class="collapse-header">Custom Utilities:</h6>
                <a class="collapse-item" href="Admin-Sell-Request.jsp">Sell Request</a>
               <!--  <a class="collapse-item" href="#">Accepted Request</a>
                <a class="collapse-item" href="#">Rejected Request</a> -->
            </div>
        </div>
    </li> 

       <!--  Nav Item - Utilities Collapse Menu -->
        <li class="nav-item">
            <a class="nav-link collapsed" href="#" data-toggle="collapse" data-target="#collapseUtilities3"
                aria-expanded="true" aria-controls="collapseUtilities3">
                <i class="fas fa-fw fa-shopping-cart"></i>
                <span>Orders</span>
            </a>
            <div id="collapseUtilities3" class="collapse" aria-labelledby="headingUtilities"
                data-parent="#accordionSidebar">
                <div class="bg-white py-2 collapse-inner rounded">
                    <h6 class="collapse-header">Order Summary:</h6>
                    <a class="collapse-item" href="<%= request.getContextPath() %>/Admin-Orders-Details.jsp">View Order Request</a>
                  <!--   <a class="collapse-item" href="#">Order Completed</a>
                    <a class="collapse-item" href="#">Order Cancelled</a> -->
                </div>
            </div>
        </li>
	<!-- Divider -->

	<hr class="sidebar-divider">
	<!-- Divider -->
	<hr class="sidebar-divider d-none d-md-block">

	<!-- Sidebar Toggler (Sidebar) -->
	<div class="text-center d-none d-md-inline">
		<button class="rounded-circle border-0" id="sidebarToggle"></button>
	</div>

</ul>
<!-- End of Sidebar -->




