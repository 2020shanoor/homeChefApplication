<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link
	href="//maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	rel="stylesheet" id="bootstrap-css">
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
<script>
function handleClick(cb) {
	  alert("hi");
	}
</script>
</head>
 <body>
 
      <form action="homeController" method="post">
	<div class="container text-center mt-2">
		<div class="row">
			<div class="col-md-12">
				<div class="card" style="margin: 60px 0">
					<!-- Default panel contents -->
					<div class="card-header">Love to Eat or Cook ?</div>

					<ul class="list-group list-group-flush">
						<li class="list-group-item">Home Chef<label class="switch">
								<input type="checkbox" name="names" onclick='handleClick(this);' class="success" value="chef"> <span
								class="slider round"></span>
						</label> <label class="switch"><input type="checkbox" name="names" value="foodie">Foodie</label>

						</li>
					</ul>
				</div>
			</div>
		</div>
	</div>
</form>

</body>
</html>
