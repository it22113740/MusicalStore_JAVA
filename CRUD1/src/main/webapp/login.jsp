<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	response.sendRedirect("index.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Shopping Cart Login</title>
<%@include file="includes/head.jsp"%>
<!-- Add your CSS styles -->
<style>
      
/* Paste your CSS styles here */
@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;
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

.form-container {
	flex: 1;
	margin-right: 20px;
}

.form-container .card {
	width: 100%;
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
	transition: background-color 0.2s ease-in-out, border-color 0.2s
		ease-in-out;
}

.btn-primary:hover {
	background-color: #5f1a9e;
	border-color: #5f1a9e;
}
.row{
width: 100%;
}
.hidden {
    display: none;
}
.alert {
    background-color: #f44336;
    color: white;
    padding: 10px;
    margin-bottom: 15px;
    border-radius: 5px;
}
</style>
<script>
// JavaScript function to display alert message
function displayAlert(message) {
    var alertDiv = document.getElementById("alert");
    alertDiv.innerHTML = message;
    alertDiv.style.display = "block";
}
</script>
</head>
<body>
<%@include file="includes/navbar.jsp"%>
<div class="container">
    <div class="image-container">
        <img src="product-images/d1.webp" alt="Login Image" class="login-image">
    </div>
    <div class="form-container">
        <div class="card">
            <div class="card-header text-center">User Login</div>
            <div id="alert" class="alert hidden"></div>
            <div class="card-body">
                <form action="user-login" method="post" onsubmit="return validateForm()">
                    <div class="form-group">
                        <label>Email Address</label>
                        <input type="email" class="form-control" name="login-email" placeholder="Enter Your Email" required>
                    </div>
                    <div class="form-group">
                        <label>Password</label>
                        <input type="password" class="form-control" name="login-password" placeholder="*********" required>
                    </div>
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Login</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
<%@include file="includes/footer.jsp"%>

<!-- Hidden alert div -->


<script>
// JavaScript function to validate the form
function validateForm() {
    // You can add more validation here if needed
    return true;
}
</script>

<%
// Check if there's an error message passed from the servlet
String errorMessage = (String) request.getAttribute("errorMessage");
if (errorMessage != null && !errorMessage.isEmpty()) {
    // Display the error message using JavaScript alert
%>
    <script>
        displayAlert("<%= errorMessage %>");
    </script>
<%
}
%>

</body>
</html>

