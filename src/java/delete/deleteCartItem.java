/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delete;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
/**
 *
 * @author Bhargav
 */
public class deleteCartItem {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/signup";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

   public boolean deleteCartItem(String email, String itemId) {
    boolean deleted = false;
    try {
        // Initialize the database connection
        Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

        // Create the SQL statement to delete the item from the cart
        String sql = "DELETE FROM cart WHERE email = ? AND itemId = ?";
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



