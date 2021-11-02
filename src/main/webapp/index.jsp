<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"  %>
<%
    if(request.getParameter("submit") != null){
        final String INSERT_SQL = "INSERT INTO studd (sname, course, fee) VALUES (?,?,?);";

        String name = request.getParameter("sname");
        String course = request.getParameter("course");
        String fee = request.getParameter("fee");

        String url = "jdbc:postgresql://localhost:5432/demo";
        String user = "postgres";
        String pw = "azoo";

        Connection conn;
        PreparedStatement prepStatement;
        ResultSet resultSet;

        try {
            Class.forName("org.postgresql.Driver");
            conn = DriverManager.getConnection(url, user, pw);
            prepStatement = conn.prepareStatement(INSERT_SQL);
            prepStatement.setString(1, name);
            prepStatement.setString(2, course);
            prepStatement.setString(3, fee);
            prepStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>

<!DOCTYPE html>
<html>
<head>
    <title>JSP - Hello World</title>
    <link href="css/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
    <link href="css/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="css/base.css" type="text/css">
</head>
<body>
<h1>Student Registration system Crud using-JSP</h1>

<div class="row">
    <div class="col-sm-4">
        <form action="#" method="post">
            <div alight = "left">
                <label class="form-label">Student Name</label>
                <input class="form-control" type="text" placeholder="Student Name" name = "sname" id = "sname" required>
            </div>
            <div alight = "left">
                <label class="form-label">Course</label>
                <input class="form-control" type="text" placeholder="Course" name = "course" id = "course" required>
            </div>
            <div alight = "left">
                <label class="form-label">Fee</label>
                <input class="form-control" type="text" placeholder="Fee" name = "fee" id = "fee" required>
            </div>
            <div alight = "right">
                <input type="submit" id="submit" value="submit" name="submit" class="btn btn-info">
                <input type="reset" id="reset" value="reset" name="reset" class="btn btn-warning">
            </div>
        </form>
    </div>

    <div class="col-sm-8">
        <div class="panel-body">
            <table id="tbl-student" class="table table-responsive table-bordered">
                <thead></thead>
                <tr>
                    <th>Student Name</th>
                    <th>Course</th>
                    <th>Fee</th>
                    <th>Edit</th>
                    <th>Delete</th>
                </tr>

                <%
                    Connection conn;
                    PreparedStatement prepStatement;
                    ResultSet resultSet;

                    String url = "jdbc:postgresql://localhost:5432/demo";
                    String user = "postgres";
                    String pw = "azoo";

                    final String SELECT_SQL = "SELECT * FROM studd;";

                    try {
                        Class.forName("org.postgresql.Driver");
                        conn = DriverManager.getConnection(url, user, pw);
                        Statement statement = conn.createStatement();
                        resultSet = statement.executeQuery(SELECT_SQL);

                        while(resultSet.next()){
                            String id = resultSet.getString("id");
                            String name = resultSet.getString("sname");
                            String course = resultSet.getString("course");
                            String fee = resultSet.getString("fee");
                        %>
                        <tr>
                            <td><%=name%></td>
                            <td><%=course%></td>
                            <td><%=fee%></td>
                            <td><a href="update.jsp?id=<%=id%>">Edit</a></td>
                            <td><a href="delete.jsp?id=<%=id%>">Delete</a></td>
                        </tr>
                <%
                        }
                    } catch(SQLException e){
                        e.printStackTrace();
                    }
                %>

            </table>
        </div>
    </div>
</div>
</body>
</html>