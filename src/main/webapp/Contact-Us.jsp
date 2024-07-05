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
                        <h4>Contact Us</h4>
                        <div class="breadcrumb__links">
                            <a href="./index.html">Home</a>
                            <span>Contact Us</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Breadcrumb Section End -->


    <!-- Map Begin -->
    <div class="map">
        <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3782.897733656835!2d73.87380831484488!3d18.531671987399883!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3bc2c38e3dcb8387%3A0x8e1f72a25c8e2c74!2sABC%20Chowk%2C%20Somwar%20Peth%2C%20Pune%2C%20Maharashtra%20411011%2C%20India!5e0!3m2!1sen!2sin!4v1621957556823!5m2!1sen!2sin" height="500" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
    </div>     
    <!-- Map End -->

    <!-- Contact Section Begin -->
    <section class="contact spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 col-md-6">
                    <div class="contact__text">
                        <div class="section-title">
                            <span>Get in touch</span>
                            <h2>Contact Us</h2>
                            <p>Hey, Fill up this form and we will get back to you have you with us.</p>
                        </div>
                        <ul>
                            <li>
                                <h4>India</h4>
                                <p><i class="fa fa-phone"></i>&nbsp; +91 8899776543 (11am to 7pm, Mon-Fri)</p>
                                <p><i class="fa fa-envelope"></i>&nbsp; bookswapstore@gmail.com</p>
                                <p><i class="fa fa-map-marker"></i>&nbsp; BookSwapStore shop, ABC Chowk Pune, Maharashtra</p>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="col-lg-6 col-md-6">
                    <div class="contact__form">
                        <form action="#">
                            <div class="row">
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Name">
                                </div>
                                <div class="col-lg-6">
                                    <input type="text" placeholder="Email">
                                </div>
                                <div class="col-lg-12">
                                    <textarea placeholder="Message"></textarea>
                                    <button type="submit" class="site-btn">Send Message</button>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Contact Section End -->
	<jsp:include page="/partials/User-Footer.jsp" />
</body>
</html>