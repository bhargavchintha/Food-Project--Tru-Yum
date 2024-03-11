/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package delete;

/**
 *
 * @author Bhargav
 */
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class deleteAddress {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/signup";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public boolean deleteAddress(String email, String cnname, String addresslabel) {
        boolean deleted = false;
        try {
            // Initialize the database connection
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            // Create the SQL statement to delete the address
            String sql = "DELETE FROM `address` WHERE email = ? AND cnname = ? AND addresslabel = ?";
            PreparedStatement statement = conn.prepareStatement(sql);
            statement.setString(1, email);
            statement.setString(2, cnname);
            statement.setString(3, addresslabel);

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


