<%@page import="cn.techtutorial.model.User"%>
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
<!-- Bootstrap CSS -->
<%@include file="includes/head.jsp"%>
<style>

</style>
</head>
<body>
	<%@include file="includes/navbar.jsp"%>
	<div class="container">
		<h2 class="mt-4">Registration Form</h2>
		<%  // Check if error parameter exists in the URL and display error message accordingly
            String error = request.getParameter("error");
            if (error != null && error.equals("email_exists")) { %>
                <div class="alert alert-danger mt-3" role="alert">
                    Email already exists. Please use a different email.
                </div>
        <% } %>
		<form action="user-registration" method="post" class="mt-4">
			<div class="form-group">
				<label for="name">Name:</label> <input type="text" id="name"
					name="name" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="email">Email:</label> <input type="email" id="email"
					name="email" class="form-control" required>
			</div>
			<div class="form-group">
				<label for="password">Password:</label> <input type="password"
					id="password" name="password" class="form-control" required>
			</div>
			<button type="submit" class="btn btn-primary">Register</button>
		</form>
	</div>
	<!-- <script>
        // Get the value of the 'error' parameter from the URL
        const urlParams = new URLSearchParams(window.location.search);
        const error = urlParams.get('error');

        // If the 'error' parameter is present and equals 'email_exists', display an alert
        if (error === 'email_exists') {
            alert('Email already exists. Please use a different email.');
        }
    </script> -->
</body>
</html>

