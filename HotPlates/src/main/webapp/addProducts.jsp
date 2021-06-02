<!-- Modal -->

<%@page import="com.src.helper.FactoryProvider"%>
<div class="modal fade" id="add-product-model" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white">
				<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="adminAddProductCategory" method="post"
					enctype="multipart/form-data">
					<input type="hidden" value="addproduct" name="operation">
					<div class="form-group mt-2">
						Enter Product Name: <input type="text" name="product_name"
							placeholder="Please enter Product Name." class="form-control"
							required>
					</div>
					<div class="form-group mt-2">
						Enter Product Description:
						<textarea name="product_desc" style="height: 200px;"
							placeholder="Please enter your product description."
							class="form-control" required></textarea>
					</div>

					<div class="form-group mt-2">
						Enter Product Price: <input type="number" name="product_price"
							placeholder="Please enter the product price."
							class="form-control" required>
					</div>

					<div class="form-group mt-2">
						Enter Product Discount: <input type="number"
							name="product_discount"
							placeholder="Please enter the product discount."
							class="form-control">
					</div>

					<div class="form-group mt-2">
						Enter Product Quantity: <input type="number"
							name="product_quantity"
							placeholder="Please enter Product Quantity" class="form-control"
							required>
					</div>

					<%@page import="com.src.dao.CategoryDAO"%>
					<%@page import="com.src.entity.CategoryEntity"%>
					<%@page import="java.util.List"%>


					<div class="form-group mt-2">
						<label for="category">Enter Product Category:</label> <select
							name="choose_category" class="form-control" required
							id="category" size="1">
							<%
								for (CategoryEntity cList : listData) {
							%>
							<option value="<%=cList.getCategoryId()%>">
								<%=cList.getCategoryTitle()%>
							</option>
							<%
								}
							%>
						</select>
					</div>

					<div class="form-group mt-3">
						<label for="product_id">Upload the Product Picture: </label> <br />
						<input type="file" name="product_photo" required id="product_id">
					</div>

					<div class="container text-center mt-2">
						<button type="submit" class="btn btn-outline-success">Add
							Products</button>
						<button type="button" class="btn btn-secondary data-dismiss="modal">Close
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>