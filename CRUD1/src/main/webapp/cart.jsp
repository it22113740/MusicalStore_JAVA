<%@page import="java.text.DecimalFormat"%>
<%@page import="connection.DbCon"%>
<%@page import="dao.ProductDao"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");

request.setAttribute("dcf", dcf);

User auth = (User) request.getSession().getAttribute("auth");
if (auth != null) {
	request.setAttribute("auth", auth);
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

List<Cart> cartProduct = null;
if (cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Cart Page</title>
<%@include file="includes/head.jsp"%>
<style>
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

.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
/* Custom CSS for cart page */
.container {
	padding: 20px;
}

.py-3 {
	padding-top: 1rem;
	padding-bottom: 1rem;
}

.table {
	width: 100%;
	margin-bottom: 1rem;
	color: #212529;
}

.table th, .table td {
	padding: 0.75rem;
	vertical-align: top;
	 border-top: 1px solid #dee2e6;
}

.table thead th {
	vertical-align: bottom;
	border-bottom: 2px solid #dee2e6;
}

 .table tbody+tbody {
	border-top: 2px solid #dee2e6;
}

.table-sm th, .table-sm td {
	padding: 0.3rem;
}

.table-bordered {
	border: 1px solid #dee2e6;
}

.table-bordered th, .table-bordered td {
	border: 1px solid #dee2e6;
}

.table-bordered thead th, .table-bordered thead td {
	border-bottom-width: 2px;
}

.btn-primary {
	color: #fff;
	background-color: #007bff;
	border-color: #007bff;
}

.btn-primary:hover {
	color: #fff;
	background-color: #0069d9;
	border-color: #0062cc;
}

.btn-danger {
	color: #fff;
	background-color: #dc3545;
	border-color: #dc3545;
}

.btn-danger:hover {
	color: #fff;
	background-color: #c82333;
	border-color: #bd2130;
}
</style>
</head>
<body>

	<%@include file="includes/navbar.jsp"%>

	<div class="container">
		<div class="d-flex py-3">
			<h3>Total Price: $ ${ (total>0)?dcf.format(total):0 }</h3>
			<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
		</div>
		<table class="table table-bordered">
			<thead>
				<tr>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Price</th>
					<th scope="col">Buy Now</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (cart_list != null) {
					for (Cart c : cartProduct) {
				%>
				<tr>
					<td><%=c.getName()%></td>
					<td><%=c.getCategory()%></td>
					<td><%=dcf.format(c.getPrice())%></td>
					<td>
						<form action="order-now" method="post" class="form-inline">
							<input type="hidden" name="id" value="<%=c.getId()%>"
								class="form-input">
							<div class="form-group d-flex justify-content-between w-50">
								<a class="btn btn-sm btn-decre"
									href="quantity-inc-dec?action=dec&id=<%=c.getId()%>"><i
									class="fas fa-minus-square"></i></a> <input type="text"
									name="quantity" class="form-control w-50"
									value="<%=c.getQuantity()%>" readonly> <a
									class="btn btn-sm btn-incre"
									href="quantity-inc-dec?action=inc&id=<%=c.getId()%>"><i
									class="fas fa-plus-square"></i></a>
							</div>
							<button type="submit" class="btn btn-primary btn-sm">Buy</button>
						</form>
					</td>
					<td><a class="btn btn-sm btn-danger"
						href="remove-from-cart?id=<%=c.getId()%>">Remove</a></td>
				</tr>
				<%
				}

				}
				%>
			</tbody>
		</table>
	</div>

	<%@include file="includes/footer.jsp"%>
</body>
</html>
