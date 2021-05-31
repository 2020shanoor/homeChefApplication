
<%
	UserEntity user = (UserEntity) session.getAttribute("current-user");
	if (user == null) {
		session.setAttribute("message", "Please Login to Checkout!");
		response.sendRedirect("login.jsp");
		return;
	} else {

	}
%>



<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>HOME CHEF- CHECKOUT</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>


	<div class="container">
		<div class="row mt-5">
			<div class="col-md-6">
				<!-- Cart details -->
				<div class="card">
					<div class="card-body">
						<h1 class="text-center mb-3">Your Selected Items</h1>
						<div class="cart-body"></div>
					</div>
				</div>
			</div>
			<div class="col-md-6"></div>
			<!-- Form Details -->
			<div class="card">
				<div class="card-body">
					<h1 class="text-center mb-3">Your Details for Order</h1>
					<form action="#!">
						<div class="form-group">
							<label for="exampleInputEmail1">Email Address</label> <input
								value="<%=user.getUserName()%>" type="email"
								class="form-control" id="email" name="user_email"
								aria-describedby="emailHelp" placeholder="Enter Email Address">
						</div>
						
						<div class="form-group">
							<label for="exampleInputEmail1">Phone Number</label> <input
								value="<%=user.getUserPhone()%>" type="phone"
								class="form-control" id="phone" name="user_phone"
								aria-describedby="phoneHelp" placeholder="Enter Phone Number">
						</div>
						
						
						<div class="form-group">
							<label for="exampleInputEmail1">Your Name</label> <input
								type="text" class="form-control" id="name"
								value="<%=user.getUserEmail()%>" aria-describedby="emailHelp"
								placeholder="Enter Email Id">
						</div>

						<div class="form-group">
							<label for="address">Your Shipping Address</label>
							<textarea class="form-control" id="address" name="user_address"
								value="<%=user.getUserAddress()%>"
								placeholder="Enter Your Address">
								</textarea>
						</div>
						<div class="container text-center">
							<button class="btn btn-outline-success">Order Now</button>
							<button class="btn btn-outline-primary">Continue
								Shopping</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="components/common_modals.jsp"%>
</body>
</html>