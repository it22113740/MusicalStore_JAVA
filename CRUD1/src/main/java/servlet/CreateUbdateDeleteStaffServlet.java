package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import connection.DbCon;

/**
 * Servlet implementation class CreateUbdateDeleteStaffServlet
 */
@WebServlet("/create-ubdate-delete-staff")
public class CreateUbdateDeleteStaffServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

	    if (action != null) {
	        switch (action) {
	            case "add":
	                addStaff(request, response);
	                break;
	            case "update":
	                updateStaff(request, response);
	                break;
	            case "delete":
	                deleteStaff(request, response);
	                break;
	            default:
	                response.sendRedirect("index.jsp");
	                break;
	        }
	    } else {
	        response.sendRedirect("index.jsp");
	    }
	}

private void addStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    // Retrieve staff details from request parameters
    String name = request.getParameter("name");
    String department = request.getParameter("department");
    String contactNumber = request.getParameter("contactNumber");

    // Insert into the database
    try {
        Connection con = DbCon.getConnection();
        PreparedStatement pst = con.prepareStatement("INSERT INTO staff (name, department, contactNumber) VALUES (?, ?, ?)");
        pst.setString(1, name);
        pst.setString(2, department);
        pst.setString(3, contactNumber);
        pst.executeUpdate();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    response.sendRedirect("addStaff.jsp");
}

private void updateStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));
    String name = request.getParameter("name");
    String department = request.getParameter("department");
    String contactNumber = request.getParameter("contactNumber");

    // Update staff details in the database
    try {
        Connection con = DbCon.getConnection();
        PreparedStatement pst = con.prepareStatement("UPDATE staff SET name=?, department=?, contactNumber=? WHERE id=?");
        pst.setString(1, name);
        pst.setString(2, department);
        pst.setString(3, contactNumber);
        pst.setInt(4, id);
        pst.executeUpdate();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    response.sendRedirect("ubdateStaff.jsp");
}

private void deleteStaff(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int id = Integer.parseInt(request.getParameter("id"));

    // Delete staff member from the database
    try {
        Connection con = DbCon.getConnection();
        PreparedStatement pst = con.prepareStatement("DELETE FROM staff WHERE id=?");
        pst.setInt(1, id);
        pst.executeUpdate();
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
    }

    response.sendRedirect("deleteStaff.jsp");
}

}
