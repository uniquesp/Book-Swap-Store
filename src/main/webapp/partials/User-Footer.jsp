<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 <!-- Footer Section Begin -->
 <footer class="footer">
    <div class="container">
        <div class="row">
            <div class="col-lg-3 col-md-6 col-sm-6">
                <div class="footer__about">
                    <div class="footer__logo">
                        <h4 style="color: aliceblue;">BookSwapStore</h4>
                    </div>
                    <p>The customer is at the heart of our unique business model, which includes design.</p>
                    <a href="#"><img src="<%=request.getContextPath()%>/resources/images/user/payment.png" alt=""></a>
                </div>
            </div>
            <div class="col-lg-2 offset-lg-1 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Categories</h6>
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
                </div>
            </div>
            <div class="col-lg-2 col-md-3 col-sm-6">
                <div class="footer__widget">
                    <h6>Shopping</h6>
                    <ul>
                        <li><a href="<%=request.getContextPath()%>/Contact-Us.jsp">Contact Us</a></li>
                        <li><a href="<%=request.getContextPath()%>/About-Us.jsp">About Us</a></li>
                    </ul>
                </div>
            </div>
            <div class="col-lg-3 offset-lg-1 col-md-6 col-sm-6">
                <div class="footer__widget">
                    <h6>NewLetter</h6>
                    <div class="footer__newslatter">
                        <p>Be the first to know about new arrivals, look books, sales & promos!</p>
                        <form action="#">
                            <input type="text" placeholder="Your email">
                            <button type="submit"><span class="icon_mail_alt"></span></button>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-lg-12 text-center">
                <div class="footer__copyright__text">
                    <p>Copyright ©
                        <script>
                            document.write(new Date().getFullYear());
                        </script>
                        All rights reserved by <a href="#" target="_blank">BookSwapStore</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</footer>
<!-- Footer Section End -->


    <!-- Js Plugins -->
    <script src="<%=request.getContextPath()%>/resources/user_js/jquery-3.3.1.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/user_js/bootstrap.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/user_js/jquery.nice-select.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/user_js/jquery.nicescroll.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/user_js/jquery.magnific-popup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/user_js/jquery.countdown.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/user_js/jquery.slicknav.js"></script>
    <script src="<%=request.getContextPath()%>/resources/user_js/mixitup.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/user_js/owl.carousel.min.js"></script>
    <script src="<%=request.getContextPath()%>/resources/user_js/main.js"></script>
 
