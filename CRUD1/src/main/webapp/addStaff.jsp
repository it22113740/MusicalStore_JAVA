<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Staff</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;
	body {
    background-image: url('product-images/d1.webp'); /* Replace 'path/to/your/image.jpg' with the actual path to your image */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed; /* This ensures the background image remains fixed while scrolling */
  }
/* Custom CSS for product card */
.product-card {
	height: 100%;
}

.product-card .card-img-top {
	height: 200px; /* Adjust height as needed */
	object-fit: cover; /* Ensure the image covers the entire space */
}

.product-card .card-body {
	height: 100%;
}

.product-card .price, .product-card .category {
	margin-bottom: 10px;
}
/* Import Google font - Poppins */
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}
/* Add your custom CSS styles */
.container {
	padding: 20px;
}

.card-header {
	background-color: #7d2ae8;
	color: #fff;
	border-radius: 12px 12px 0 0;
	padding: 10px 20px;
	margin-bottom: 20px;
}

.row {
	margin-left: -15px;
	margin-right: -15px;
}

.col-md-3 {
	flex: 0 0 25%;
	max-width: 25%;
	padding-left: 15px;
	padding-right: 15px;
}

.product-card .card-body {
	padding: 15px;
}

.price {
	font-size: 16px;
	color: #333;
}

.category {
	font-size: 14px;
	color: #666;
}

.btn-dark, .btn-primary {
	padding: 10px 20px;
	font-size: 14px;
	border-radius: 6px;
	margin-top: 10px;
	transition: background-color 0.2s ease-in-out, border-color 0.2s
		ease-in-out;
}

.btn-dark {
	background-color: #333;
	border-color: #333;
	color: #fff;
}

.btn-dark:hover {
	background-color: #222;
	border-color: #222;
}

.btn-primary {
	background-color: #7d2ae8;
	border-color: #7d2ae8;
	color: #fff;
}

.btn-primary:hover {
	background-color: #5f1a9e;
	border-color: #5f1a9e;
}
</style>
</head>
<body>
	<!-- Navigation bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="addStaff.jsp">Staff Management</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="addStaff.jsp">Add Staff</a></li>
				<li class="nav-item"><a class="nav-link" href="ubdateStaff.jsp">Update
						Staff</a></li>
				<li class="nav-item"><a class="nav-link" href="deleteStaff.jsp">Delete
						Staff</a></li>
			</ul>
			<ul class="navbar-nav ml-right">
				<li class="nav-item"><a class="nav-link" href="addProduct.jsp">Product
						Management</a></li>
			</ul>
		</div>
	</nav>

	<div class="container mt-4">
		<h2>Add Staff</h2>
		<div class="card w-50 mx-auto my-5">
			<div class="card-header text-center">Add Staff</div>
			<div class="card-body">
				<form action="create-ubdate-delete-staff" method="post" onsubmit="return validateForm()">
					<input type="hidden" name="action" value="add">
					<div class="form-group">
						<label for="name">Name:</label> <input type="text"
							class="form-control" id="name" name="name" required>
					</div>
					<div class="form-group">
						<label for="department">Department:</label> <input type="text"
							class="form-control" id="department" name="department" required>
					</div>
					<div class="form-group">
						<label for="contactNumber">Contact Number:</label> <input type="text" class="form-control" id="contactNumber" name="contactNumber" required>
						<small id="contactNumberError" class="form-text text-danger d-none">Contact number must be 10 digits long.</small>
					</div>
					<button type="submit" class="btn btn-primary">Add Staff</button>
				</form>
			</div>
		</div>
	</div>
	</div>

	<!-- Bootstrap JS (Optional, if you want to use Bootstrap JavaScript features) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
		<script>
    function validateForm() {
        var contactNumber = document.getElementById("contactNumber").value;
        if (contactNumber.length !== 10 || !contactNumber.startsWith("07")) {
            document.getElementById("contactNumberError").classList.remove("d-none");
            return false; // Prevent form submission
        }
        return true; // Allow form submission
    }
</script>

</body>
</html>