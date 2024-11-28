<%@ page import="java.sql.*" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cat Form</title>
</head>
<body>
    <%
        Connection con = null;
        Statement stmt = null;
        ResultSet rs = null;
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
            String name = request.getParameter("name");
            String color = request.getParameter("color");
            String hairLength = request.getParameter("hairLength");
            stmt.executeUpdate("INSERT INTO breeds('title', 'color', 'hair_length') VALUES('"+name+"','"+color+"','"+hairLength+"')");

            rs = stmt.executeQuery("SELECT * FROM breeds");
        } catch (SQLException e) {
            out.print("Breed not found");
        }
    %>
    <table>
        <%
            try {
                while (rs.next()) {
        %>
        <tr>
            <%
                for (int i = 1; i < rs.getMetaData().getColumnCount(); i++) {
            %>
        <td>
            <%
                out.print((rs.getString(i)).trim() + ", ");
            %>
        </td>
            <%
                    }
            %>
        </tr>
        <%
                }
            } catch (Exception e) {
                System.out.println("Error retrieving data");
            }
        %>
    </table>
    <%
        try {
            stmt.close();
            con.close();
            System.out.println("Database connections closed");
        } catch (SQLException e) {
            System.out.println("Error closing database");
        }
    %>
    <% if (request.getMethod().equals("GET")) { %>
    <form method="post" action="catform.jsp">
        <label>Enter a cat breed: </label>
        <input type="text" name="name" size="20" maxlength="20"/>
        <label>Enter cat color: </label>
        <input type="text" name="color" size="20" maxlength="20"/>
        <label>Enter hair length: </label>
        <input type="text" name="hairLength" size="20" maxlength="20"/>
        <input type="submit"/>
    </form>
    <% } %>
</body>
</html>
