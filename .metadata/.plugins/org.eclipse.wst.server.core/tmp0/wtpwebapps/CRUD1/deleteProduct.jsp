<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.List, cn.techtutorial.connection.DbCon, cn.techtutorial.dao.ProductDao, cn.techtutorial.model.Product" %>
<%
Connection conn = DbCon.getConnection();
ProductDao productDao = new ProductDao(conn);
List<Product> products = productDao.getAllProducts();
%>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Product</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Add custom styles here if needed */
    </style>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this product?");
        }
    </script>
</head>
<body>
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">Product Management</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="addProduct.jsp">Add Product</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="updateProduct.jsp">Update Product</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="deleteProduct.jsp">Delete Product</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Delete Product</h2>
        <table class="table table-striped">
            <thead>
                <tr>
                    <th>Name</th>
                    <th>Category</th>
                    <th>Price</th>
                    <th>Image URL</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%      for(Product product : products) {%>
                <tr>
                    <td><%= product.getName() %></td>
                    <td><%= product.getCategory() %></td>
                    <td><%= product.getPrice() %></td>
                    <td><%= product.getImage() %></td>
                    <td>
                        <form action="create-ubdate-delete" method="post" onsubmit="return confirmDelete()">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= product.getId() %>">
                            <button type="submit" class="btn btn-danger">Delete</button>
                        </form>
                    </td>
                </tr>
                <%
                    }
                %>
            </tbody>
        </table>
    </div>

    <!-- Bootstrap JS (Optional, if you want to use Bootstrap JavaScript features) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>