package UserDAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class UserDAO {
    private String jdbcURL;
    private String jdbcUsername;
    private String jdbcPassword;
    private Connection jdbcConnection;

    public UserDAO(String jdbcURL, String jdbcUsername, String jdbcPassword) {
        this.jdbcURL = jdbcURL;
        this.jdbcUsername = jdbcUsername;
        this.jdbcPassword = jdbcPassword;
    }

    public boolean checkUser(String email, String password) throws SQLException {
        String sql = "SELECT * FROM signu WHERE email = ? AND password = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);

        ResultSet resultSet = statement.executeQuery();

        boolean result = resultSet.next();

        resultSet.close();
        statement.close();
        disconnect();

        return result;
    }

    public User getUser(String email, String password) throws SQLException {
        String sql = "SELECT * FROM signu WHERE email = ? AND password = ? AND phone = ?";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, email);
        statement.setString(2, password);

        ResultSet resultSet = statement.executeQuery();

        User user = null;
        if (resultSet.next()) {
            String name = resultSet.getString("name");
            String phone = resultSet.getString("phone");
            String option1 = resultSet.getString("option1");
            String inputone = resultSet.getString("inputone");
            String option2 = resultSet.getString("option2");
            String inputtwo = resultSet.getString("inputtwo");
            String option3 = resultSet.getString("option3");
            String inputthree = resultSet.getString("inputthree");
            int pin = resultSet.getInt("pin");
            user = new User(name, email, pin, option1, inputone, option2, inputtwo, option3, inputthree, phone, password);
        }

        resultSet.close();
        statement.close();
        disconnect();

        return user;
    }

    public boolean addUser(String name, String email, String phone, String password, int pin, String option1, String inputone, String option2, String inputtwo, String option3, String inputthree) throws SQLException {
        String sql = "INSERT INTO signu (name, email, phone, password, pin, option1, inputone, option2, inputtwo, option3, inputthree) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        connect();

        PreparedStatement statement = jdbcConnection.prepareStatement(sql);
        statement.setString(1, name);
        statement.setString(2, email);
        statement.setString(3, phone);
        statement.setString(4, password);
        statement.setInt(5, pin);
        statement.setString(6, option1);
        statement.setString(7, inputone);
        statement.setString(8, option2);
        statement.setString(9, inputtwo);
        statement.setString(10, option3);
        statement.setString(11, inputthree);

        boolean result = statement.executeUpdate() > 0;

        statement.close();
        disconnect();

        return result;
    }

    private void connect() throws SQLException {
        if (jdbcConnection == null || jdbcConnection.isClosed()) {
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
            } catch (ClassNotFoundException e) {
                throw new SQLException(e);
            }

            jdbcConnection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        }
    }

    private void disconnect() throws SQLException {
        if (jdbcConnection != null && !jdbcConnection.isClosed()) {
            jdbcConnection.close();
        }
    }
}
