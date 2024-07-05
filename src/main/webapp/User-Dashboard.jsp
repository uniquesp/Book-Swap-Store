<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>BookSwapStore</title>
<link rel="icon" href="<%=request.getContextPath()%>/resources/images/logo/logo1.png" type="image/png">

<body class="body">
	<!-- Include the header -->
	<jsp:include page="/partials/User-Headerv1.jsp" />
	<!-- Main Content -->

<!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/hero/bestNovel1.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6 style="background-color: white;" >Best Seller Collection</h6>
                                <h2 style="color: white;background-color: black;">Best Books Collection</h2>
                                
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/hero/page5.png">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Selfhelp Collection</h6>
                                <h2>Personal Growth & Wealth </h2>
                                <p>A specialy curated set of World's Greatest Books For Personal Growth & Wealth</p>
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->

  <!-- Banner Section Begin -->
<section class="banner spad">
    <div class="container">
        <div class="row">
            <div class="col-lg-7 offset-lg-4">
                <div class="banner__item">
                    <div class="banner__item__pic">
                        <img src="<%=request.getContextPath()%>/resources/images/user/banner/banner1.jpg" alt="">
                    </div>
                    <div class="banner__item__text">
                        <h2>New Arrivals</h2>
                        <a href="#">Discover Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-5">
                <div class="banner__item banner__item--middle">
                    <div class="banner__item__pic">
                        <img src="<%=request.getContextPath()%>/resources/images/user/banner/banner2.jpg" alt="">
                    </div>
                    <div class="banner__item__text">
                        <h2>Gate Exams</h2>
                        <a href="#">Explore Now</a>
                    </div>
                </div>
            </div>
            <div class="col-lg-7">
                <div class="banner__item banner__item--last">
                    <div class="banner__item__pic">
                        <img src="<%=request.getContextPath()%>/resources/images/user/banner/banner3.jpg" alt="">
                    </div>
                    <div class="banner__item__text">
                        <h2>Science Nerds</h2>
                        <a href="#">Explore Now</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Banner Section End -->


    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">Best Sellers</li>
                        <li data-filter=".new-arrivals">New Arrivals</li>
                        <li data-filter=".hot-sales">Hot Sales</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter">
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/product/prod1.jpg">
                            <span class="label">New</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/view.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Lost Horizon</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="">Abhilashi Sharama</i>
                            </div>
                            <h5>RS 167.24</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/product/prod2.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/view.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Journey to NDA</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="">Ravina Mehta</i>
                            </div>
                            <h5>Rs 267</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item sale">
                        <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/product/prod3.jpg">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/view.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Armenia Dancer</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="">Robert Gill</i>
                            </div>
                            <h5>Rs 430.48</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/product/prod4.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/view.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Homer the Odessy</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="">ujwala Sharma</i>
                            </div>
                            <h5>Rs 600.9</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/product/prod5.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/view.png" alt=""></a></li>
                          </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Cat on Hot Tin</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="">Radhika Pande</i>
                            </div>
                            <h5>Rs 310.37</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item sale">
                        <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/product/prod6.jpg">
                            <span class="label">Sale</span>
                            <ul class="product__hover">
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/view.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>6 question before vote</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="">Utkarsh Jadhav</i>
                            </div>
                            <h5>Rs 98.49</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/product/prod7.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/view.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Joy of motherhood</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="">Sidhansh Gore</i>
                            </div>
                            <h5>Rs 419.66</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
                    <div class="product__item">
                        <div class="product__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/product/prod8.jpg">
                            <ul class="product__hover">
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/heart.png" alt=""></a></li>
                                <li><a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/icon/view.png" alt=""></a></li>
                            </ul>
                        </div>
                        <div class="product__item__text">
                            <h6>Man Search for meaning</h6>
                            <a href="#" class="add-cart">+ Add To Cart</a>
                            <div class="rating">
                                <i class="">Robert Gill</i>
                            </div>
                            <h5>Rs 216.28</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Product Section End -->

    <!-- Categories Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="categories__text">
                        <h2>Best Novels <br /> <span>Best Self Help</span> <br /> Best Story</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories__hot__deal">
                        <img src="<%=request.getContextPath()%>/resources/images/user/product-sale1.jpg" alt="">
                        <div class="hot__deal__sticker">
                            <span>Sale Of</span>
                            <h5>Rs 259.99</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1">
                    <div class="categories__deal__countdown">
                        <span>Deal Of The Week</span>
                        <h2>Hot Deal</h2>
                        <div class="categories__deal__countdown__timer" id="countdown">
                            <div class="cd-item">
                                <span>3</span>
                                <p>Days</p>
                            </div>
                            <div class="cd-item">
                                <span>1</span>
                                <p>Hours</p>
                            </div>
                            <div class="cd-item">
                                <span>50</span>
                                <p>Minutes</p>
                            </div>
                            <div class="cd-item">
                                <span>18</span>
                                <p>Seconds</p>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">Shop now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Instagram Section Begin -->
    <section class="instagram spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="instagram__pic">
                        <div class="instagram__pic__item set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/instagram/instagram-1.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/instagram/instagram-2.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/instagram/instagram-3.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/instagram/instagram-4.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/instagram/instagram-5.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/instagram/instagram-6.jpg"></div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="instagram__text">
                        <h2>Hindi Books</h2>
                        <p>Fast selling Hindi Books</p>
                        <h3>Marathi Books</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Instagram Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Latest Book News</span>
                        <h2>Don't miss out</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/blog/bestNovel.jpeg"></div>
                        <div class="blog__item__text">
                            <span><img src="<%=request.getContextPath()%>/resources/images/user/icon/calendar.png" alt=""> 16 February 2020</span>
                            <h5>Bestselling Novels of the Decade</h5>
                            <a href="https://www.rd.com/list/bestselling-books-of-decade/">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/blog/audiobook.jpeg"></div>
                        <div class="blog__item__text">
                            <span><img src="<%=request.getContextPath()%>/resources/images/user/icon/calendar.png" alt=""> 21 February 2020</span>
                            <h5>The Impact of Audiobooks on Reading Habits</h5>
                            <a href="https://time.com/5388681/audiobooks-reading-books/">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="<%=request.getContextPath()%>/resources/images/user/blog/bookclub.jpeg"></div>
                        <div class="blog__item__text">
                            <span><img src="<%=request.getContextPath()%>/resources/images/user/icon/calendar.png" alt=""> 28 February 2020</span>
                            <h5>Benefits of Joining a Book Club</h5>
                            <a href="https://bonafidebookworm.com/benefits-of-a-book-club/">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->


<jsp:include page="/partials/User-Footer.jsp" />

	<!-- Include jQuery -->
	<script src="<%=request.getContextPath()%>/resources/js/jquery.js"></script>
	<jsp:include page="/Manage-User.jsp" />
<!-- <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>	 -->
<script type="text/javascript">
      var contextPath = "<%=request.getContextPath()%>";
</script>
<script
		src="<%=request.getContextPath()%>/resources/pages/BookJs/book-details-users.js"></script>
<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-details.js"></script>
<%-- 	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/menubardropdown.js"></script> --%>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-login.js"></script>
				<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/js/common.js"></script>
	<script type="text/javascript"
		src="<%=request.getContextPath()%>/resources/pages/UserJs/user-logout.js"></script>
		<script type="text/javascript" src="https://cdn.datatables.net/2.0.2/js/dataTables.min.js"></script>
</body>
</html>
