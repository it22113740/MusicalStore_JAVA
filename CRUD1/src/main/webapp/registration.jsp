<%@page import="model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration Form</title>
<%@include file="includes/head.jsp"%>
<style>

/* Paste your CSS styles here */
/* Import Google font - Poppins */
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;
        .row{
width: 100%;
}
footer {
            position: fixed;
            bottom: 0;
            width: 100%;
            background-color: #000;
            color: #fff;
        }
        

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
}

.container {
	padding: 20px;
	display: flex;
	justify-content: center;
	align-items: center;
	flex-wrap: wrap;
}

.image-container {
	flex: 1;
	display: flex;
	justify-content: center;
	align-items: center;
}

.image-container img {
	max-width: 100%;
	max-height: 100%;
}

.form-container {
	flex: 1;
	margin-left: 20px; /* Adjust margin to create space between image and form */
}

/* Add your custom CSS styles */
.card {
	border: 1px solid #ccc; /* Added simple border */
	border-radius: 12px;
	box-shadow: rgba(0, 0, 0, 0.1);
}

.card-header {
	background-color: #7d2ae8;
	color: #fff;
	border-radius: 12px 12px 0 0;
}

.card-body {
	background-color: #fff;
}

.form-group {
	margin-bottom: 20px;
}

.form-control {
	height: 40px;
	border-radius: 6px;
	border: 1px solid #ccc;
	padding: 0 15px;
	transition: border-color 0.2s ease-in-out;
}

.form-control:focus {
	border-color: #7d2ae8;
}

.btn-primary {
	background-color: #7d2ae8;
	border-color: #7d2ae8;
	border-radius: 6px;
	padding: 10px 20px;
	font-size: 16px;
	color: #fff;
	cursor: pointer;
	transition: background-color 0.2s ease-in-out, border-color 0.2s ease-in-out;
}

.btn-primary:hover {
	background-color: #5f1a9e;
	border-color: #5f1a9e;
}
.alert {
  position: fixed;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  padding: 15px 20px;
  background-color: #f44336; /* Red background color */
  color: white;
  border-radius: 5px;
  box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2); /* Box shadow */
}

.alert.hidden {
  display: none; /* Hide the alert by default */
}

</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<div class="image-container">
			<img src="product-images/d1.webp" alt="Login Image" class="login-image">
		</div>
		<div class="form-container">
			<div class="card w-100"> <!-- Adjust card width to 100% -->
				<div class="card-header text-center">Registration Form</div>
				<div class="card-body">
					<form action="user-registration" method="post" class="mt-4">
						<div class="form-group">
							<label for="name">Name:</label>
							<input type="text" id="name" name="name" class="form-control" placeholder="Enter Your Name" required>
						</div>
						<div class="form-group">
							<label for="email">Email:</label>
							<input type="email" id="email" name="email" class="form-control" placeholder="Enter Your Email"required>
						</div>
						<div class="form-group">
							<label for="password">Password:</label>
							<input type="password" id="password" name="password" class="form-control" placeholder="***********" required>
						</div>
						<button type="submit" class="btn btn-primary">Register</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@include file="includes/footer.jsp"%>
	 <script>
    // Get the value of the 'error' parameter from the URL
    const urlParams = new URLSearchParams(window.location.search);
    const error = urlParams.get('error');

    // If the 'error' parameter is present and equals 'email_exists', display an alert
    if (error === 'email_exists') {
        const alertBox = document.createElement('div');
        alertBox.classList.add('alert');
        alertBox.textContent = 'Email already exists. Please use a different email.';
        document.body.appendChild(alertBox);

        // Hide the alert after a certain duration (e.g., 5 seconds)
        setTimeout(() => {
            alertBox.classList.add('hidden');
        }, 5000); // Adjust the duration as needed
    }
</script>
</body>
</html>
