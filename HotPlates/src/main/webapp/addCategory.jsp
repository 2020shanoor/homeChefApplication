<!-- Modal -->
<div class="modal fade" id="add-category-model" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header custom-bg text-white">
				<h5 class="modal-title" id="exampleModalLabel">Fill Category Details</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal"
					aria-label="Close"></button>
			</div>
			<div class="modal-body">
				<form action="adminAddProductCategory" method="post">
				<input type="hidden" value="addCategory" name="operation" >
					<div class="form-group">
						Enter Category Title: <input type="text" name="category_title"
							placeholder="Please enter Category Title." class="form-control"
							required>
					</div>
					<div class="form-group">
						Enter Category Description:
						<textarea name="category_desc" style="height: 200px;"
							placeholder="Please enter Category Description."
							class="form-control" required></textarea>
					</div>
					<div class="container text-center mt-2">
						<button type="submit" class="btn btn-outline-success">Add
							Category</button>
						<button type="submit" class="btn btn-secondary ">Close</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
</div>