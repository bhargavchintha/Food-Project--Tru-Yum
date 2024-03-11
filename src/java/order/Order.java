package order;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import java.util.ArrayList;
import java.util.List;

public class Order {
    /**
     * Retrieves a list of order details associated with the given email.
     *
     * @param email the email to retrieve order details for
     * @return a list of OrderDetails objects representing the order details
     */
    public List<orderDetails> getOrderDetailsByEmail(String email) {
        List<orderDetails> orderDetailsList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");
            stmt = conn.prepareStatement("SELECT * FROM `order` WHERE LOWER(email) = LOWER(?)");
            stmt.setString(1, email.trim().toLowerCase());
            rs = stmt.executeQuery();

            while (rs.next()) {
                orderDetails orderDetails = new orderDetails();
                orderDetails.setEmail(rs.getString("email"));
                orderDetails.setItemId(rs.getString("itemid"));
                orderDetails.setItemName(rs.getString("itemname"));
                orderDetails.setItemPrice(rs.getString("itemprice"));
                orderDetails.setImage(rs.getString("image"));
                orderDetails.setLink(rs.getString("link")); 
                orderDetailsList.add(orderDetails);
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

        return orderDetailsList;
    }

    public boolean deleteOrderItem(String email, String itemId) {
        boolean deleted = false;
        try {
            // Initialize the database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");

            // Create the SQL statement to delete the item from the orders
            String sql;
            sql = "DELETE FROM `order` WHERE email = ? AND itemid = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, itemId);

            // Execute the SQL statement and check if the deletion was successful
            int rowsDeleted = statement.executeUpdate();
            if (rowsDeleted > 0) {
                deleted = true;
            }

            // Close the database connection and the statement
            statement.close();
            conn.close();
        } catch (SQLException e) {
            // Handle any SQL exceptions
            e.printStackTrace();
        }
        return deleted;
    }
}
