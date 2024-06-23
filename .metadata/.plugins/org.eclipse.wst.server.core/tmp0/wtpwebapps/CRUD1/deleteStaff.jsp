<%@page import="cn.techtutorial.model.Staff"%>
<%@page import="java.util.List"%>
<%@page import="cn.techtutorial.dao.StaffDao"%>
<%@page import="cn.techtutorial.connection.DbCon"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
Connection conn = DbCon.getConnection();
StaffDao staffDao = new StaffDao(conn);
List<Staff> staffs = staffDao.getAllStaff();
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Product</title>
    <!-- Bootstrap CSS -->
    <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* Add custom styles here if needed */
    </style>
    <script>
        function confirmDelete() {
            return confirm("Are you sure you want to delete this Staff?");
        }
    </script>
</head>
<body>
    <!-- Navigation bar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="addStaff.jsp">Staff Management</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item">
                    <a class="nav-link" href="addStaff.jsp">Add Staff</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="ubdateStaff.jsp">Update Staff</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="deleteStaff.jsp">Delete Staff</a>
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
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <%      for(Staff staff : staffs) {%>
                <tr>
                    <td><%= staff.getName() %></td>
                    <td><%= staff.getDepartment() %></td>
                    <td><%= staff.getContactNumber() %></td>
                    <td>
                        <form action="create-ubdate-delete-staff" method="post" onsubmit="return confirmDelete()">
                            <input type="hidden" name="action" value="delete">
                            <input type="hidden" name="id" value="<%= staff.getId() %>">
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