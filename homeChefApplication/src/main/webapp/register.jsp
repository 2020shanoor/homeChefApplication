<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>New User Registration</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
			
				<div class="card">
				<%@include file="successRegister.jsp"%>
					<div class="card-body px-5">
						<center>
							<img src="image/register.png" height="80" width="80">
						</center>
						<h3 class="text-center my-3">Sign up Here !!</h3>
						<form action="userRegisterController" method="post">
							<div class="form-group">
								<label for="username">User Name</label> <input type="text"
									class="form-control" id="username" name="user_name"
									placeholder="Enter your username here.">
							</div>

							<div class="form-group">
								<label for="email">Email</label> <input type="email"
									class="form-control" id="email" name="user_email"
									placeholder="Enter your EmailId here.">
							</div>

							<div class="form-group">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="user_password"
									placeholder="Enter your password here.">
							</div>

							<div class="form-group">
								<label for="phone">Phone Number</label> <input type="number"
									class="form-control" id="phone" name="user_phone"
									placeholder="Enter your phone number here.">
							</div>

							<div class="form-group">
								<label for="address">Address</label>
								<textarea style="height: 120px;" class="form-control"
									id="address" name="user_address"
									placeholder="Enter your address here.">
								</textarea>
							</div>

							<div class="form-group">
								<label for="usertype">Type</label> <select name="user_type"
									id="user_type">
									<option value="user">User</option>
									<option value="admin">Admin</option>
								</select>
							</div>
							<hr />
							<div class="container text-center">
								<button class="btn btn-outline-success">Register</button>
								<button class="btn btn-outline-warning">Reset</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
