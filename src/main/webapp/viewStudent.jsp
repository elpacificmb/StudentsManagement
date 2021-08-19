<%-- 
    Document   : viewStudent
    Created on : Jul 10, 2021, 6:48:35 PM
    Author     : ELPACIFIC
--%>

<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>View Student</title>

        <!-- Bootstrap CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

    </head>
    <body>

        <div class="form-group">
            <div  class="col-sm-4"></div>
            <div  class="col-sm-4">
                <h2 style="text-align: center">Student Details</h2>
            </div>
        </div>
        <div class="col-sm-2">
            <a href="index.jsp"><Button class="btn btn-success" style="width: 80px;">Home</Button></a>
        </div>
        <table class="table table-hover">
            <thead>
                <tr>
                    <th scope="col">Student ID</th>
                    <th scope="col">First Name</th>
                    <th scope="col">Last Name</th>
                    <th scope="col">Gender</th>
                    <th scope="col">Marks</th>
                    <th scope="col">Grade</th>

                </tr>
            </thead>
            <tbody>
                <%
                    Connection con;
                    PreparedStatement pst;
                    ResultSet rs;
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost/mis", "root", "");

                    String query = "SELECT * FROM student";
                    pst = con.prepareStatement(query);
                    rs = pst.executeQuery();

                    while (rs.next()) {
                %>
                <tr>
                    <th scope="row"><%= rs.getString("studentID")%></th>
                    <td><%=rs.getString("firstName")%></td>
                    <td><%=rs.getString("lastName")%></td>
                    <td><%=rs.getString("gender")%></td>
                    <td><%=rs.getString("marks")%></td>
                    <td><%=rs.getString("grade")%></td>

                    <td><a class="btn btn-success" href="editStudent.jsp?id=<%=rs.getString("studentID")%>" role="button">Edit</a><a class="btn btn-danger" href="removeStudent.jsp?id=<%=rs.getString("studentID")%>" role="button">Delete</a></td>
                </tr>
                <% }%>	

            </tbody>
        </table>

        <!-- JavaScript: Bootstrap Bundle with Popper -->
        <script src="js/bootstrap.bundle.min.js" ></script>
    </body>
</html>

