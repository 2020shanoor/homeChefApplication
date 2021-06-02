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
<%@include file="components/common_css_js.jsp"%>
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
</body>

</html>
