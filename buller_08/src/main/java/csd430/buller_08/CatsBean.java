package csd430.buller_08;

import java.io.Serializable;
import java.sql.*;

public class CatsBean implements Serializable {
    static Connection connection = null;
    static Statement statement = null;
    static ResultSet resultSet = null;

    public static ResultSet getResultSet(String SQL) throws ClassNotFoundException, SQLException {
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

    public static void closeConnection() throws SQLException {
        try {
            statement.close();
            connection.close();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }

    public static void insertCat(String name, String color, String hairLength) throws ClassNotFoundException, SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/cats","root","pass");
            statement = connection.createStatement();
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }

        try {
            String str = "INSERT INTO breeds VALUES (@name, @color, @hair_length)";
            statement.executeUpdate(str);
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
