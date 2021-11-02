<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@page import="java.sql.*"  %>
<%
    if(request.getParameter("submit") != null){
        final String UPDATE_SQL = "UPDATE studd SET sname=?, course=?, fee=? WHERE id =?;";
        int id = Integer.parseInt(request.getParameter("id"));
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
            prepStatement = conn.prepareStatement(UPDATE_SQL);
            prepStatement.setString(1, name);
            prepStatement.setString(2, course);
            prepStatement.setString(3, fee);
            prepStatement.setInt(4, id);
            prepStatement.executeUpdate();
            System.out.println(prepStatement);
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
    <h1>Student Update</h1>
    <div class="row">
        <div class="col-sm-4">
            <form action="#" method="post">
            <%
                final String SELECT_SQL = "SELECT * FROM studd WHERE id = ? ;";

                String url = "jdbc:postgresql://localhost:5432/demo";
                String user = "postgres";
                String pw = "azoo";

                Connection conn;
                PreparedStatement prepSt;
                ResultSet rs;

                try {
                    Class.forName("org.postgresql.Driver");
                    conn = DriverManager.getConnection(url, user, pw);
                    int id = Integer.parseInt(request.getParameter("id"));
                    prepSt = conn.prepareStatement(SELECT_SQL);
                    prepSt.setInt(1, id);
                    rs = prepSt.executeQuery();

                    while(rs.next()){
            %>
                    <div alight="left">
                        <label class="form-label">Student Name</label>
                        <input type="text" class="form-control" placeholder="Student Name" value="<%=rs.getString("sname")%>" name="sname" id="sname" required>

                    </div>
                    <div alight="left">
                        <label class="form-label">Course</label>
                        <input type="text" class="form-control" placeholder="Course" value="<%=rs.getString("course")%>" name="course" id="course" required>
                    </div>
                    <div alight="left">
                        <label class="form-label">Fee</label>
                        <input type="text" class="form-control" placeholder="Fee" value="<%=rs.getString("fee")%>" name="fee" id="fee" required>
                    </div>
            <%
                        } // end: while-loop
                    } catch(SQLException e){
                        e.printStackTrace();
                    }
            %>

                <div class="d-flex justify-content-start">
                    <input type="submit" id="submit" name="submit" value="submit" class="btn btn-info">
                    <input type="reset" id="reset" name="reset" value="reset" class="btn btn-warning">
                </div>
                <div class="d-flex justify-content-start">
                    <p><a href="index.jsp">Click Back</a></p>
                </div>
            </form>
        </div>
    </div>
</body>
</html>