<%@ page contentType="text/html;charset=UTF-8" %>
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
<script>
    alert("Delete the data!");
</script>
<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/base.css" type="text/css">
</head>
<body>
<h1>Student Deleted</h1>
<div alight="right">
    <p><a href="index.jsp">Click Back</a></p>
</div>
</body>
</html>