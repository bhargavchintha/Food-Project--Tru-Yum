package Address;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class AddressUpdate {
    public static void main(String[] args) {
        if (args.length != 11) {
            System.out.println("Invalid number of arguments. Usage: java Address.AddressUpdate email cnname addresslabel houseno buildingname villagetown city state pincode phonno");
            return;
        }

        String email = args[0];
        String cnname = args[1];
        String addresslabel = args[2];
        String houseno = args[3];
        String buildingname = args[4];
        String villagetown = args[5];
        String city = args[6];
        String state = args[7];
        String pincode = args[8];
        String phonno = args[9];
        
        try {
            // Establish database connection
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/signup", "root", "root");

            // Prepare the SQL statement to update the existing entry
            String sql = "UPDATE address SET houseno = ?, buildingname = ?, villagetown = ?, city = ?, state = ?, pincode = ?, phoneno = ?, addresslabel = ? WHERE email = ? AND cnname = ?";
            PreparedStatement updateStatement = conn.prepareStatement(sql);
            updateStatement.setString(1, houseno);
            updateStatement.setString(2, buildingname);
            updateStatement.setString(3, villagetown);
            updateStatement.setString(4, city);
            updateStatement.setString(5, state);
            updateStatement.setString(6, pincode);
            updateStatement.setString(7, phonno);
            updateStatement.setString(8, addresslabel);
            updateStatement.setString(9, email);
            updateStatement.setString(10, cnname);

            // Execute the update query
            int rowsUpdated = updateStatement.executeUpdate();

            if (rowsUpdated > 0) {
                System.out.println("Data updated successfully!");
            } else {
                System.out.println("Failed to update data!");
            }

            updateStatement.close();
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
