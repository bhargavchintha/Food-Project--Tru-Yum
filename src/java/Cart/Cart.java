package Cart;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;


import java.util.ArrayList;
import java.util.List;

public class Cart {
    /**
     * Retrieves a list of cart details associated with the given email.
     *
     * @param email the email to retrieve cart details for
     * @return a list of CartDetails objects representing the cart details
     */
    public List<CartDetails> getCartDetailsByEmail(String email){
        List<CartDetails> cartDetailsList = new ArrayList<>();
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");
            stmt = conn.prepareStatement("SELECT * FROM cart WHERE LOWER(email) = LOWER(?)");
            stmt.setString(1, email.trim().toLowerCase());
            rs = stmt.executeQuery();
            
            // int rowCount = 0;
            while (rs.next()) {
             // rowCount++;
                CartDetails cartDetails = new CartDetails();
                cartDetails.setEmail(rs.getString("email"));
                cartDetails.setItemId(rs.getString("itemid"));
                cartDetails.setItemName(rs.getString("itemname"));
                cartDetails.setItemPrice(rs.getString("itemprice"));
                cartDetails.setImage(rs.getString("image"));
                 cartDetails.setLink(rs.getString("link")); 
                cartDetailsList.add(cartDetails);
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

        return cartDetailsList;
    }

     public boolean deleteCartItem(String email, String itemId) {
        boolean deleted = false;
        try {
            // Initialize the database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");

            // Create the SQL statement to delete the item from the cart
            String sql;
            sql = "DELETE FROM cart WHERE email = ? AND itemId = ?";
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


    

   


