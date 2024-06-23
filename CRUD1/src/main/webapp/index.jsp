<%@page import="java.util.*"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.sql.Connection"%>
<%@page import="connection.DbCon"%>
<%@page import="model.*"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Welcome to JAZZ Music</title>
<%@include file="includes/head.jsp"%>
<style>

@import
	url("https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&display=swap")
	;
	        footer {
            bottom: 0;
            width: 100%;
            background-color: #000;
            color: #fff;
            padding: 20px;
        }
body {
    /*background-image: url('product-images/bg.jpg'); /* Replace 'path/to/your/image.jpg' with the actual path to your image */
    background-size: cover;
    background-repeat: no-repeat;
    background-attachment: fixed; /* This ensures the background image remains fixed while scrolling */
    position: relative;
  }

* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
	font-family: "Poppins", sans-serif;
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
.con{
margin-bottom: 20px;
}
.rows{
    display:flex;
    align-items: center;
    flex-wrap: wrap;
    justify-content: space-around;
}
.col-2{
    flex-basis: 50%;
    min-width: 300px;
    padding-left: 30px;
}
.col-2 img{
    max-width: 180%;
    padding: 50px 0;
}
.col-2 h1{
    font-size: 50px;
    line-height: 60px;
    margin: 25px 0;
    color:White;
}
.containers{
    max-width: 1300px;
    margin: auto;
    padding-left: 25px;
    padding-right: 25px;
}
.btns{
    display: inline-block;
    background: rgba(209,16,11,255);
    color: #fff;
    padding: 8px 30px;
    margin: 30px 0;
    border-radius:30px;
    transition: background 0.5s;
}
.btns:hover{
    background: #563434;
}
.header{
    background:radial-gradient(black,black);
}
.header .rows{
    margin-top: 70px;
}
.product-card {
    transition: transform 0.3s ease;
}

.product-card:hover {
    transform: scale(1.05);
}
</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
<div class="header">
        <div class="containers">
            <div class="navbar">
                <div class="rows">
                    <div class="col-2">
                        <h1>Music Unite <br>Hearts</h1>
                        <p></p>
                        <a href="#" class="btns">Explore Now &#8594;</a>
                    </div>
                    <div class="col-2">
                        <img src="product-images/gbg.avif" alt="">
                    </div>
                </div>
            </div>
        </div>
    </div>
	<div class="container">
		<div class="card-header my-3">All Products</div>
		<div class="row">
			<%
			if (!products.isEmpty()) {
				for (Product p : products) {
			%>
			<div class="col-md-3 my-3">
				<div class="card product-card">
					<img class="card-img-top" src="product-images/<%=p.getImage()%>"
						alt="Product Image">
					<div class="card-body">
						<h5 class="card-title"><%=p.getName()%></h5>
						<h5 class="price">
							Price:
							<%=p.getPrice()%></h5>
						<h5 class="category">
							Category:
							<%=p.getCategory()%></h5>
<div class="mt-3 d-flex justify-content-between">
    <a href="add-to-cart?id=<%=p.getId()%>" class="btn btn-dark mr-2">Add to Cart</a>
    <a href="order-now?quantity=1&id=<%=p.getId()%>" class="btn btn-primary">Buy Now</a>
</div>

					</div>
				</div>
			</div>
			<%
			}
			}
			%>
		</div>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>
