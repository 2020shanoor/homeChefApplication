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
}