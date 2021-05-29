<%@page import="com.src.entity.UserEntity"%>
<%
	UserEntity user = (UserEntity) session.getAttribute("current-user");
	if (user == null) {
		session.setAttribute("message", "You are not loggedin yet. Login First!");
		response.sendRedirect("login.jsp");
		return;
	} else {
		if (user.getUserType().equals("user")) {
			session.setAttribute("message", "You are not Admin, You dont have access !!");
			response.sendRedirect("login.jsp");
		}
	}
%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Chef- ADMIN</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container">

		<div class="row mt-2">
			<!-- First ROW -->
			<div class="col-md-4">
				<!-- First box -->

				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="User" src="image/user.png">
						</div>
						<h1>1231</h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>

			</div>
			<!-- Second box -->
			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="User" src="image/list.png">
						</div>
						<h1>4564</h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<!-- Third box -->
			<div class="col-md-4">

				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="User" src="image/product.png">
						</div>
						<h1>5751</h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>

		</div>


		<div class="row mt-2">
			<!-- Second Row -->
			<div class="col-md-6">
				<!-- First box -->

				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="User" src="image/keys.png">
						</div>
						<p class="mt-2">Click here to add New Category</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>

			</div>
			<!-- Second box -->
			<div class="col-md-6">
				<div class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="User" src="image/plus.png">
						</div>
						<p class="mt-2">Click here to add New Category</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
	</div>


</body>
</html>