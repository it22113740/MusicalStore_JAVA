package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import model.User;

public class UserDao {
    private Connection con;
    private String query;
    private PreparedStatement pst;

    public UserDao(Connection con) {
        this.con = con;
    }

    public User userLogin(String email, String password) {
        User user = null;
        try {
            query = "SELECT * FROM users WHERE email=? AND password=?";
            pst = this.con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet rs = pst.executeQuery();

            if (rs.next()) {
                user = new User();
                user.setId(rs.getInt("id"));
                user.setName(rs.getString("name"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.print(e.getMessage());
        }
        return user;
    }

    // Method to update user details
    public boolean updateUser(User user) throws SQLException {
        query = "UPDATE users SET name=?, email=? ,password=? WHERE id=?";
        pst = this.con.prepareStatement(query);
        pst.setString(1, user.getName());
        pst.setString(2, user.getEmail());
        pst.setString(3, user.getPassword());
        pst.setInt(4, user.getId());
        int rowsAffected = pst.executeUpdate();
        return rowsAffected > 0;
    }

    // Method to delete user
    public boolean deleteUser(int userId) throws SQLException {
        query = "DELETE FROM users WHERE id=?";
        pst = this.con.prepareStatement(query);
        pst.setInt(1, userId);
        int rowsAffected = pst.executeUpdate();
        return rowsAffected > 0;
    }
}