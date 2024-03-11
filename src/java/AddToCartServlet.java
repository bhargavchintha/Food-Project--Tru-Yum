import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class AddToCartServlet extends HttpServlet {

    /**
     *
     * @param request
     * @param response
     * @throws ServletException
     * @throws IOException
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get the form data
        String itemId = request.getParameter("itemid");
        String itemName = request.getParameter("itemname");
        String itemPrice = request.getParameter("itemprice");
        String image = request.getParameter("image");
        String htmlpage = request.getParameter("link");

        // Insert the details into the database
        if (addItemToCart(itemId, itemName, itemPrice, image, htmlpage)) {
            // Item added successfully
            response.getWriter().write("<p>Item added to cart successfully.</p>");
        } else {
            // Error occurred while adding the item
            response.getWriter().write("<p>Error adding item to cart.</p>");
        }
    }

    private boolean addItemToCart(String itemId, String itemName, String itemPrice, String image, String link) {
        // Database connection details
        String dbUrl = "jdbc:mysql://localhost:3306/signup";
        String dbUser = "root";
        String dbPassword = "root";

        // SQL query to insert the item details
        String insertQuery = "INSERT INTO cart (itemid, itemname, itemprice, image, link) VALUES (?, ?, ?, ?, ?)";

        try {
            // Establish the database connection
            Connection conn = DriverManager.getConnection(dbUrl, dbUser, dbPassword);

            // Create a prepared statement for the insert query
            PreparedStatement stmt = conn.prepareStatement(insertQuery);
            stmt.setString(1, itemId);
            stmt.setString(2, itemName);
            stmt.setString(3, itemPrice);
            stmt.setString(4, image);
            stmt.setString(5, link);

            // Execute the insert statement
            int rowsAffected = stmt.executeUpdate();

            // Close the resources
            stmt.close();
            conn.close();

            // Check if the insert was successful
            return rowsAffected > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
