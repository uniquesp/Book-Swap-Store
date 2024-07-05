<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>RegistrationForm</title>

<!-- MATERIAL DESIGN ICONIC FONT -->
<link rel="stylesheet"
	href="<%=request.getContextPath() %>/resources/fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
<link rel="stylesheet" href="<%=request.getContextPath() %>/resources/css/user-login.css">


</head>
<body>
	<div class="wrapper"
		style="background-image: url('<%=request.getContextPath() %>/resources/images/static-img/Book-Background-img.jpg');">
		<div class="inner">
			<div class="image-holder">
				<img src="<%=request.getContextPath() %>/resources/images/static-img/Book-Side-img.jpg" alt="">
				<div class="loginlink">
					Already Have Aaccount <a
						href="<%=request.getContextPath()%>/User-Login.jsp">Login Here </a>
				</div>
			</div>
			<form id="registration_form"
				action="<%=request.getContextPath()%>/user" method="Post">
				<input type="hidden" name="method" value="register_user" />
				<h3>Registration Form</h3>
				<div class="form-wrapper">
					<input type="text" name="user_name" id="user_name"
						placeholder="Name" class="form-control"
						autofocus required> <i class="zmdi zmdi-account"></i>
				</div>
				<div class="form-wrapper">
					<input type="email" name="user_email" id="user_email"
						placeholder="Email Address" class="form-control" required>
					<i class="zmdi zmdi-email"></i>
				</div>
				<div class="form-group">
					<input type="text" name="user_mobile" id="user_mobile"
						placeholder="Mobile No" pattern="[789][0-9]{9}"
						class="form-control" required> <input type="date"
						name="Birth_Date" id="Birth_Date" placeholder="Birth_Date"
						class="form-control" required>
				</div>
				<div class="form-wrapper">
					<select class="form-control" name="user_gender" id="user_gender"
						required>
						<option value="" disabled selected>Gender</option>
						<option value="male">Male</option>
						<option value="female">Female</option>
						<option value="other">Other</option>
						<option value="no">Not to Specify</option>
					</select> <i class="zmdi zmdi-caret-down" style="font-size: 17px"></i>
				</div>
				<div class="form-wrapper">
					<input type="text" name="user_address" id="user_address"
						placeholder="Address" class="form-control" required> <i class="zmdi zmdi-pin"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" name="password" id="password"
						placeholder="Password" class="form-control" required>
					<i class="zmdi zmdi-eye"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" name="confirm_password" id="confirm_password"
						placeholder="Confirm Password" class="form-control"
						required> <i class="zmdi zmdi-eye"></i>
				</div>
					<input type="hidden" name="action" value="register" />
				<button name="register" id="register"
					value="submit">
					Register <i class="zmdi zmdi-arrow-right"></i>
				</button>
			</form>
		</div>
	</div>
	<script src="<%= request.getContextPath() %>/resources/js/jquery.js"></script>
	<script src="<%= request.getContextPath() %>/resources/pages/UserJs/user-register.js"></script>
	<%-- <script src="<%= request.getContextPath() %>/resources/js/script.js"></script> --%>
</body>
</html>