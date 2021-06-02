<%@page import="com.src.entity.UserEntity"%>
<%@page import="com.src.helper.Helper"%>
<%@page import="java.util.Map"%>
<%@page import="com.src.dao.CategoryDAO"%>
<%@page import="com.src.entity.CategoryEntity"%>
<%@page import="java.util.*"%>
<%@page import="com.src.helper.FactoryProvider"%>
<%
	CategoryDAO cDAO = new CategoryDAO(FactoryProvider.getFactory());
	List<CategoryEntity> listData = cDAO.getCategories();
	Map<String, Long> m = Helper.getCounts(FactoryProvider.getFactory());
%>




<!DOCTYPE html>
<html>

<head>
<title>HOME CHEF - HOME</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script
	src="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>

/* The switch - the box around the slider */
.switch {
	position: relative;
	display: inline-block;
	width: 80px;
	height: 35px;
	float: center;
}

/* Hide default HTML checkbox */
.switch input {
	display: none;
}

/* The slider */
.slider {
	position: absolute;
	cursor: pointer;
	top: 0;
	left: 0;
	right: 0;
	bottom: 0;
	background-color: pink;
	-webkit-transition: .4s;
	transition: .4s;
}

.slider:before {
	position: absolute;
	content: "";
	height: 26px;
	width: 26px;
	left: 4px;
	bottom: 4px;
	background-color: white;
	-webkit-transition: .4s;
	transition: .4s;
}

input.default:checked+.slider {
	background-color: #444;
}

input.primary:checked+.slider {
	background-color: #2196F3;
}

input.success:checked+.slider {
	background-color: #8bc34a;
}

input.info:checked+.slider {
	background-color: #3de0f5;
}

input.warning:checked+.slider {
	background-color: #FFC107;
}

input.danger:checked+.slider {
	background-color: #f44336;
}

input:focus+.slider {
	box-shadow: 0 0 1px #2196F3;
}

input:checked+.slider:before {
	-webkit-transform: translateX(26px);
	-ms-transform: translateX(26px);
	transform: translateX(46px);
}

/* Rounded sliders */
.slider.round {
	border-radius: 34px;
}

.slider.round:before {
	border-radius: 50%;
}
</style>
</script>
<style type="text/css">
.selectt {
	color: #fff;
	padding: 30px;
	display: none;
	margin-top: 30px;
	width: 80%;
	background: green
}

label {
	margin-right: 20px;
}
</style>
<%@include file="components/common_css_js.jsp"%>
<style>
body {
	background: #e2e2e2;
}
</style>
</head>

<body>
	<%@include file="components/navbar.jsp"%>
	<center>
		<h1 style="color: green;">Welcome To Home Chef</h1>


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

		</div>
		</div>
		<div class="container text-center mt-2">
			<div class="row">
				<div class="col-md-12">
					<div class="card" style="margin: 60px 0">
						<!-- Default panel contents -->
						<div class="card-header">Love to Eat or Cook ?</div>

						<ul class="list-group list-group-flush">
							<li class="list-group-item">Foodie <label class="switch"><input
									type="checkbox" name="colorCheckbox" class="success"
									value="Cplus"> <span class="slider round"></span> </label> <label
								class="switch"><input type="checkbox"
									name="colorCheckbox" value="C">Home Chef</label>

							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>


		<div class="C selectt">
			<div class="row">
				<div class="column" style="background-color: #aaa;">
					<jsp:include page="aboutUs.jsp" flush="true"/>
				</div></div>
		</div>
		<div class="Cplus selectt">
			<div class="row">
				<div class="column" style="background-color: #aaa;">
					<jsp:include page="index.jsp" flush="true"/>
				</div></div>
			</div>

			<script type="text/javascript">
				$(document).ready(function() {
					$('input[type="checkbox"]').click(function() {
						var inputValue = $(this).attr("value");
						$("." + inputValue).toggle();
					});
				});
			</script>
	</center>
</body>

</html>
