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
 * Servlet implementation class CreateUbdateDeleteProductServlet
 */
@WebServlet("/create-ubdate-delete")
public class CreateUbdateDeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getParameter("action");

        if (action != null) {
            switch (action) {
                case "add":
                    addProduct(request, response);
                    break;
                case "update":
                    updateProduct(request, response);
                    break;
                case "delete":
                    deleteProduct(request, response);
                    break;
                default:
                    response.sendRedirect("index.jsp");
                    break;
            }
        } else {
            response.sendRedirect("index.jsp");
        }
	}
	private void addProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve product details from request parameters
        String name = request.getParameter("name");
        String category = request.getParameter("category");
        double price = Double.parseDouble(request.getParameter("price"));
        String image = request.getParameter("image");

        // Insert into the database
        try {
            Connection con = DbCon.getConnection();
            PreparedStatement pst = con.prepareStatement("INSERT INTO products (name, category, price, image) VALUES (?, ?, ?, ?)");
            pst.setString(1, name);
            pst.setString(2, category);
            pst.setDouble(3, price);
            pst.setString(4, image);
            pst.executeUpdate();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        response.sendRedirect("addProduct.jsp");
    }
	 private void updateProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));
	        String name = request.getParameter("name");
	        String category = request.getParameter("category");
	        double price = Double.parseDouble(request.getParameter("price"));
	        String image = request.getParameter("image");

	        // Update product details in the database
	        try {
	            Connection con = DbCon.getConnection();
	            PreparedStatement pst = con.prepareStatement("UPDATE products SET name=?, category=?, price=?, image=? WHERE id=?");
	            pst.setString(1, name);
	            pst.setString(2, category);
	            pst.setDouble(3, price);
	            pst.setString(4, image);
	            pst.setInt(5, id);
	            pst.executeUpdate();
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        }

	        response.sendRedirect("updateProduct.jsp");
	    }
	 private void deleteProduct(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        int id = Integer.parseInt(request.getParameter("id"));

	        // Delete product from the database
	        try {
	            Connection con = DbCon.getConnection();
	            PreparedStatement pst = con.prepareStatement("DELETE FROM products WHERE id=?");
	            pst.setInt(1, id);
	            pst.executeUpdate();
	        } catch (SQLException | ClassNotFoundException e) {
	            e.printStackTrace();
	        }

	        response.sendRedirect("deleteProduct.jsp");
	    }

}
