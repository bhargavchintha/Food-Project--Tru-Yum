package ForgotPasswordDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ForgotPasswordDao {

    private String databaseURL = "jdbc:mysql://localhost:3306/signup";
    private String username = "root";
    private String password = "root";

    public boolean resetPassword(String email, String pin, String password) {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection conn = DriverManager.getConnection(databaseURL, username, password);

            // Verify that the connection was successful
            if (conn != null) {
                System.out.println("Connected to the database");
            } else {
                System.out.println("Failed to connect to the database");
            }

            // Check if the email and pin are valid
            PreparedStatement ps1 = conn.prepareStatement("SELECT * FROM signu WHERE email = ? AND pin = ?");
            ps1.setString(1, email);
            ps1.setString(2, pin);
            ResultSet rs = ps1.executeQuery();

            if (rs.next()) {
                // Update the user's password in the database
                PreparedStatement ps2 = conn.prepareStatement("UPDATE signu SET password = ? WHERE email = ? AND pin = ?");
                ps2.setString(1, password);
                ps2.setString(2, email);
                ps2.setString(3, pin);
                int updateCount = ps2.executeUpdate();

                if (updateCount == 1) {
                    System.out.println("Password updated successfully");
                    return true;
                } else {
                    System.out.println("Password update failed");
                    return false;
                }
            } else {
                System.out.println("Invalid email or pin");
                return false;
            }

        } catch (SQLException | ClassNotFoundException ex) {
            System.out.println("Exception in resetPassword() method: " + ex.getMessage());
            return false;
        }
    }
}
