<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" href="<%=request.getContextPath()%>/resources/images/logo/logo1.png" type="image/png">
<title>LoginForm</title>

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
					Not Have Account New User?? <a
						href="<%=request.getContextPath()%>/User-Register.jsp">Register
						Here </a>
				</div>
			</div>
			<form id="login_form" action="<%=request.getContextPath()%>/user"
				method="post">
				<input type="hidden" name="method" value="login_user" />
				<h3>Login Form</h3>

				<div class="form-wrapper">
					<input type="email" name="user_email" id="user_email"
						placeholder="Email Address" class="form-control"> <i
						class="zmdi zmdi-email"></i>
				</div>
				<div class="form-wrapper">
					<input type="password" name="password" id="password"
						placeholder="Password" class="form-control"> <i
						class="zmdi zmdi-eye toggle-password"></i>
				</div>
				<button type="submit" name="login" id="login" value="submit">
					Login <i class="zmdi zmdi-arrow-right"></i>
				</button>
			</form>

		</div>
	</div>
	<script src="<%=request.getContextPath() %>/resources/js/jquery.js"></script>
	<script src="<%=request.getContextPath() %>/resources/pages/UserJs/user-login.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/script.js"></script>
	<script src="<%=request.getContextPath() %>/resources/js/loginform_validation.js"></script>
	<script type="text/javascript">
	var contextPath = "<%= request.getContextPath() %>";
	</script>
</body>
</html>