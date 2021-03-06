<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Chef - New User Registration</title>
<%@include file="components/common_css_js.jsp"%>

</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container-fluid">
		<div class="row mt-3">
			<div class="col-md-4 offset-md-4">
			
				<div class="card">
				<%@include file="components/message.jsp"%>
					<div class="card-body px-5">
						<center>
							<img src="image/register.png" height="80" width="80">
						</center>
						<h3 class="text-center my-3">Sign up Here !!</h3>
						<form action="userRegisterController" method="post">
							<div class="form-group mt-2">
								<label for="username">Name</label> <input type="text"
									class="form-control" id="username" name="user_name"
									placeholder="Enter your username here.">
							</div>

							<div class="form-group mt-2">
								<label for="email">Email Id</label> <input type="email"
									class="form-control" id="email" name="user_email"
									placeholder="Enter your Email Id here.">
							</div>

							<div class="form-group mt-2">
								<label for="password">Password</label> <input type="password"
									class="form-control" id="password" name="user_password"
									placeholder="Enter your password here.">
							</div>

							<div class="form-group mt-2">
								<label for="phone">Phone Number</label> <input type="number"
									class="form-control" id="phone" name="user_phone"
									placeholder="Enter your phone number here.">
							</div>

							<div class="form-group mt-2">
								<label for="address">Address</label>
								<textarea style="height: 120px;" class="form-control"
									id="address" name="user_address" 
									placeholder="Enter your address here.">
								</textarea>
							</div>

							<div class="form-group mt-2">
								<label for="usertype">Type</label> <select name="user_type"
									id="user_type" class="form-control" >
									<option value="user">Normal User</option>
									<option value="admin">Admin</option>
								</select>
							</div>
							<div class="container text-center mt-2">
								<button type="submit" class="btn btn-outline-success">Register</button>
								<button type="reset" class="btn btn-outline-warning">Reset</button>
							</div>
						</form>

					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
