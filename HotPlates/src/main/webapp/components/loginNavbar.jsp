<%@page import="com.src.entity.UserEntity"%>
<%
	UserEntity user1 = (UserEntity) session.getAttribute("current-user");
%>
	

<nav class="navbar navbar-expand-lg navbar-dark bg-light custom-bg">
	<div class="container">
		<a class="navbar-brand" href="index.jsp"> Home Chef</a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse"
			data-bs-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">AboutUs</a></li>
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">MyOrders</a></li>
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">MySubscription</a></li>
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">Notifications</a></li>
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">ContactUs</a></li>
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">TermsOfUse</a></li>
					<li class="nav-item"><a class="nav-link active"
					aria-current="page" href="#">PrivacyPolicy</a></li>
			</ul>
			<ul class="navbar-nav ml-auto">


				<li class="nav-item active"><a class="nav-link" href="#!"
					data-bs-toggle="modal"
					data-bs-target="#add-cart-model"><i
						class="fa fa-cart-plus" style="font-size: 20px;"> </i> <span
						class="ml-0 cart-items">( 0 )</span></a></li>



				<%
					if (user1 == null) {
				%>
				<li class="nav-item active"><a class="nav-link"
					href="login.jsp">Login</a></li>
				<li class="nav-item active"><a class="nav-link"
					href="register.jsp">Registration</a></li>
				<%
					} else {
				%>
				<li class="nav-item active"><a class="nav-link" href="<%= user1.getUserType().equals("admin") ? "admin.jsp" : "normalUser.jsp" %>"><%=user1.getUserName()%></a></li>
				<li class="nav-item active"><a class="nav-link"
					href="userLogoutController">Logout</a></li>
				<%
					}
				%>


			</ul>
		</div>
	</div>
</nav>
<%@include file ="common_modals.jsp" %>