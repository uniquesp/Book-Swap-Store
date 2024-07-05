<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Second Navbar -->
<div class="second-navbar bg-light mb-4">
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-4 my-auto">
				<ul class="nav">
					<!--  <li class="nav-item">
                            <a class="nav-link" href="#">Bestsellers</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#">New Arrivals</a>
                        </li> -->
				</ul>
			</div>
			<div class="col-md-6 my-auto d-flex justify-content-center">
				<form role="search" class="w-100">
					<div class="input-group">
						<input type="search" placeholder="Search books"
							class="form-control" style="max-width: 500px;" />
						<button class="btn btn-outline-secondary" type="submit">
							<i class="fa fa-search"></i>
						</button>
					</div>
				</form>
			</div>
			<div class="col-md-2 my-auto d-flex justify-content-end">
				<a href="Sell-Book.jsp"><button class="btn btn-primary btn-sm">Sell Your Book</button></a>
			</div>
		</div>
	</div>
</div>


<!-- Third Navbar -->
<!-- <div class="main-navbar mb-4">
	<div class="container-fluid">
		<nav class="navbar navbar-expand-lg">
			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav mx-auto" style="font-size: 75%">
					<li class="nav-item">
						<button class="btn btn-outline nav-link mx-2">Academics</button>
					</li>
					<li class="nav-item">
						<button class="btn btn-outline nav-link mx-2">Fiction</button>
					</li>
					<li class="nav-item">
						<button class="btn btn-outline nav-link mx-2">Non-Fiction</button>
					</li>
					<li class="nav-item">
						<button class="btn btn-outline nav-link mx-2">Children</button>
					</li>
					<li class="nav-item">
						<button class="btn btn-outline nav-link mx-2">Young-Adults</button>
					</li>
					<li class="nav-item">
						<button class="btn btn-outline nav-link mx-2">Comics
							& Novels</button>
					</li>
					<li class="nav-item">
						<button class="btn btn-outline nav-link mx-2">Languages</button>
					</li>
					<li class="nav-item">
						<button class="btn btn-outline nav-link mx-2">Offers</button>
					</li>
				</ul>
			</div>
		</nav>
	</div>
</div> -->


<div class="main-navbar mb-4">
    <div class="container-fluid">
        <nav class="navbar navbar-expand-lg">
            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mx-auto" style="font-size: 75%">
                    <li class="nav-item">
                        <button class="btn btn-outline nav-link mx-2" onmouseover="showSubcategories(7)">Academics</button>
                        <div id="academicsDropdown" class="dropdown-menu" style="display: none;"></div>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-outline nav-link mx-2" onmouseover="showSubcategories(1)">Fiction </button>
                        <div id="fictionDropdown" class="dropdown-menu" style="display: none;"></div>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-outline nav-link mx-2" onmouseover="showSubcategories(2)">Non-Fiction</button>
                        <div id="nonfictionDropdown" class="dropdown-menu" style="display: none;"></div>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-outline nav-link mx-2" onmouseover="showSubcategories(3)">Children</button>
                        <div id="childrenDropdown" class="dropdown-menu" style="display: none;"></div>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-outline nav-link mx-2" onmouseover="showSubcategories(6)">Young-Adults</button>
                        <div id="youngadultDropdown" class="dropdown-menu" style="display: none;"></div>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-outline nav-link mx-2" onmouseover="showSubcategories(5)">Comics
							& Novels</button>
                        <div id="commicsDropdown" class="dropdown-menu" style="display: none;"></div>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-outline nav-link mx-2" onmouseover="showSubcategories(4)">Languages</button>
                        <div id="languagesDropdown" class="dropdown-menu" style="display: none;"></div>
                    </li>
                    <li class="nav-item">
                        <button class="btn btn-outline nav-link mx-2" onmouseover="showSubcategories(8)">Offers</button>
                        <div id="offersDropdown" class="dropdown-menu" style="display: none;"></div>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>