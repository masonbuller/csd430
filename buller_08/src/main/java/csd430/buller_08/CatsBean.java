package csd430.buller_08;

import java.io.Serializable;
import java.sql.*;

public class CatsBean implements Serializable {
    Connection connection = null;
    Statement statement = null;
    ResultSet resultSet = null;

    public ResultSet getResultSet(String SQL) throws ClassNotFoundException, SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cats","root","pass");
            statement = connection.createStatement();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        try {
            resultSet = statement.executeQuery(SQL);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        return resultSet;
    }

    public void closeConnection() throws SQLException {
        try {
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
