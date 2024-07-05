<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<title>BookSwapStore</title>
<link rel="icon" href="<%=request.getContextPath()%>/resources/images/logo/logo1.png" type="image/png">

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
                        <h4>About Us</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>About Us</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->


	<!-- About Section Begin -->
	<section class="about spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="about__pic">
						<img src="<%=request.getContextPath()%>/resources/images/user/about/about-us1.png" alt="">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="about__item">
						<h4>Why Choose Us ?</h4>
						<h6
							style="font-weight: 300; font-family: sans-serif; font-style: italic;">Not
							your average online bookstore</h6>
						<p>We make sure to regularly add new titles and publishers to
							our constantly evolving catalogue of books ensuring your next
							right book is just a click away. Background Image</p>
						<br>
						<h6
							style="font-weight: 300; font-family: sans-serif; font-style: italic;">We
							take books seriously!</h6>
						<p>Books for all ages Books across a wide range of genres:
							Academics, Fiction, Non-Fiction, Teen & Young Adult, Children,
							Comics, and more. Books from the top publishers from within India
							and across the world</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="about__item">
						<h4>Who We Do ?</h4>
						<h6
							style="font-weight: 300; font-family: sans-serif; font-style: italic;">Passion
							for books and technology</h6>
						<p>We are a premier online bookstore combining cutting-edge
							technology with human intuitiveness to offer an unmatched
							literary journey. Emerging from decades of experience in the book
							printing industry, we are well-tuned to the needs of every
							reader, publisher and content creator.Thus, we are uniquely
							equipped to create a book-centric user experience, with access to
							an exhaustive catalogue, made fuss-free with tailored
							recommendations and an efficient delivery system.</p>
					</div>
				</div>
				<div class="col-lg-4 col-md-4 col-sm-6">
					<div class="about__item">
						<h4>What sets apart ?</h4>
						<h6
							style="font-weight: 300; font-family: sans-serif; font-style: italic">Designed
							with you in mind</h6>
						<p>
							<b>Personalisation : </b>Leveraging AI, we learn your tastes and
							preferences to personalise your user experience with customised
							book recommendations.
						</p>
						<p>
							<b>Your Bookshelf : </b> We offer an exclusive space to track
							books you want to read, are reading, or have read - even monitor
							your friends' reading progress and recommend books to others.
						</p>
						<p>
							<b>Powerful Search : </b>The in-built technology powers our
							ability to suggest the best book matches for you, including
							overlooked gems.
						</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- About Section End -->

	<!-- Testimonial Section Begin -->
	<section class="testimonial">
		<div class="container-fluid">
			<div class="row">
				<div class="col-lg-6 p-0">
					<div class="testimonial__text">
						<span class="icon_quotations"></span>
						<h6>Technology is our friend</h6>
						<p>Created for the love of books and the book community –
							authors, publishers and readers – we focus on providing every
							user with a seamless, personalised experience with purpose-built
							features. We leverage the massive technology and distribution
							capabilities of our parent company, Repro India Limited, to get
							readers the right book at the right time. With the power of our
							‘Print-On-Demand’ services,This way there is zero wastage. We are
							good for the world and you!</p>
					</div>
				</div>
				<div class="col-lg-6 p-0">
					<div class="testimonial__pic set-bg"
						data-setbg="<%=request.getContextPath()%>/resources/images/user/about/page4.png"></div>
				</div>
			</div>
		</div>
	</section>
	<!-- Testimonial Section End -->

	<!-- Counter Section Begin -->
	<section class="counter spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="counter__item">
						<div class="counter__item__number">
							<h2 class="cn_num">10</h2>
						</div>
						<span>Our <br />Clients
						</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="counter__item">
						<div class="counter__item__number">
							<h2 class="cn_num">6</h2>
						</div>
						<span>Total <br />Categories
						</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="counter__item">
						<div class="counter__item__number">
							<h2 class="cn_num">18</h2>
						</div>
						<span>Total <br />SubCategories
						</span>
					</div>
				</div>
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="counter__item">
						<div class="counter__item__number">
							<h2 class="cn_num">98</h2>
							<strong>%</strong>
						</div>
						<span>Happy <br />Customer
						</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Counter Section End -->

	<!-- Client Section Begin -->
	<section class="clients spad">
		<div class="container">
			<div class="row">
				<div class="col-lg-12">
					<div class="section-title">
						<span></span>
						<h3>SOMETHING FOR EVERYONE</h3>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<h4 class="client__item">Fiction</h4>
					<p class="client__item">An exhaustive collection across
						romance, crime, thriller and mystery, fantasy, horror and science
						fiction, historical fiction, religious and spiritual fiction,
						Indian writing and dystopian genres.</p>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<h4 class="client__item">Non-fiction</h4>
					<p class="client__item">Find inspiring biographies, explore
						current affairs and social issues, or seek self-improvement with
						titles like can't Hurt Me.</p>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<h4 class="client__item">Academics</h4>
					<p class="client__item">Find academic books for every
						requirement from the top publishers: schoolbooks, higher education
						and professional books.</p>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<h4 class="client__item">Teen & Young Adult</h4>
					<p class="client__item">Captivating collection of coming-of-age
						stories that resonate with young readers such as Diary of A Space
						Traveller, Mac B. Kid Spy #1: Mac Undercover, Alice's Adventures
						in Wonderland and Little Women.</p>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<h4 class="client__item">Children</h4>
					<p class="client__item">A delightful collection of books for
						children of all ages: board books and picture books, fairy tales,
						folktales, chapter books, activity books and comics.</p>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<h4 class="client__item">Comics & Graphics Novels</h4>
					<p class="client__item">Superheroes from the Marvel and DC
						universe to the much-loved Chacha Chaudhary and Wimpy Kid, all
						make their home here.</p>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<h4 class="client__item">New Arrivals</h4>
					<p class="client__item">Uncover hidden gems from emerging
						authors or pre-order highly anticipated new releases. With our
						regularly updated collection, you will always be at the forefront
						of trends and discoveries.</p>
				</div>
				<div class="col-lg-3 col-md-4 col-sm-4 col-6">
					<h4 class="client__item">Offers</h4>
					<p class="client__item">Make the most of our exclusive
						discounts, unbeatable offers, and limited-time deals across all
						categories, to find your next literary treasure at irresistible
						prices.</p>
				</div>
			</div>
		</div>
	</section>
	<!-- Client Section End -->

	<jsp:include page="/partials/User-Footer.jsp" />
</body>
</html>