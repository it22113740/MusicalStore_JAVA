<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Manage Products</title>
<!-- Bootstrap CSS -->
<link
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
	rel="stylesheet">
<style>
/* Add custom styles here if needed */
</style>
</head>
<body>
	<!-- Navigation bar -->
	<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
		<a class="navbar-brand" href="#">Product Management</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="addProduct.jsp">Add Product</a></li>
				<li class="nav-item"><a class="nav-link"
					href="updateProduct.jsp">Update Product</a></li>
				<li class="nav-item"><a class="nav-link"
					href="deleteProduct.jsp">Delete Product</a></li>
					</ul>
				<ul class="navbar-nav ml-right">
                <li class="nav-item">
                    <a class="nav-link" href="addStaff.jsp">Staff Management</a>
                </li>
            </ul>
			
		</div>
	</nav>

	<div class="container mt-4">
		<h2>Add Product</h2>
		<form action="create-ubdate-delete" method="post">
			<input type="hidden" name="action" value="add">
			<div class="form-group">
				<label for="name">Name:</label> <input type="text"
					class="form-control" id="name" name="name" required>
			</div>
			<div class="form-group">
				<label for="category">Category:</label> <input type="text"
					class="form-control" id="category" name="category" required>
			</div>
			<div class="form-group">
				<label for="price">Price:</label> <input type="number"
					class="form-control" id="price" name="price" required>
			</div>
			<div class="form-group">
				<label for="image">Image URL:</label> <input type="text"
					class="form-control" id="image" name="image">
			</div>
			<button type="submit" class="btn btn-primary">Add Product</button>
		</form>
	</div>

	<!-- Bootstrap JS (Optional, if you want to use Bootstrap JavaScript features) -->
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
	<script
		src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>
