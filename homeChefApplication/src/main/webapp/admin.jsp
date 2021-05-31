<%@page import="com.src.entity.UserEntity"%>
<%@page import="com.src.helper.Helper"%>
<%@page import="java.util.Map"%>
<%
	CategoryDAO cDAO = new CategoryDAO(FactoryProvider.getFactory());
	List<CategoryEntity> listData = cDAO.getCategories();
	Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>
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
<style>
body {
	background: #e2e2e2;
}
</style>
<body>
	<%@include file="components/navbar.jsp"%>
	<div class="container admin">
		<div class="container-fluid mt-3">
			<%@include file="components/message.jsp"%>
		</div>

		<div class="row mt-2">
			<!-- First ROW -->
			<div class="col-md-4">
				<!-- First box -->

				<div class="card" data-toggle="tooltip" data-placement="left"
					title="Number of Users in this Website.">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="User" src="image/user.png">
						</div>
						<h1><%=m.get("userCount")%></h1>
						<h1 class="text-uppercase text-muted">Users</h1>
					</div>
				</div>

			</div>
			<!-- Second box -->
			<div class="col-md-4">

				<div class="card" data-toggle="tooltip" data-placement="bottom"
					title="Total Categories.">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="User" src="image/list.png">
						</div>
						<h1><%=listData.size()%></h1>
						<h1 class="text-uppercase text-muted">Categories</h1>
					</div>
				</div>
			</div>
			<!-- Third box -->
			<div class="col-md-4">

				<div class="card" data-toggle="tooltip" data-placement="right"
					title="Total Number of Products.">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="User" src="image/product.png">
						</div>
						<h1><%=m.get("productCount")%></h1>
						<h1 class="text-uppercase text-muted">Products</h1>
					</div>
				</div>
			</div>

		</div>


		<div class="row mt-2">
			<!-- Second Row -->
			<div class="col-md-6">
				<!-- First box -->

				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-category-model">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="Add Category" src="image/keys.png">
						</div>
						<p class="mt-2">Click here to add New Category.</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>

			</div>
			<!-- Second box -->
			<div class="col-md-6">
				<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-product-model">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="Add Product" src="image/plus.png">
						</div>
						<p class="mt-2">Click here to add New Product.</p>
						<h1 class="text-uppercase text-muted">Add Product</h1>
					</div>
				</div>
			</div>
		</div>
		<!-- View Products Row -->
		<div class="row mt-3">
			<div class="col-md-12">
				<!-- First box -->

				<div onclick = "window.location='viewProducts.jsp'" class="card">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="View Products" src="image/view.png">
						</div>
						<p class="mt-2">Click here to View All the Products.</p>
						<h1 class="text-uppercase text-muted">View Products</h1>
					</div>
				</div>

			</div>

		</div>


	</div>
	<!-- Add Category -->
	<%@include file="addCategory.jsp"%>
	<%@include file="addProducts.jsp"%>
	<%@include file="components/common_modals.jsp"%>
	<script>
		$(function() {
			$('[data-toggle="tooltip"]').tooltip()
		})
	</script>
	<!-- End Category -->
</body>
</html>