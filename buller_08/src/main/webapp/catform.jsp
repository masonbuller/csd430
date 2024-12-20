<%@ page import="java.sql.*, csd430.buller_08.CatsBean.*" %>
<%@ page import="csd430.buller_08.CatsBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Cat Form</title>
    <style>
        table {
            border: 1px solid black;
            padding: 10px;
        }
        td {
            border: 1px solid black;
            padding: 10px
        }
        th {
            border: 1px solid black;
            padding: 10px;
        }
        form {
            padding: 10px;
        }
        p {
            padding: 5px;
        }
    </style>
</head>
<body>
    <%
        ResultSet rs = null;
        if (request.getMethod().equals("POST")) {
    %>
    <jsp:useBean id="cats" class="csd430.buller_08.Cats" scope="session">
        <jsp:setProperty name="cats" property="*"/>
    </jsp:useBean>
    <%
            try {
                CatsBean.insertCat(cats.getName(), cats.getColor(), cats.getHairLength());
            } catch (SQLException e) {
                System.out.println(e);
                out.print("Error inserting data");
            }
            try {
                 rs = CatsBean.getResultSet("SELECT * FROM breeds");
            } catch (SQLException e) {
                System.out.println(e);
                out.print("Breed not found");
            }
    %>
    <table>
        <tr>
            <td>Breed</td>
            <td>Color</td>
            <td>Hair Length</td>
        </tr>
        <%
            try {
                while (rs.next()) {
        %>
        <tr>
            <%
                for (int i = 1; i <= rs.getMetaData().getColumnCount(); i++) {
            %>
        <td>
            <%
                out.print((rs.getString(i)).trim());
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
                CatsBean.closeConnection();
                System.out.println("Database connections closed");
            } catch (SQLException e) {
                System.out.println("Error closing database");
            }
        }
    %>
    <% if (request.getMethod().equals("GET")) { %>
    <form method="post" action="catform.jsp">
        <h2>Cat Form</h2>
        <p>
            <label>Enter a cat breed: </label>
            <input type="text" name="name" size="20" maxlength="20"/>
        </p>
        <p>
            <label>Enter cat color: </label>
            <input type="text" name="color" size="20" maxlength="20"/>
        </p>
        <p>
            <label>Enter hair length: </label>
            <input type="text" name="hairLength" size="20" maxlength="20"/>
        </p>
        <br>
        <input type="submit"/>
    </form>
    <% } %>
</body>
</html>
