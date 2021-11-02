<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="java.sql.*"  %>
<%
    final String DELETE_SQL = "DELETE FROM studd WHERE id =?;";

    String url = "jdbc:postgresql://localhost:5432/demo";
    String user = "postgres";
    String pw = "azoo";

    Connection conn;
    PreparedStatement prepStatement;
    ResultSet resultSet;

    try {
        Class.forName("org.postgresql.Driver");
        conn = DriverManager.getConnection(url, user, pw);

        int id = Integer.parseInt(request.getParameter("id"));

        prepStatement = conn.prepareStatement(DELETE_SQL);
        prepStatement.setInt(1, id);
        prepStatement.executeUpdate();

        System.out.println(prepStatement);
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
