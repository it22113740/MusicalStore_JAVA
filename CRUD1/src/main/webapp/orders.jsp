<%@page import="connection.DbCon"%>
<%@page import="dao.OrderDao"%>
<%@page import="java.text.DecimalFormat"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="model.*"%>
<%
DecimalFormat dcf = new DecimalFormat("#.##");

request.setAttribute("dcf", dcf);

User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth != null) {
	request.setAttribute("auth", auth);
	orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
} else {
	response.sendRedirect("login.jsp");
}
ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");

if (cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}
%>
<!DOCTYPE html>
<html>
<head>
<title>Orders Page</title>
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
		<div class="card-header my-3">All Orders</div>
		<table class="table table-light">
			<thead>
				<tr>
					<th scope="col">Date</th>
					<th scope="col">Name</th>
					<th scope="col">Category</th>
					<th scope="col">Quantity</th>
					<th scope="col">Price</th>
					<th scope="col">Cancel</th>
				</tr>
			</thead>
			<tbody>
				<%
				if (orders != null) {
					for (Order o : orders) {
				%>
				<tr>
					<td><%=o.getDate()%></td>
					<td><%=o.getName()%></td>
					<td><%=o.getCategory()%></td>
					<td><%=o.getQuantity()%></td>
					<td><%=dcf.format(o.getPrice())%></td>
					<td><a class="btn btn-sm btn-danger"
						href="cancel-order?id=<%=o.getOrderId()%>">Cancel</a></td>
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