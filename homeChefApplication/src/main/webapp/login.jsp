<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Chef - Login</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-md-5 offset-md-4">
				<div class="card mt-3">
					<div class="card-header custom-bg text-white">
						<h3>Login Here !!</h3>
					</div>
					<div class="card-body">

						<%@include file="components/message.jsp"%>

						<form action="userLoginController" method="post">
							<div class="form-group">
								<label for="email">Email</label> <input type="email"
									class="form-control" id="email" name="user_email"
									placeholder="Enter your Email Id here.">
							</div>
							<div class="mb-3">
								<label for="password" class="form-label">Password</label> <input
									type="password" class="form-control" id="password"
									name="user_password" placeholder="Enter your password here.">
							</div>
							<a href="register.jsp" class="mt-2"> Register Here!</a>
							<div class="container text-center">
								<button type="submit" class="btn btn-primary custom-bg border-0">Submit</button>
								<button type="reset" class="btn btn-primary custom-bg border-0">Reset</button>
							</div>
						</form>
					</div>
					<div class="card-footer"></div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>