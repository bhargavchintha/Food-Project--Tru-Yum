/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Orderitemsdelete;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Bhargav
 */
public class Deleteorder {
     private static final String DB_URL = "jdbc:mysql://localhost:3306/signup";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";
    
    public boolean deleteOrderItem(String orderId, String email) {
    Connection conn = null;
    PreparedStatement stmt = null;
    boolean success = false;

    try {
        conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        String sql = "DELETE FROM deleteorderitems WHERE orderid = ? AND LOWER(email) = LOWER(?)";
        stmt = conn.prepareStatement(sql);
        stmt.setString(1, orderId);
        stmt.setString(2, email.trim().toLowerCase());

        int rowsAffected = stmt.executeUpdate();
        success = (rowsAffected > 0);
    } catch (SQLException e) {
        e.printStackTrace();
    } finally {
        // Close resources
        try {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    return success;
}

    
}
