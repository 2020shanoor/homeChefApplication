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

	<div class="container-fluid">
		<div class="row mt-3 mx-2">
			<%
				String cat = request.getParameter("categoryEntity");
				ProductDAO pDAO = new ProductDAO(FactoryProvider.getFactory());
				List<ProductEntity> list = null;

				if (cat == null || cat.trim().equals("all")) {
					list = pDAO.getAllProduct();
				} else {
					int cid = Integer.parseInt(cat.trim());
					list = pDAO.getAllProductById(cid);
				}

				CategoryDAO cDAO = new CategoryDAO(FactoryProvider.getFactory());
				List<CategoryEntity> clistData = cDAO.getCategories();
			%>

			<!-- Show Categories -->
			<div class="col-md-2">
				<div class="list-group mt-4">
					<a href="index.jsp?categoryEntity=all"
						class="list-group-item list-group-item-action active"> All
						Products </a>
					<%
						for (CategoryEntity cList : clistData) {
					%>
					<a href="index.jsp?categoryEntity=<%=cList.getCategoryId()%>"
						class="list-group-item list-group-item-action "><%=cList.getCategoryTitle()%></a>
					<%
						}
					%>
				</div>

			</div>
			<!-- Show Products -->
			<div class="col-md-10">
				<!-- row -->
				<div class="row mt-4">
					<!-- Col:12 -->
					<div class="col-md-12">
						<div class="card-columns">
							<!-- Traversing Products -->
							<%
								for (ProductEntity p : list) {
							%>

							<!--  Product Card -->
							<div class="card product-card" style="width: 18rem;">
								<div class="container text-center">
									<img src="image/productPics/<%=p.getProductPhoto()%>"
										class="card-img-top m-2"
										style="max-height: 220px; max-width: 100%; width: auto;">
								</div>

								<div class="card-body">
									<h5 class="card-title"><%=p.getProductName()%></h5>
									<p class="card-text"><%=Helper.get10Words(p.getProductDesc())%></p>
								</div>

								<div class="card-footer text-center">
									<button class="btn custom-bg text-white" onclick="add_to_cart(<%=p.getProductId()%>,'<%=p.getProductName()%>',<%=p.getPriceAfterApplyingDiscount()%>)">Add to Cart</button>
									<button class="btn btn-success">
										&#8377;<%=p.getPriceAfterApplyingDiscount()%>/- <span
											class="text-white discount-label-for-mrp">&#8377;<%=p.getProductPrice()%>,
										</span><span class="text-white discount-label"> <%=p.getProductDiscount()%>%Off
										</span>
									</button>
								</div>
							</div>
							<%
								}
								if (list.size() == 0) {
									out.println("<h3>No Items in this Category.</h3>");
								}
							%>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
<%@include file ="components/common_modals.jsp" %>
</body>
</html>