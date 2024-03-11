package Address;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class Address {
    private static final String DB_URL = "jdbc:mysql://localhost:3306/signup";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    public boolean insertAddress(AddressDetails addressDetails) {
        boolean inserted = false;

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement checkStatement = conn.prepareStatement("SELECT * FROM address WHERE cnname = ? AND addresslabel = ?")) {
            checkStatement.setString(1, addressDetails.getCnName());
            checkStatement.setString(2, addressDetails.getAddressLabel());
            ResultSet resultSet = checkStatement.executeQuery();

            if (resultSet.next()) {
                // Entry already exists
                System.out.println("Entry already exists for this Address name and address label!");
            } else {
                String insertQuery = "INSERT INTO address (cnname, email, houseno, buildingname, villagetown, city, state, pincode, phoneno, addresslabel) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
                try (PreparedStatement insertStatement = conn.prepareStatement(insertQuery)) {
                    insertStatement.setString(1, addressDetails.getCnName());
                    insertStatement.setString(2, addressDetails.getEmail());
                    insertStatement.setString(3, addressDetails.getHouseNo());
                    insertStatement.setString(4, addressDetails.getBuildingName());
                    insertStatement.setString(5, addressDetails.getVillageTown());
                    insertStatement.setString(6, addressDetails.getCity());
                    insertStatement.setString(7, addressDetails.getState());
                    insertStatement.setString(8, addressDetails.getPincode());
                    insertStatement.setString(9, addressDetails.getPhoneNo());
                    insertStatement.setString(10, addressDetails.getAddressLabel());

                    int rowsInserted = insertStatement.executeUpdate();

                    if (rowsInserted > 0) {
                        inserted = true;
                        System.out.println("Data inserted successfully!");
                    } else {
                        System.out.println("Failed to insert data!");
                    }
                }
            }

            resultSet.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return inserted;
    }

    public List<AddressDetails> getAddressDetailsByEmail(String email) {
        List<AddressDetails> addressDetailsList = new ArrayList<>();

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement stmt = conn.prepareStatement("SELECT * FROM address WHERE LOWER(email) = LOWER(?)")) {
            stmt.setString(1, email.trim().toLowerCase());
            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                AddressDetails addressDetails = new AddressDetails();
                addressDetails.setEmail(rs.getString("email"));
                addressDetails.setCnName(rs.getString("cnname"));
                addressDetails.setHouseNo(rs.getString("houseno"));
                addressDetails.setBuildingName(rs.getString("buildingname"));
                addressDetails.setVillageTown(rs.getString("villagetown"));
                addressDetails.setCity(rs.getString("city"));
                addressDetails.setState(rs.getString("state"));
                addressDetails.setPincode(rs.getString("pincode"));
                addressDetails.setPhoneNo(rs.getString("phoneno"));
                addressDetails.setAddressLabel(rs.getString("addresslabel"));
                addressDetailsList.add(addressDetails);
            }

            rs.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return addressDetailsList;
    }

    public boolean updateAddress(AddressDetails updatedAddress) {
        boolean updated = false;

        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
             PreparedStatement updateStatement = conn.prepareStatement("UPDATE address SET houseno = ?, buildingname = ?, villagetown = ?, city = ?, state = ?, pincode = ?, phoneno = ?, addresslabel = ? WHERE cnname = ? AND email = ?")) {
            updateStatement.setString(1, updatedAddress.getHouseNo());
            updateStatement.setString(2, updatedAddress.getBuildingName());
            updateStatement.setString(3, updatedAddress.getVillageTown());
            updateStatement.setString(4, updatedAddress.getCity());
            updateStatement.setString(5, updatedAddress.getState());
            updateStatement.setString(6, updatedAddress.getPincode());
            updateStatement.setString(7, updatedAddress.getPhoneNo());
            updateStatement.setString(8, updatedAddress.getAddressLabel());
            updateStatement.setString(9, updatedAddress.getCnName());
            updateStatement.setString(10, updatedAddress.getEmail());

            int rowsUpdated = updateStatement.executeUpdate();

            if (rowsUpdated > 0) {
                updated = true;
                System.out.println("Data updated successfully!");
            } else {
                System.out.println("Failed to update data!");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return updated;
    }
}
