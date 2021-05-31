function add_to_cart(pid, pname, price) {
	let cart = localStorage.getItem("cart");
	if (cart == null) {
		// no cart yet
		let products = [];
		let productEntity = {
			productId : pid,
			productName : pname,
			productQuantity : 1,
			productPrice : price
		};
		products.push(productEntity);

		localStorage.setItem("cart", JSON.stringify(products));
		console.log ("Product is added for the first time.");
	} else {
		
		// cat is already present
		let pcart = JSON.parse(cart);
		let oldProduct = pcart.find((item) => item.productId == pid)
		if(oldProduct){
			// only we have to increase the quantity
			oldProduct.productQuantity = oldProduct.productQuantity+1;
			pcart.map((item) => {
				if(item.productId== oldProduct.productId) {
					item.productQuantity=oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart",  JSON.stringify(pcart));
			console.log ("Product quantity is increased.");
		} else  {
			// we have to add the quantity
			let productEntity = {
					productId : pid,
					productName : pname,
					productQuantity : 1,
					productPrice : price
				};
			pcart.push(productEntity);
			localStorage.setItem("cart",  JSON.stringify(pcart));
			console.log ("Product is added.");
		}
	}
	
	updateCart();
}
	// Update Cart

function updateCart() {
	let cartString = localStorage.getItem("cart");
	let cart  = JSON.parse(cartString);
	if(cartString == null || cartString.length == 0) {
		console.log ("CART IS EMPTY!!");
	$(".cart-items").html("( 0 )");
	$(".cart-body").html("<h3>Cart Does not have any items.</h3>");
	$(".checkout-btn").addClass('disabled');
	} else {
		// There is some thing in cart to show
		console.log (cart);
		$(".cart-items").html(`(${cart.length})`);
		let table =`
		<table class='table'>
		<thead class='thread-light'>
		<tr>
		<th>Item Name</th>
				<th>Item Price</th>
						<th>Item Quantity</th>
								<th>Total Price</th>
										<th>Action</th>
		</tr>
		
		</thead>
		
		
		`;
		cart.map((item)=> {
			table+=`
			<tr>
				<td>${item.productName}</td>
				<td>${item.productPrice}</td>
				<td>${item.productQuantity}</td>
				<td>${item.productQuantity*item.productPrice}</td>
			<td><button class ='btn btn-danger btn-sm'>Remove</button></td>
			</tr>
			
			`
			
		})
			
		table =table+`</table>`	
		$(".cart-body").html(table);
			
			
	}
}


$(document).ready(function() {
	updateCart();	
})

