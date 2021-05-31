<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>About Us</title>
<%@include file ="components/common_css_js.jsp" %>
</head>
<body>
<%@include file ="components/navbar.jsp" %>
<h1> About Us Page </h1>
	
			
<div class="card" data-bs-toggle="modal"
					data-bs-target="#add-cart-model">
					<div class="card-body text-center">
						<div class="container">
							<img style="max-width: 125px;" class="img-fluid rounded-circle"
								alt="Add Category" src="image/keys.png">
						</div>
						<p class="mt-2">Click here to add New Category.</p>
						<h1 class="text-uppercase text-muted">Add Category</h1>
					</div>
				</div>
				
				
				<li class="nav-item active"><a class="nav-link" href="#!"
					data-bs-toggle="modal"
					data-bs-target="#add-cart-model"><i
						class="fa fa-cart-plus" style="font-size: 20px;"> </i> <span
						class="ml-0 cart-items">( 0 )</span></a></li>


				
			
		
				
</body>
</html>