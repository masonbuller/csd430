<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <title>JDBC Connector</title>
    </head>
    <body>
        <%
            Connection con = null;
            Statement stmt = null;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                String url = "jdbc:mysql://localhost:3306/cats";

                con = DriverManager.getConnection(url,"root","pass");
                stmt = con.createStatement();

                stmt = con.createStatement();
            } catch (SQLException e) {
                System.out.println("Connection failed");
            }

            try {
                String sql = "CREATE TABLE breeds (id INTEGER NOT NULL AUTO_INCREMENT, title VARCHAR(50), color VARCHAR(50), hair_length VARCHAR(20), PRIMARY KEY (id))";
                stmt.executeUpdate(sql);
                System.out.println("table created");
            } catch (Exception e) {
                System.out.println("Table creation failed");
            }

            try {
                String sql = "INSERT INTO breeds (title, color, hair_length) VALUES ('Siamese', 'Cream', 'Short'), ('Russian Blue', 'Blue', 'Short'), " +
                        "('Bombay', 'Black', 'Short'), ('Persian', 'Mixed', 'Long')";
                stmt.executeUpdate(sql);
                System.out.println("Data insert successful");
            } catch (SQLException e) {
                System.out.println("Data insert failed");
        }
        %>
    </body>
</html>


// Write two jsps
// first creates a database table and populates the table with data
// second displays a form in the doGet method

// The form will contain a post action that directs the form post back to the same JSP,
// which in the doPost method will save the form data to a database using a JavaBean,
// respond back with a query from the database displaying all the current records in an appealing format.
// The form must contain a minimum of 3 input fields.