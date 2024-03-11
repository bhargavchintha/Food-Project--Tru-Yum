package pin;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class pin {
    public UserDetails getUserDetailsByEmail(String email) {
        UserDetails userDetails = null;
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");
            stmt = conn.prepareStatement("SELECT * FROM signu WHERE email = ?");
                stmt.setString(1, email);
               rs = stmt.executeQuery();

            if (rs.next()) {
                userDetails = new UserDetails(rs.getString("name"), rs.getString("email"), rs.getString("pin"), rs.getString("option1"), rs.getString("inputone"), rs.getString("option2"), rs.getString("inputtwo"), rs.getString("option3"), rs.getString("inputthree"));
            }
        } catch (SQLException e) {
        } finally {
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
            }
        }

        return userDetails;
    }
}
