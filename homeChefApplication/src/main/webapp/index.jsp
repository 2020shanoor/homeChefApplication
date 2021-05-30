<%@page import="com.src.helper.FactoryProvider"%>
<%@page import="org.hibernate.sql.ordering.antlr.Factory"%>
<%@page import="com.src.dao.ProductDAO"%>
<%@page import="com.src.entity.ProductEntity"%>
<%@page import="com.src.dao.CategoryDAO"%>
<%@page import="com.src.entity.CategoryEntity"%>
<%@page import="com.src.helper.Helper"%>
<%@page import="java.util.List"%>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Home Chef Application - HOME</title>
<%@include file="components/common_css_js.jsp"%>
</head>
<body>
	<%@include file="components/navbar.jsp"%>


	<div class="row mt-3 mx-2">
		<%
			ProductDAO pDAO = new ProductDAO(FactoryProvider.getFactory());
			List<ProductEntity> plistData = pDAO.getProduct();
			CategoryDAO cDAO = new CategoryDAO(FactoryProvider.getFactory());
			List<CategoryEntity> clistData = cDAO.getCategories();
		%>

		<!-- Show Categories -->
		<div class="col-md-2">
			<div class="list-group mt-4">
				<a href="#" class="list-group-item list-group-item-action active">
					All Products </a>
				<%
					for (CategoryEntity cList : clistData) {
				%>
				<a href="#" class="list-group-item list-group-item-action"><%=cList.getCategoryTitle()%></a>
				<%
					}
				%>
			</div>

		</div>
		<!-- Show Products -->
		<div class="col-md-8">
			<!-- row -->
			<div class="row mt-4">
				<!-- Col:12 -->
				<div class="col-md-12">
					<div class="card-columns">
						<!-- Traversing Products -->
						<%
							for (ProductEntity p : plistData) {
						%>
						<div class="card" style="width: 18rem;">
							<div class="container text-center">
								<img src="image/productPics/<%=p.getProductPhoto()%>"
									class="card-img-top m-2"
									style="max-height: 220px; max-width: 100%; width: auto;">
							</div>
							<div class="card-body">
								<h5 class="card-title"><%=p.getProductName()%></h5>
								<p class="card-text"><%=Helper.get10Words(p.getProductDesc())%></p>
							</div>

							<div class="card-footer">
								<button class="btn custom-bg text-white ">Add to Cart</button>
								<button class="btn btn-success ">
									&#8377;<%=p.getProductPrice()%></button>
							</div>
						</div>
						<%
							}
						%>
					</div>
				</div>
			</div>
		</div>
	</div>





</body>
</html>