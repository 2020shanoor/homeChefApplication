<!-- Modal -->
<div class="modal fade" id="add-product-model" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white">
				<h5 class="modal-title" id="exampleModalLabel">Add Product</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
			<input type="hidden" value="addProduct" name="addProdCatOperation" >
				<form>
					<div class="form-group">
						Enter Product Name: <input type="text" name="product_name"
							placeholder="Please enter Product Name." class="form-control"
							required="required">
					</div>
					<div class="form-group">
						Enter Product Description:
						<textarea name="product_desc" style="height: 300px;"
							placeholder="Please enter Product Description."
							class="form-control" required="required"></textarea>
					</div>

					<div class="form-group">
						Enter Product Photo: <input type="text" name="product_photo"
							placeholder="Please enter Product Photo." class="form-control"
							required="required">
					</div>

					<div class="form-group">
						Enter Product Price: <input type="text" name="product_price"
							placeholder="Please enter Product Price." class="form-control"
							required="required">
					</div>

					<div class="form-group">
						Enter Product Discount: <input type="text" name="product_discount"
							placeholder="Please enter Product Discount." class="form-control">
					</div>

					<div class="form-group">
						Enter Product Quantity: <input type="text" name="product_quantity"
							placeholder="Please enter Product Quantity" class="form-control"
							required="required">
					</div>
					<div class="form-group">
						<label for="choose_category">Enter Product Category</label> <select  
						name="choose_category" class="form-control"
							required="required"
							id="category" name="cars" size="1">
							<option value="#">Please choose Product Category</option>
							<option value="volvo">Volvo</option>
							<option value="saab">Saab</option>
							<option value="fiat">Fiat</option>
							<option value="audi">Audi</option>
						</select><br>
					</div>


					<div class="container text-center mt-2">
						<button type="button" class="btn btn-outline-success">Add
							Products</button>
						<button type="button" class="btn btn-secondary ">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>