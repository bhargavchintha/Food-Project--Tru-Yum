// OrderdeleteDAO.java
package Orderitemsdelete;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OrderdeleteDAO {
    private String url;
    private String username;
    private String password;

    public OrderdeleteDAO(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public List<Orderdeleteitems> getOrdersByEmail(String email) {
        List<Orderdeleteitems> orderItems = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM deleteorderitems WHERE LOWER(email) = LOWER(?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, email.trim().toLowerCase());
            rs = stmt.executeQuery();

            while (rs.next()) {
                Orderdeleteitems orderItem = new Orderdeleteitems(
                        rs.getString("orderid"),
                        rs.getString("email"),
                        rs.getString("itemlist"),
                        rs.getString("coupons"),
                        rs.getString("orderaddress"),
                        rs.getString("grandtotalamount"),
                        rs.getString("payment"),
                        rs.getString("randomtime"),
                        rs.getString("date"),
                        rs.getString("clock"),
                        rs.getString("orderstatus"),
                        rs.getString("nameitems"),
                        rs.getString("addresshouse"),
                        rs.getString("addresstype"),
                        rs.getString("drivername"),
                        rs.getString("drivernumber"),
                        rs.getString("subtotal")
                );
                orderItems.add(orderItem);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return orderItems;
    }
    
    public boolean deleteOrderItem(String orderId, String email) {
    Connection conn = null;
    PreparedStatement stmt = null;
    boolean success = false;

    try {
        conn = DriverManager.getConnection(url, username, password);
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
